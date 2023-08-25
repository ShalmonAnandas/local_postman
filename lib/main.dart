import 'package:fancy_switch/fancy_switch.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_postman/provider/navigation_provider.dart';
import 'package:local_postman/screens/homepage.dart';
import 'package:local_postman/utils/Dataconstants.dart';
import 'package:local_postman/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:sidebarx/sidebarx.dart';

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
    if (DataConstants.platformBrightness == Brightness.dark) {
      DataConstants.isDarkTheme = true;
    }
    DataConstants.currentTheme = DataConstants.isDarkTheme
        ? DataConstants.darkTheme
        : DataConstants.lightTheme;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<NavigationProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Local Postman',
      theme: DataConstants.currentTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            DataConstants.appbarContent,
            style: GoogleFonts.quicksand(
                fontWeight: FontWeight.w700, fontSize: 30),
          ),
          leading: IconButton(
            onPressed: () {
              DataConstants.appbarContent = "Local Postman";
              myProvider.currentWidget = const HomePage();
            },
            icon: const Icon(
              Icons.home,
            ),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FancySwitch(
                value: DataConstants.isDarkTheme,
                onChanged: (bool value) {
                  setState(
                    () {
                      DataConstants.isDarkTheme = value;
                      DataConstants.currentTheme = DataConstants.isDarkTheme
                          ? DataConstants.darkTheme
                          : DataConstants.lightTheme;
                    },
                  );
                },
                height: 35,
                activeModeBackgroundImage: 'assets/images/dark_bg.png',
                inactiveModeBackgroundImage: 'assets/images/light_bg.png',
                activeThumbImage: Image.asset('assets/images/moon.png'),
                inactiveThumbImage: Image.asset('assets/images/sun.png'),
                activeThumbColor:
                    DataConstants.darkTheme.scaffoldBackgroundColor,
                inactiveThumbColor:
                    DataConstants.lightTheme.scaffoldBackgroundColor,
              ),
            ),
          ],
        ),
        body: myProvider.currentWidget,
      ),
    );
  }
}
