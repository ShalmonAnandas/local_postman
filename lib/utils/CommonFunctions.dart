import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local_postman/models/packmodel.dart';
import 'package:local_postman/utils/Dataconstants.dart';
import 'package:provider/provider.dart';

import '../provider/navigation_provider.dart';

class CommonFunctions {
  static getModelFromFile(File file) async {
    var rawData = await file.readAsString();
    PackModel model = packModelFromJson(rawData);
    return model;
  }

  static Future<PackModel> showFilePicker(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['json']);
    PackModel model;
    if (result != null) {
      File file = File(result.files.single.path!);
      model = await getModelFromFile(file);
    } else {
      File file = File(
          "C:\\Users\\nasha\\StudioProjects\\local_postman\\lib\\database\\SPRINT 2 API UAT.postman_collection.json");
      model = await getModelFromFile(file);
    }
    return model;
  }

  static changeTheme() {
    if (DataConstants.darkthemeBool == true) {
      DataConstants.currentTheme = DataConstants.darkTheme;
      print("dark theme set");
    } else {
      DataConstants.currentTheme = DataConstants.lightTheme;
      print("light theme set");
    }
  }
}
