import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_postman/provider/navigation_provider.dart';
import 'package:local_postman/screens/homepage.dart';
import 'package:local_postman/utils/Dataconstants.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(
    ChangeNotifierProvider(
      create: (_) => NavigationProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<NavigationProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Local Postman',
      theme: DataConstants.darkthemeBool
          ? DataConstants.darkTheme
          : DataConstants.lightTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "LOCAL POSTMAN",
            style: GoogleFonts.quicksand(fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
          actions: [
            Switch(
              value: DataConstants.darkthemeBool,
              onChanged: (bool value) {
                setState(() {
                  DataConstants.darkthemeBool = value;
                });
              },
            )
          ],
        ),
        body: myProvider.currentWidget,
      ),
    );
  }
}
