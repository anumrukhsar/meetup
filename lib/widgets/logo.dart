import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Meetup', style: GoogleFonts.italianno(
        textStyle: TextStyle(color: Colors.orange, fontSize: 50)),);

  }
}