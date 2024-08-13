import '../../domain/domain.dart';
import '../data.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeLocalDataSource localDataSource;
  final HomeRemoteDataSource remoteDataSource;
  HomeRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });
}
