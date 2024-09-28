import 'dart:convert';

import 'package:community_material_icon/community_material_icon.dart';
import 'package:dio/dio.dart';
import 'package:event/event.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:medicamina_ui/states.dart';

class MedicaminaDrug {
  String _name = '';
  String _time = '';
  String _dosage = '';
  bool _taken = false;
  IconData _icon;

  MedicaminaDrug(this._name, this._time, this._dosage, this._icon);

  String getName() {
    return _name;
  }

  String getTime() {
    return _time;
  }

  String getDosage() {
    return _dosage;
  }

  IconData getIcon() {
    return _icon;
  }

  void setTaken(val) {
    _taken = val;
  }

  bool getTaken() {
    return _taken;
  }
}

class MedicaminaTodaysDrugs {
  final _drugs = <MedicaminaDrug>[];

  MedicaminaTodaysDrugs() {
    _drugs.add(MedicaminaDrug('Aspirin', '8 AM', '2mg', CommunityMaterialIcons.pill));
    _drugs.add(MedicaminaDrug('Insulin', '11 PM', '1mg', CommunityMaterialIcons.needle));
    _drugs.add(MedicaminaDrug('Metoprolol', '10 AM', '3mg', CommunityMaterialIcons.pill));
    _drugs.add(MedicaminaDrug('Reitnol', '8 AM', '0.5mg', CommunityMaterialIcons.lotion_outline));

    // _drugs.add(MedicaminaDrug('Adderall', '8 AM', '0.5mg', CommunityMaterialIcons.pill));
  }

  void sortDrugs() {}

  List<MedicaminaDrug> getDrugs() {
    return _drugs;
  }
}

class MedicaminaScript {
  MedicaminaDrug? drug;
}

class MedicaminaScripts {
  var _scripts = <MedicaminaScript>[];
}

class HttpError implements Exception {
  final String msg;
  const HttpError(this.msg);
  String toString() => 'FooException: $msg';
}

class MedicmainaPersonalDetails {
  String? firstName;
  String? middleName;
  String? lastName;
  DateTime? dob;
  String? gender;
  String? bloodType;
  double? height;
  double? weight;
  Event emitter = Event();
  final dio = Dio();
  // static bool lock = false;

  MedicmainaPersonalDetails();

  bool isEmpty() {
    if (firstName?.isEmpty ?? true) {
      return true;
    }
    if (lastName?.isEmpty ?? true) {
      return true;
    }
    return false;
  }

  void getData() async {
    if (!isEmpty()) {
      return emitter.broadcast();
    }
    const url = kReleaseMode ? 'https://medicamina.azurewebsites.net/dash/home/personal' : 'http://localhost:8080/dash/home/personal';
    var response = await dio.get(
      url,
      options: Options(
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': await Modular.get<MedicaminaUserState>().getToken() as String,
        },
        validateStatus: (status) {
          return true;
        },
      ),
    );
    if (response.statusCode == 200) {
      if (response.data['firstName'] == null || response.data['lastName'] == null) {
        return emitter.broadcast();
      }
      firstName = response.data['firstName'];
      middleName = response.data['middleName'];
      lastName = response.data['lastName'];
      gender = response.data['gender'];
      dob = DateTime.parse(response.data['dob']);
      bloodType = response.data['bloodType'];
      height = response.data['height'].toDouble();
      weight = response.data['weight'].toDouble();
      return emitter.broadcast();
    }
    throw HttpError(response.data);
  }
}
