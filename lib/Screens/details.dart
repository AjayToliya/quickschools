import 'package:flutter/material.dart';
import 'package:schoolrunner/Utils/Colours.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(
              Icons.edit,
              color: Colors.white,
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
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "name",
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
