import 'package:anto_tom_apk/Screen/Messagescreen.dart';
import 'package:flutter/material.dart';

class LandScreen extends StatelessWidget {
  const LandScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        child: Column(
          children: [
            SizedBox(height: 24),
            Container(
              height: 50,
              child: Row(
                children: [
                  SizedBox(
                    width: 24,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context, false);
                    },
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        color: Color(0xff3e8b3a),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 201,
              child: Image.asset(
                "asset/images/babyy.png",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 406,
              decoration: const BoxDecoration(
                color: Color(0xfff4f4f4),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  Padding(
                    padding: const EdgeInsets.only(left: 27.0, right: 27.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          "asset/images/fork.png",
                          fit: BoxFit.cover,
                        ),
                        Container(
                          color: Colors.blue,
                          height: 200,
                          width: 200,
                        ),
                        Image.asset(
                          "asset/images/spoon.png",
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "click your meal",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                        color: Color(0xff3C3C3C)),
                  ),
                  const SizedBox(height: 11),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Messagescreen()));
                    },
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: const BoxDecoration(
                        color: Color(0xff3e8b3a),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
