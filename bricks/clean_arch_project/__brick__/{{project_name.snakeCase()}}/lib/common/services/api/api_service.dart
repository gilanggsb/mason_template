import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:{{project_name.snakeCase()}}/common/common.dart';

abstract class ApiService {
  Future<BaseResponse<T>> get<T>(
    String endpoints,
    T Function(Object?) fromJsonT, {
    Map<String, dynamic> queryParams,
  });
  Future<BaseResponse<T>> post<T>(
    String endpoints,
    Map<String, dynamic> body,
    T Function(Object?) fromJsonT,
  );
  Future<BaseResponse<T>> formData<T>(
    String url,
    UploadFormDataModel uploadFormData, {
    String? dataKey,
    required T Function(Object?) fromJsonT,
  });
}

class ApiServiceImpl extends ApiService {
  final Dio dio;
  final bool isTesting;
  final NetworkService connection = getIt<NetworkService>();

  ApiServiceImpl({required this.dio, this.isTesting = false}) {
    initDIO();
  }

  void initDIO() {
    dio.options.baseUrl = URL.base;
    dio.options.connectTimeout = const Duration(milliseconds: 5000);
    dio.interceptors.add(const CustomInterceptors());
    if (!isTesting) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
        ),
      );
    }
    dio.interceptors.add(CurlLoggerDioInterceptor(printOnSuccess: true));
  }

  BaseResponse<T> parseResponse<T>(
      Response response, T Function(Object?) fromJsonT) {
    try {
      final BaseResponse<T> baseResponse =
          BaseResponse.fromJson(response.data, fromJsonT);
      // if (baseResponse.status == 200) {
      return baseResponse;
      // }
      // throw ServerFailure(baseResponse.msg);
    } catch (e) {
      rethrow;
    }
  }

  dynamic parseError(DioException e) {
    if (e.type == DioExceptionType.badResponse) {
      BadResponse badResponse = BadResponse.fromJson(e.response?.data);
      throw ServerException(badResponse.message ?? '');
    }
    if (e.type == DioExceptionType.connectionTimeout) {
      throw const ServerFailure('check your connection');
    }

    if (e.type == DioExceptionType.receiveTimeout) {
      throw const ServerFailure('unable to connect to the server');
    }

    if (e.type == DioExceptionType.unknown) {
      throw const ServerFailure('Something went wrong');
    }
  }

  @override
  Future<BaseResponse<T>> post<T>(String endpoints, Map<String, dynamic> body,
      T Function(Object?) fromJsonT) async {
    try {
      if (!(await connection.hasConnection)) {
        throw const ServerFailure("check your connection");
      }
      final Response response =
          await dio.post(endpoints, data: jsonEncode(body));
      return parseResponse(response, fromJsonT);
    } on DioException catch (e) {
      return parseError(e);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<T>> get<T>(
    String endpoints,
    T Function(Object?) fromJsonT, {
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      if (!(await connection.hasConnection)) {
        throw const ServerFailure("check your connection");
      }
      final Response response =
          await dio.get(endpoints, queryParameters: queryParams);
      return parseResponse(response, fromJsonT);
    } on DioException catch (e) {
      return parseError(e);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<T>> formData<T>(
    String url,
    UploadFormDataModel uploadFormData, {
    String? dataKey,
    required T Function(Object?) fromJsonT,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        uploadFormData.fileKey: MultipartFile.fromBytes(
          uploadFormData.fileBytes,
          filename: uploadFormData.fileName,
          contentType: uploadFormData.contentType,
        ),
        ...uploadFormData.data,
      });

      final Map<String, dynamic> headers = {
        'Content-Type': 'multipart/form-data'
      };

      final Response response = await dio.post(
        url,
        data: formData,
        options: Options(
          headers: headers,
        ),
      );
      return parseResponse(response, fromJsonT);
    } on DioException catch (e) {
      return parseError(e);
    } catch (e) {
      rethrow;
    }
  }
}
