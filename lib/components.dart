import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabsWeb extends StatefulWidget {
  const TabsWeb({required this.title, super.key});
  final title;

  @override
  State<TabsWeb> createState() => _TabsWebState();
}

class _TabsWebState extends State<TabsWeb> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title,
      style: GoogleFonts.oswald(fontSize: 23, color: Colors.black),
    );
  }
}
