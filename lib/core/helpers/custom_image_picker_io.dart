import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class ImPicker {
  static Future<Uint8List?> pickImage() async {
    final picker = ImagePicker();
    final response = await picker.pickImage(source: ImageSource.gallery);

    if (response == null) {
      return null;
    }

    return response.readAsBytes();
  }
}
