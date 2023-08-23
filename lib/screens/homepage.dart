import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_postman/utils/CommonFunctions.dart';
import 'package:local_postman/utils/Dataconstants.dart';
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
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          CommonFunctions.showFilePicker(context).then(
            (value) {
              myProvider.currentWidget = Container(
                width: 600,
                height: 600,
                color: Colors.blue,
              );
            },
          );
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
        child: Text(
          "OPEN POSTMAN PACK (.json)",
          style: GoogleFonts.quicksand(
              fontSize: MediaQuery.of(context).size.width / 15,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
