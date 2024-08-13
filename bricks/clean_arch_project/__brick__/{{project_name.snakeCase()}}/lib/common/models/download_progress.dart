class DownloadProgress {
  final String? percentage;
  final double? progress;
  final int? receivedBytes;
  final int? totalBytes;

  DownloadProgress({
    this.percentage,
    this.progress,
    this.receivedBytes,
    this.totalBytes,
  });
}
