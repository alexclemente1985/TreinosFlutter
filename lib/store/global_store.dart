class GlobalStore {
  final Map<dynamic, dynamic> _data = <dynamic, dynamic>{};

  static GlobalStore instance = GlobalStore._();

  GlobalStore._();

  set(key, value) => _data[key] = value;
  get(key) => _data[key];
}