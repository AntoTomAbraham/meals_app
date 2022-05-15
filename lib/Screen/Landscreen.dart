import 'dart:io';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:anto_tom_apk/Screen/Messagescreen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'package:firebase_storage/firebase_storage.dart';

class LandScreen extends StatefulWidget {
  @override
  State<LandScreen> createState() => _LandScreenState();
}

class _LandScreenState extends State<LandScreen> {
  File? pickedimage;
  String? _uploadedFileURL;

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) {
      return;
    } else {
      setState(() {
        pickedimage = File(image.path);
      });
    }
  }

  UploadTask? uploadTask;
  Future<dynamic> uploadFile() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref =
        storage.ref().child(pickedimage!.path + DateTime.now().toString());
    setState(() {
      uploadTask = ref.putFile(pickedimage!);
    });
    final snapshot = await uploadTask!.whenComplete(() {});
    final fileUrl = await snapshot.ref.getDownloadURL();
    print(fileUrl);
    return fileUrl;
  }

  double? progress;
  Widget builduploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
        stream: task.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data;
            progress = snap!.bytesTransferred / snap.totalBytes;
            print(progress);
            return Padding(
              padding: const EdgeInsets.only(left: 21.0, right: 21),
              child: Column(
                children: [
                  LinearProgressIndicator(
                    value: progress! * 100,
                    color: Colors.green,
                    backgroundColor: Colors.white,
                  ),
                  Text(
                    "Uploading......${progress! * 100.toInt()}%",
                    style: GoogleFonts.poppins(fontSize: 8),
                  )
                ],
              ),
            );
            //return;
          } else {
            return Container();
          }
        },
      );
  void showSnackBar(String text) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(text),
    ));
  }

  void notify() async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
      id: 1,
      channelKey: "Anto_Tom_Apk",
      title: "Thank you for sharing food with me",
      body: " ",
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 34),
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
              SizedBox(height: 10),
              Container(
                height: 201,
                child: Image.asset(
                  "asset/images/babyy.png",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 23),
              Container(
                height: 414,
                decoration: const BoxDecoration(
                  color: Color(0xfff4f4f4),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 78),
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
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                            ),
                            child: pickedimage == null
                                ? Container(
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100)),
                                    ),
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.file(pickedimage!,
                                        fit: BoxFit.cover)),
                          ),
                          Image.asset(
                            "asset/images/spoon.png",
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      pickedimage == null
                          ? "click your meal"
                          : "Will you eat this ?",
                      style: GoogleFonts.andika(
                          fontWeight: FontWeight.w400,
                          fontSize: 24,
                          color: Color(0xff3C3C3C)),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () async {
                        pickedimage == null
                            ? pickImage()
                            : await uploadFile().then((value) {
                                if (value != null) {
                                  notify();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Messagescreen()));
                                } else {
                                  showSnackBar("You failed to feed the animal");
                                }
                              });
                      },
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: const BoxDecoration(
                          color: Color(0xff3e8b3a),
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        child: Icon(
                          pickedimage == null ? Icons.camera_alt : Icons.done,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    uploadTask != null
                        ? builduploadStatus(uploadTask!)
                        : Container(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
