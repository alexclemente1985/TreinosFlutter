import 'dart:async';

class LoadingService {
  StreamController<bool> _streamController = StreamController<bool>();

  Stream<bool> get loadingStream => _streamController.stream;

  void setLoading(bool isLoading) {
    // TODO: implement isLoading
    _streamController.sink.add(isLoading);
  }

  void closeStreamController(){
    _streamController.close();
  }
}
