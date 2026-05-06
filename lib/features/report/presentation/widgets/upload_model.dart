enum UploadStatus { idle, uploading, success, failed }

class UploadItem {
  final String path;
  final double progress;
  final UploadStatus status;

  UploadItem({
    required this.path,
    this.progress = 0,
    this.status = UploadStatus.idle,
  });

  UploadItem copyWith({
    double? progress,
    UploadStatus? status,
  }) {
    return UploadItem(
      path: path,
      progress: progress ?? this.progress,
      status: status ?? this.status,
    );
  }
}