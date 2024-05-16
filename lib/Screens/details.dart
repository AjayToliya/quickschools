import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schoolrunner/Utils/Colours.dart';
import 'package:schoolrunner/Utils/Info.dart';
import '../model/model.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  GlobalKey<FormState> referenceKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController std = TextEditingController();
  TextEditingController id = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Data val = ModalRoute.of(context)!.settings.arguments as Data;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: mainAppColour,
                      shape: RoundedRectangleBorder(
                        // Use RoundedRectangleBorder to make the border rounded
                        borderRadius: BorderRadius.circular(
                            20), // Adjust the radius according to your preference
                      ),
                      title: Text(
                        "Edit",
                        style: TextStyle(color: Colors.white),
                      ),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Name",
                            style: TextStyle(color: Colors.white),
                          ),
                          TextFormField(
                            controller: name,
                            decoration: InputDecoration(
                              hintText: "${val.name}",
                              contentPadding: const EdgeInsets.all(
                                10,
                              ),
                              border: const OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "ID",
                            style: TextStyle(color: Colors.white),
                          ),
                          TextFormField(
                            controller: id,
                            decoration: InputDecoration(
                              hintText: "${val.id}",
                              contentPadding: const EdgeInsets.all(
                                10,
                              ),
                              border: const OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Standard",
                            style: TextStyle(color: Colors.white),
                          ),
                          TextFormField(
                            controller: std,
                            decoration: InputDecoration(
                              hintText: "${val.std}",
                              contentPadding: const EdgeInsets.all(
                                10,
                              ),
                              border: const OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (name.text == Things.name &&
                                      id.text == Things.id &&
                                      std.text == Things.std) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text("Enter Information First"),
                                      ),
                                    );
                                  } else {
                                    Things.name = name.text;
                                    Things.id = id.text;
                                    Things.std = std.text;
                                  }
                                },
                                child: Container(
                                  height: 30,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: mainAppColour,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    "Save",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  height: 30,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: mainAppColour,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    "Cancel",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  });
            },
            child: Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
          )
        ],
        backgroundColor: mainAppColour,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios_new_sharp,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 4,
            width: double.infinity,
            decoration: BoxDecoration(
              color: mainAppColour,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(100),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: FileImage(
                          File(val.pickImagePath),
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      val.name,
                      style: TextStyle(color: Colors.white, fontSize: 38),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 15, top: 55),
                  child: Text(
                    "ID :",
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: Text(
                    val.id,
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: Divider(
                    endIndent: 35,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15, top: 55),
                  child: Text(
                    "STANDARD :",
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: Text(
                    val.std,
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: Divider(
                    endIndent: 35,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15, top: 55),
                  child: Text(
                    "PHONE NO :",
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: Text(
                    "+91 9824857599",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
