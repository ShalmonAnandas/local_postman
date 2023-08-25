import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:local_postman/models/packmodel.dart';
import 'package:local_postman/utils/Dataconstants.dart';

class CommonFunctions {
  static getModelFromFile(File file) async {
    var rawData = await file.readAsString();
    PackModel model = packModelFromJson(rawData);
    return model;
  }

  static Future<PackModel> showFilePicker() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['json']);
    PackModel model;
    try {
      File file = File(result!.files.single.path!);
      model = await getModelFromFile(file);
    } catch (e) {
      throw Exception(e);
    }
    return model;
  }

  static changeTheme() {
    if (DataConstants.isDarkTheme == true) {
      DataConstants.currentTheme = DataConstants.darkTheme;
      print("dark theme set");
    } else {
      DataConstants.currentTheme = DataConstants.lightTheme;
      print("light theme set");
    }
  }
}
