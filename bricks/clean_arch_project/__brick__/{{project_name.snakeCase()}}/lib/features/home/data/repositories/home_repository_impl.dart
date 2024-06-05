import 'package:{{project_name.snakeCase()}}/features/home/data/data.dart';
import 'package:{{project_name.snakeCase()}}/features/home/domain/domain.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeLocalDataSource localDataSource;
  final HomeRemoteDataSource remoteDataSource;
  HomeRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });
}
