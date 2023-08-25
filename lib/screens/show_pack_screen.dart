import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_postman/models/packmodel.dart';
import 'package:sidebarx/sidebarx.dart';

class ShowPackScreen extends StatefulWidget {
  const ShowPackScreen({super.key, required this.model});
  final PackModel model;

  @override
  State<ShowPackScreen> createState() => _ShowPackScreenState();
}

class _ShowPackScreenState extends State<ShowPackScreen> {
  @override
  void initState() {
    SidebarXController(selectedIndex: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.2,
          child: ListView.builder(
            itemCount: widget.model.item.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  print("Hello World");
                },
                child: SizedBox(
                  height: 50,
                  child: ListTile(
                    title: Align(
                      child: Text(
                        widget.model.item[index].name,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.quicksand(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Column(
          children: [Text("Selected Api")],
        ),
        Column(
          children: [Text("Response")],
        ),
      ],
    );
  }
}
