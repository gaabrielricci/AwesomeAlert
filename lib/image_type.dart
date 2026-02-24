/// [ImageType] defines the available source types for image alerts.
///
/// Use these constants when calling [AwesomeAlert.showImage].
class ImageType {
  /// Use this when the image path is a remote URL (e.g., 'https://...').
  static const int imageFromWeb = 0;

  /// Use this when the image path is a Flutter asset (e.g., 'assets/images/...').
  static const int assetImage = 1;

  /// Use this when the image path is a local file system path (e.g., from path_provider).
  static const int localFileImage = 2;
}

