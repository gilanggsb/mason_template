import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkService {
  Future<bool> get hasConnection;
}

class NetworkServiceImpl extends NetworkService {
  final InternetConnectionChecker connection;
  final bool isTesting;
  NetworkServiceImpl(this.connection, {this.isTesting = false});

  @override
  Future<bool> get hasConnection async =>
      isTesting ? true : await connection.hasConnection;
}
