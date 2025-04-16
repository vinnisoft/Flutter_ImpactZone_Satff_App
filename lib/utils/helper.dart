import 'package:impact_zone/export.dart';


class Helper{
  Helper._();

  static Future<File?> pickFile({String fileType="image"}) async {
    final FilePickerResult? result;

    if(fileType=="image"){
      result= await FilePicker.platform.pickFiles(
          type: FileType.image,
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
    } else {
      return null;
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
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);

    if (photo != null) {
      File imageFile = File(photo.path);
      if (kDebugMode) {
        print('Photo taken: ${imageFile.path}');
      }
    } else {
      if (kDebugMode) {
        print('No photo taken');
      }
    }
  }

}