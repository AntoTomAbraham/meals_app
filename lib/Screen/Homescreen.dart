import 'package:anto_tom_apk/Screen/Landscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 492),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LandScreen()));
                },
                child: Container(
                  height: 56,
                  width: 226,
                  decoration: const BoxDecoration(
                    color: Color(0xff3e8b3a),
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  child: Center(
                      child: Text(
                    "Share your meal",
                    style: GoogleFonts.andika(
                      fontWeight: FontWeight.w400,
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  )),
                ),
              ),
            ],
          )),
    );
  }
}
