class GlobalState {
  final Map<dynamic, dynamic> _data = <dynamic, dynamic>{};

  static GlobalState instance = GlobalState._();

  GlobalState._();

  set(key, value) => _data[key] = value;
  get(key) => _data[key];
}