import 'dart:async';

class MedicaminaAuthLoadingState {
  MedicaminaAuthLoadingState();

  static bool loading = false;
  static StreamController<bool> controller = StreamController<bool>.broadcast();

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
