import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

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

  void sortDrugs() {

  }

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