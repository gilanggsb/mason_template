import 'package:http_parser/http_parser.dart';

class UploadFormDataModel {
  final List<int> fileBytes;
  final String fileKey;
  final String fileName;
  final MediaType contentType;
  final Map<String, dynamic> data;

  UploadFormDataModel({
    required this.fileName,
    required this.contentType,
    required this.fileKey,
    required this.data,
    required this.fileBytes,
  });
}
