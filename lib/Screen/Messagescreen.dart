import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Messagescreen extends StatelessWidget {
  const Messagescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        color: Color(0xffe5e5e5),
        child: Center(
          child: Text(
            "GOOD JOB",
            style: GoogleFonts.lilitaOne(
                color: Color(0xff3E8B3A),
                fontSize: 48,
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
