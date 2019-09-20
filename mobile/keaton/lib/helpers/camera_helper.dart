import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class CameraHelper {
  static Future<File> takePicture() async {
    final imageFile = await ImagePicker.pickImage(
      source: ImageSource.camera,
    );
    if (imageFile == null) {
      return null;
    }
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage = await imageFile.copy('${appDir.path}/$fileName');

    return savedImage;
  }
}