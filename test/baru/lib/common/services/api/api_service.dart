import 'dart:convert';

import 'package:dio/dio.dart';
import '../../common.dart';

class ApiServiceImpl extends ApiService {
  final Dio dio;
  final bool isTesting;
  final NetworkService connection = getIt<NetworkService>();

  ApiServiceImpl({required this.dio, this.isTesting = false}) {
    init();
  }

  void init() {
    dio.options.baseUrl = URL.base;
    dio.options.connectTimeout = const Duration(milliseconds: 5000);
    dio.interceptors.add(const CustomInterceptors());
  }

  Dio _getDioWithOptionalLogger(bool addLogger) {
    if (!addLogger) return dio;

    final Dio dioClone = Dio(dio.options);
    dioClone.interceptors.addAll(dio.interceptors);
    dioClone.interceptors.add(CurlLoggerDioInterceptor(printOnSuccess: true));

    if (isTesting) return dioClone;

    dioClone.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
      ),
    );

    return dioClone;
  }

  @override
  Future<BaseResponse<T>> post<T>(
    String path, {
    required Map<String, dynamic> body,
    required FromJsonT<T> fromJsonT,
    Map<String, dynamic>? pathParams,
    Options? options,
    bool addLogger = false,
  }) async {
    try {
      // if (!(await connection.hasConnection)) {
      //   throw const ServerFailure("Check your connection");
      // }

      final finalPath = NetworkingUtils.applyPathParams(path, pathParams);

      final Response response = await _getDioWithOptionalLogger(addLogger)
          .post(finalPath, data: jsonEncode(body));
      return NetworkingUtils.parseResponse(response, fromJsonT);
    } on DioException catch (e) {
      return NetworkingUtils.parseError(e);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<T>> get<T>(
    String path, {
    required FromJsonT<T> fromJsonT,
    Map<String, dynamic>? pathParams,
    Map<String, dynamic>? queryParams,
    Options? options,
    bool addLogger = false,
  }) async {
    try {
      // if (!(await connection.hasConnection)) {
      //   throw const ServerFailure("Check your connection");
      // }

      final finalPath = NetworkingUtils.applyPathParams(path, pathParams);

      final Response response = await _getDioWithOptionalLogger(addLogger)
          .get(finalPath, queryParameters: queryParams);
      return NetworkingUtils.parseResponse(response, fromJsonT);
    } on DioException catch (e) {
      return NetworkingUtils.parseError(e);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<T>> delete<T>(
    String path, {
    required FromJsonT<T> fromJsonT,
    Map<String, dynamic>? pathParams,
    Map<String, dynamic>? queryParams,
    Options? options,
    bool addLogger = false,
  }) async {
    try {
      // if (!(await connection.hasConnection)) {
      //   throw const ServerFailure("Check your connection");
      // }

      final finalPath = NetworkingUtils.applyPathParams(path, pathParams);

      final Response response =
          await _getDioWithOptionalLogger(addLogger).delete(
        finalPath,
        queryParameters: queryParams,
        options: options,
      );
      return NetworkingUtils.parseResponse(response, fromJsonT);
    } on DioException catch (e) {
      return NetworkingUtils.parseError(e);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<T>> put<T>(
    String path, {
    required Map<String, dynamic> body,
    required FromJsonT<T> fromJsonT,
    Map<String, dynamic>? pathParams,
    Options? options,
    bool addLogger = false,
  }) async {
    try {
      // if (!(await connection.hasConnection)) {
      //   throw const ServerFailure("Check your connection");
      // }
      final finalPath = NetworkingUtils.applyPathParams(path, pathParams);

      final Response response = await _getDioWithOptionalLogger(addLogger).put(
        finalPath,
        data: jsonEncode(body),
        options: options,
      );
      return NetworkingUtils.parseResponse(response, fromJsonT);
    } on DioException catch (e) {
      return NetworkingUtils.parseError(e);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<T>> uploadFormData<T>(
    String path, {
    required FormData formData,
    required FromJsonT<T> fromJsonT,
    Map<String, dynamic>? pathParams,
    Options? options,
    bool addLogger = false,
  }) async {
    try {
      // if (!(await connection.hasConnection)) {
      //   throw const ServerFailure("Check your connection");
      // }
      final finalPath = NetworkingUtils.applyPathParams(path, pathParams);
      final Response response = await _getDioWithOptionalLogger(addLogger).post(
        finalPath,
        options: options?.copyWith(contentType: 'multipart/form-data'),
        data: formData,
      );
      return NetworkingUtils.parseResponse(response, fromJsonT);
    } on DioException catch (e) {
      return NetworkingUtils.parseError(e);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> downloadFile(
    DownloadFile downloadFile, {
    bool addLogger = false,
  }) async {
    try {
      String path = await AppUtils.getFilePath(downloadFile.fileNameWithExt);
      final Response response =
          await _getDioWithOptionalLogger(addLogger).download(
        downloadFile.fullFileUrl,
        path,
        onReceiveProgress: (receivedBytes, totalBytes) {
          if (totalBytes <= 0) return;
          final percentage =
              (receivedBytes / totalBytes * 100).toStringAsFixed(0);
          final progress = receivedBytes / totalBytes;
          final DownloadProgress downloadProgress = DownloadProgress(
            percentage: percentage,
            progress: progress,
            receivedBytes: receivedBytes,
            totalBytes: totalBytes,
          );
          downloadFile.downloadProgress(downloadProgress);
        },
      );
      return response;
    } on DioException catch (e) {
      return NetworkingUtils.parseError(e);
    } catch (e) {
      rethrow;
    }
  }
}
