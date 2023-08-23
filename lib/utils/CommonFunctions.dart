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

  static Future<void> showFilePicker(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['json']);
    if (result != null) {
      File file = File(result.files.single.path!);
      print("entered");
    }
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
