import 'package:cooll/api/connection_config.dart';
import 'package:dio/dio.dart';

class DioClient {
  static late final Dio _client = _createClient();

  DioClient._(); // Disable instance creation.

  static Dio _createClient() {
    final client = Dio(
      BaseOptions(
        connectTimeout: ConnectionConfig.connectTimeout,
        receiveTimeout: ConnectionConfig.connectTimeout,
        baseUrl: ConnectionConfig.baseUrl,
      ),
    );

    return client;
  }

  static Dio getClient() {
    return _client;
  }
}
