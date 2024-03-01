import 'package:flutter/foundation.dart';

class CImage {
  CImage({
    required this.url,
    this.bytes,
  });

  final String url;
  final Uint8List? bytes;
}
