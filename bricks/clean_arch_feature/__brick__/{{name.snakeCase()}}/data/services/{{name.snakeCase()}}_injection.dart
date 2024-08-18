import '../../{{name.snakeCase()}}.dart';


void {{name.camelCase()}}Injection() {
  // //bloc
  // getIt.registerFactory<{{name.pascalCase()}}Cubit>(
  //   () => {{name.pascalCase()}}Cubit(
  //     repository: getIt(),
  //   ),
  // );
  // //repository
  // getIt.registerFactory<{{name.pascalCase()}}Repository>(
  //   () => {{name.pascalCase()}}RepositoryImpl(
  //     localDataSource: getIt(),
  //     remoteDataSource: getIt(),
  //   ),
  // );
  // //datasource
  // getIt.registerLazySingleton<{{name.pascalCase()}}RemoteDataSource>(
  //   () => {{name.pascalCase()}}RemoteDataSourceImpl(
  //     // service: getIt(),
  //   ),
  // );
  // getIt.registerLazySingleton<{{name.pascalCase()}}LocalDataSource>(
  //   () => {{name.pascalCase()}}LocalDataSourceImpl(
  //     // service: getIt(),
  //   ),
  // );
  // //usecase
}
