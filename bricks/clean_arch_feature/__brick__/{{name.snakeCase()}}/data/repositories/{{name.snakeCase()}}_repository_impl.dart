import "../data.dart";
import "../../domain/domain.dart";
class {{name.pascalCase()}}RepositoryImpl extends {{name.pascalCase()}}Repository {
  final {{name.pascalCase()}}LocalDataSource localDataSource;
  final {{name.pascalCase()}}RemoteDataSource remoteDataSource;
  {{name.pascalCase()}}RepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });
}