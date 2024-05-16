import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Utils/Colours.dart';
import '../Utils/Info.dart';
import '../model/model.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  GlobalKey<FormState> referenceKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController std = TextEditingController();
  TextEditingController id = TextEditingController();
  ImagePicker imagePicker = ImagePicker();
  XFile? xFile;
  String? pickImagePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff4894fe),
        leading: Icon(
          Icons.menu,
          color: Colors.white,
          size: 35,
        ),
      ),
      body: Center(
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Color(0xff4894fe),
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15, left: 8),
                      child: Text(
                        "Welcome Back",
                        style: TextStyle(
                            color: Color(0xffE8E8E8FF),
                            fontSize: 22,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "David Will",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 41,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.4,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(50),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20, top: 25, bottom: 20),
                      child: Text(
                        "All are here...",
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xff4894fe),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: MediaQuery.of(context).size.width / 1.1,
                        height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(500),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    "Student name",
                                    style: TextStyle(
                                        fontSize: 19, color: Colors.white),
                                  ),
                                ),
                                Text(
                                  "data",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed('details');
                              },
                              child: Icon(
                                Icons.arrow_forward_outlined,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 5,
        backgroundColor: mainAppColour.withOpacity(0.9),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: mainAppColour,
                title: Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    "Add All Data",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(
                    horizontal: 30, vertical: 20), // Adjust padding as needed
                content: SizedBox(
                  // Wrap your content with SizedBox and specify a width
                  width: MediaQuery.of(context).size.width *
                      0.8, // Adjust the width as needed
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                  "Pick Image",
                                ),
                                content: Text(
                                  "Choose Image From Gallery or Camera",
                                ),
                                actions: [
                                  FloatingActionButton(
                                    mini: true,
                                    onPressed: () async {
                                      xFile = await imagePicker.pickImage(
                                        source: ImageSource.camera,
                                      );
                                      setState(() {
                                        if (xFile != null) {
                                          pickImagePath = xFile!.path;
                                        }
                                      });

                                      Navigator.of(context).pop();
                                    },
                                    elevation: 3,
                                    child: Icon(
                                      Icons.camera_alt,
                                    ),
                                  ),
                                  FloatingActionButton(
                                    mini: true,
                                    onPressed: () async {
                                      xFile = await imagePicker.pickImage(
                                        source: ImageSource.gallery,
                                      );
                                      setState(() {
                                        if (xFile != null) {
                                          pickImagePath = xFile!.path;
                                        }
                                      });

                                      Navigator.of(context).pop();
                                    },
                                    elevation: 3,
                                    child: Icon(
                                      Icons.image,
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white.withOpacity(0.5),
                          backgroundImage: (pickImagePath != null)
                              ? FileImage(File(pickImagePath!))
                              : null,
                          child: (pickImagePath != null)
                              ? Container()
                              : Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 30,
                                ),
                        ),
                      ),
                      Form(
                        key: referenceKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return "Enter reference name.";
                                        }
                                        return null;
                                      },
                                      onSaved: (val) {
                                        Things.name = val ?? "";
                                      },
                                      controller: name,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: "Name",
                                        hintStyle: TextStyle(
                                          color: mainFontGeryColour,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          validator: (val) {
                                            if (val!.isEmpty) {
                                              return "Enter designation.";
                                            }
                                            return null;
                                          },
                                          onSaved: (val) {
                                            Things.id = val ?? "";
                                          },
                                          controller: std,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: "id",
                                            hintStyle: TextStyle(
                                                color: mainFontGeryColour,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          validator: (val) {
                                            if (val!.isEmpty) {
                                              return "Enter first";
                                            }
                                            return null;
                                          },
                                          onSaved: (val) {
                                            Things.std = val ?? "";
                                          },
                                          controller: id,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: "Std",
                                            hintStyle: TextStyle(
                                                color: mainFontGeryColour,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                OutlinedButton(
                                  onPressed: () {
                                    if (referenceKey.currentState!.validate()) {
                                      referenceKey.currentState!.reset();

                                      name.clear();
                                      id.clear();
                                      std.clear();
                                    }
                                  },
                                  style: OutlinedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 15),
                                    foregroundColor: mainAppColour,
                                    side: BorderSide(
                                      color: white,
                                    ),
                                  ),
                                  child: Text(
                                    "Clear",
                                    style:
                                        TextStyle(fontSize: 14, color: white),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    if (referenceKey.currentState!.validate()) {
                                      referenceKey.currentState!.save();

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          behavior: SnackBarBehavior.floating,
                                          backgroundColor:
                                              mainAppColour.withOpacity(0.5),
                                          action: SnackBarAction(
                                            label: "Next",
                                            onPressed: () {
                                              setState(() {
                                                Navigator.of(context)
                                                    .pushNamedAndRemoveUntil(
                                                        "workspace",
                                                        (route) => false);
                                              });
                                            },
                                            textColor: white,
                                          ),
                                          content: Text(
                                            "Technical skills information Saved SuccessFully!!!",
                                          ),
                                        ),
                                      );
                                      Data data = Data(
                                        id: Things.id,
                                        name: Things.name,
                                        std: Things.std,
                                      );

                                      Things.allStudent.add(data);

                                      std.clear();
                                      id.clear();
                                      name.clear();
                                    }
                                  },
                                  style: OutlinedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 15),
                                    foregroundColor: white,
                                    backgroundColor: mainAppColour,
                                  ),
                                  child: Text(
                                    "Save",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
