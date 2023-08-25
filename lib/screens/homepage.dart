import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_postman/screens/show_pack_screen.dart';
import 'package:local_postman/utils/CommonFunctions.dart';
import 'package:local_postman/utils/Dataconstants.dart';
import 'package:local_postman/utils/colors.dart';
import 'package:lottie/lottie.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:provider/provider.dart';

import '../provider/navigation_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    print(DataConstants.currentTheme);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<NavigationProvider>(context, listen: false);
    return InkWell(
      onTap: () {
        CommonFunctions.showFilePicker().then(
          (value) {
            try {
              DataConstants.appbarContent = value.info.name;
              myProvider.currentWidget = ShowPackScreen(
                model: value,
              );
            } catch (e) {
              throw Exception(e);
            }
          },
        ).onError(
          (error, stackTrace) {
            Dialogs.materialDialog(
              msg: 'The file should be a valid postman pack (.json)',
              title: 'Choose a File',
              color: DataConstants.currentTheme.scaffoldBackgroundColor,
              titleStyle: GoogleFonts.quicksand(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: DataConstants.isDarkTheme
                      ? lightColorScheme.primaryContainer
                      : darkColorScheme.primaryContainer),
              msgStyle: GoogleFonts.quicksand(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: DataConstants.isDarkTheme
                      ? lightColorScheme.secondaryContainer
                      : darkColorScheme.secondaryContainer),
              lottieBuilder: Lottie.asset(
                'assets/images/file_not_found.json',
                addRepaintBoundary: true,
                fit: BoxFit.contain,
              ),
              context: context,
              actions: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.1,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Okay",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.w700, fontSize: 30),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      child: Align(
        alignment: Alignment.center,
        child: Text(
          "OPEN POSTMAN PACK (.json)",
          textAlign: TextAlign.center,
          style: GoogleFonts.quicksand(
              fontSize: MediaQuery.of(context).size.width / 20,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
