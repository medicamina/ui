import 'dart:async';

class MedicaminaAuthLoadingState {
  static late bool loading;
  static StreamController<bool> controller = StreamController<bool>.broadcast();

  MedicaminaAuthLoadingState() {
    setLoading(false);
  }

  void setLoading(bool _loading) {
    loading = _loading;
    controller.add(loading);
  }

  bool getLoading() {
    return loading;
  }

  Stream getStream() {
    return controller.stream;
  }
}
