import 'package:dio/dio.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager get instance {
    _instance ??= NetworkManager._init();
    return _instance!;
  }

  late final Dio networkManager;
  NetworkManager._init() {
    networkManager = Dio(
      BaseOptions(
          baseUrl: 'https://random-english-questions.herokuapp.com/api/'),
    );
  }
}
