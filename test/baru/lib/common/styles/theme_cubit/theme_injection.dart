import '../../common.dart';

void themeInjection() {
  //bloc
  getIt.registerLazySingleton<ThemeCubit>(
    () => ThemeCubit(
      storageService: getIt(),
    ),
  );
}
