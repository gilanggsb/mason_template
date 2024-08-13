import '../common.dart';

class DownloadFile {
  final String fullFileUrl;
  final String fileNameWithExt;
  final Function(DownloadProgress) downloadProgress;
  final bool deleteOnError;

  DownloadFile({
    required this.fullFileUrl,
    required this.fileNameWithExt,
    required this.downloadProgress,
    this.deleteOnError = true,
  });
}
