import 'package:dio/dio.dart';
import '../../common.dart';

abstract class BaseApiService {
  Future<BaseResponse<T>> get<T>(
    String path, {
    required FromJsonT<T> fromJsonT,
    Map<String, dynamic>? pathParams,
    Map<String, dynamic>? queryParams,
    bool addLogger = false,
  });

  Future<BaseResponse<T>> post<T>(
    String path, {
    required Map<String, dynamic> body,
    required FromJsonT<T> fromJsonT,
    Map<String, dynamic>? pathParams,
    bool addLogger = false,
  });

  Future<BaseResponse<T>> delete<T>(
    String path, {
    required FromJsonT<T> fromJsonT,
    Map<String, dynamic>? pathParams,
    Map<String, dynamic>? queryParams,
    bool addLogger = false,
  });

  Future<BaseResponse<T>> put<T>(
    String path, {
    required Map<String, dynamic> body,
    required FromJsonT<T> fromJsonT,
    Map<String, dynamic>? pathParams,
    bool addLogger = false,
  });

  Future<Response> downloadFile(
    DownloadFile downloadFile, {
    bool addLogger = false,
  });

  Future<BaseResponse<T>> uploadFormData<T>(
    String path, {
    required FormData formData,
    required FromJsonT<T> fromJsonT,
    Map<String, dynamic>? pathParams,
    bool addLogger = false,
  });
}

abstract class ApiService extends BaseApiService {
  @override
  Future<BaseResponse<T>> get<T>(
    String path, {
    required FromJsonT<T> fromJsonT,
    Map<String, dynamic>? pathParams,
    Map<String, dynamic>? queryParams,
    Options? options,
    bool addLogger = false,
  });

  @override
  Future<BaseResponse<T>> post<T>(
    String path, {
    required Map<String, dynamic> body,
    required FromJsonT<T> fromJsonT,
    Map<String, dynamic>? pathParams,
    Options? options,
    bool addLogger = false,
  });

  @override
  Future<BaseResponse<T>> delete<T>(
    String path, {
    required FromJsonT<T> fromJsonT,
    Map<String, dynamic>? pathParams,
    Map<String, dynamic>? queryParams,
    bool addLogger = false,
  });

  @override
  Future<BaseResponse<T>> put<T>(
    String path, {
    required Map<String, dynamic> body,
    required FromJsonT<T> fromJsonT,
    Map<String, dynamic>? pathParams,
    Options? options,
    bool addLogger = false,
  });

  @override
  Future<Response> downloadFile(
    DownloadFile downloadFile, {
    bool addLogger = false,
  });

  @override
  Future<BaseResponse<T>> uploadFormData<T>(
    String path, {
    required FormData formData,
    required FromJsonT<T> fromJsonT,
    Map<String, dynamic>? pathParams,
    Options? options,
    bool addLogger = false,
  });
}
