
class MedicaminaDashSettingsAccountState {
  String? firstName;
  String? middleName;
  String? lastName;
  DateTime? dob;
  String phoneNumber = '';
  String? gender = '';
  String birthCity = '';
  String birthState = '';
  String birthCountry = '';

  MedicaminaDashSettingsAccountState() {}

  bool isEmpty() {
    if (firstName?.isEmpty ?? true) {
      return true;
    }
    if (lastName?.isEmpty ?? true) {
      return true;
    }
    return false;
  }
}