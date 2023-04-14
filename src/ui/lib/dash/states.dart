class MedicaminaDrug {
  String _name = '';
  String _time = '';
  String _dosage = '';
  bool _taken = false;

  MedicaminaDrug(this._name, this._time, this._dosage);

  String getName() {
    return _name;
  }

  String getTime() {
    return _time;
  }

  String getDosage() {
    return _dosage;
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
    _drugs.add(MedicaminaDrug('Aspirin', '8 AM', '2mg'));
    _drugs.add(MedicaminaDrug('Xanax', '11 PM', '1mg'));
    _drugs.add(MedicaminaDrug('Metoprolol', '10 AM', '3mg'));
    _drugs.add(MedicaminaDrug('Adderall', '8 AM', '0.5mg'));
  }

  void sortDrugs() {

  }

  List<MedicaminaDrug> getDrugs() {
    return _drugs;
  }

}

class MedicaminaScripts {

}