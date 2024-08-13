import 'dart:io';

import 'package:dio/dio.dart';

import '../common.dart';

abstract class NetworkingUtils {
  static String applyPathParams(String url, Map<String, dynamic>? pathParams) {
    if (pathParams == null) return url;

    pathParams.forEach((key, value) {
      if (value != null) {
        url = "$url/$value";
      }
    });
    return url;
  }

  static Future<FormData> createFormData(Map<String, dynamic> params) async {
    final Map<String, dynamic> formDataMap = {};

    for (var entry in params.entries) {
      if (entry.value is File) {
        formDataMap[entry.key] = await MultipartFile.fromFile(
          (entry.value as File).path,
          filename: (entry.value as File).path.split('/').last,
        );
      } else {
        formDataMap[entry.key] = entry.value;
      }
    }

    return FormData.fromMap(formDataMap);
  }

  static BaseResponse<T> parseResponse<T>(
    Response response,
    FromJsonT<T> fromJsonT,
  ) {
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

  static dynamic parseError(DioException e) {
    // Detailed error handling based on the type of DioException
    switch (e.type) {
      case DioExceptionType.badResponse:
        // Assuming e.response?.data is in a JSON format that matches your BadResponse model
        if (e.response?.data != null) {
          throw parseBadResponse(e);
        } else {
          throw 'Server responded with an error but no data was received';
        }

      case DioExceptionType.connectionTimeout:
        throw 'Connection timed out. Please check your internet connection and try again.';

      case DioExceptionType.connectionError:
        // Provide a more descriptive error message if available, otherwise a generic one
        throw e.message ?? 'Connection error occurred. Please try again.';

      case DioExceptionType.receiveTimeout:
        throw 'Failed to receive a response from the server in time. Please try again later.';

      case DioExceptionType.sendTimeout:
        throw 'Failed to send request to the server in time. Please check your connection and try again.';

      case DioExceptionType.cancel:
        throw 'Request to the server was cancelled. Please try again.';

      case DioExceptionType.unknown:
        if (e.message != null && e.message!.contains('SocketException')) {
          throw 'No internet connection. Please check your network settings.';
        }
        throw 'An unknown error occurred. Please try again.';

      default:
        throw 'An unexpected error occurred. Please try again.';
    }
  }

  static dynamic parseBadResponse(DioException e) {
    try {
      if (e.response?.statusCode == 522) {
        throw BadResponse(
          error: true,
          message:
              'Connection timed out. Please check your internet connection and try again.',
        );
      }

      BadResponse badResponse = BadResponse.fromJson(e.response?.data);
      throw badResponse; // Return the BadResponse object
    } on BadResponse catch (_) {
      rethrow; // Return the BadResponse object
    } catch (error) {
      // If parsing fails, throw a generic error
      throw 'Failed to parse error response';
    }
  }
}
