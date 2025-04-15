import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class Helper{
  Helper._();

  static Future<File?> pickFile({String fileType="image"}) async {
    final FilePickerResult? result;

    if(fileType=="image"){
      result= await FilePicker.platform.pickFiles(
          type: FileType.image,
          // allowedExtensions: ['pdf'],
          allowMultiple: true
      );
    }
    else{
      result= await FilePicker.platform.pickFiles(
          type:FileType.custom,
          allowedExtensions: ['pdf'],
          allowMultiple: true
      );
    }



    if (result != null && result.files.single.path != null) {
      File file = File(result.files.single.path!);
      debugPrint('Picked file: ${file.path}');
      return file;
      // You can now use this file: upload, preview, etc.
    } else {
      return null;
      debugPrint('User canceled the picker');
    }
  }

 static Future<bool> checkStoragePermission() async {
    var status = await Permission.storage.status;

    if (status.isGranted) {
      return true;
    } else {
      var result = await Permission.storage.request();
      return result.isGranted;
    }
  }

  static Future<bool> checkCameraPermission() async {
    var status = await Permission.camera.status;
    if (status.isGranted) {
      return true;
    } else {
      var result = await Permission.camera.request();
      return result.isGranted;
    }
  }


  static Future<void> takePhoto() async {
    // bool hasPermission = await checkCameraPermission();
    // if (!hasPermission) {
    //   print('Camera permission denied');
    //   return;
    // }

    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);

    if (photo != null) {
      File imageFile = File(photo.path);
      print('Photo taken: ${imageFile.path}');
      // Use imageFile (display, upload, etc.)
    } else {
      print('No photo taken');
    }
  }

}