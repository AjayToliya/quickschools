// import 'package:flutter/material.dart';
// import 'package:glassmorphism/glassmorphism.dart';
// import 'package:resume_builder/utils/Appbar.dart';
// import '../utils/PAGE_DATA.dart';
// import '../utils/colours.dart';
//
// class Reference_Page extends StatefulWidget {
//   const Reference_Page({super.key});
//
//   @override
//   State<Reference_Page> createState() => _Reference_PageState();
// }
//
// class _Reference_PageState extends State<Reference_Page> {
//   GlobalKey<FormState> referenceKey = GlobalKey<FormState>();
//   TextEditingController referenceController = TextEditingController();
//   TextEditingController designationController = TextEditingController();
//   TextEditingController instituteController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: Bar.allAppBar(
//         title: "Reference",
//         context: context,
//         subtitle: " ",
//       ),
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         color: maincolorofapp,
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               GlassmorphicContainer(
//                 width: MediaQuery.of(context).size.width / 1.1,
//                 height: MediaQuery.of(context).size.height / 1.6,
//                 borderRadius: 20,
//                 blur: 20,
//                 alignment: Alignment.bottomCenter,
//                 border: 2,
//                 linearGradient: LinearGradient(
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                     colors: [
//                       Color(0xFFffffff).withOpacity(0.1),
//                       Color(0xFFFFFFFF).withOpacity(0.05),
//                     ],
//                     stops: [
//                       0.1,
//                       1,
//                     ]),
//                 borderGradient: LinearGradient(
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                   colors: [
//                     Color(0xFFffffff).withOpacity(0.5),
//                     Color((0xFFFFFFFF)).withOpacity(0.5),
//                   ],
//                 ),
//                 child: Padding(
//                   padding:
//                   const EdgeInsets.only(top: 15.0, right: 12, left: 12),
//                   child: Form(
//                     key: referenceKey,
//                     child: Column(
//                       children: [
//                         Container(
//                           margin: EdgeInsets.only(bottom: 30),
//                           child: Column(
//                             children: [
//                               Row(
//                                 children: [
//                                   Text(
//                                     "Reference Name",
//                                     style: TextStyle(
//                                       color: whitetitlecolor,
//                                       fontSize: 20,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: TextFormField(
//                                       validator: (val) {
//                                         if (val!.isEmpty) {
//                                           return "Enter reference name.";
//                                         }
//                                         return null;
//                                       },
//                                       onSaved: (val) {
//                                         Things.reference = val ?? "";
//                                       },
//                                       controller: referenceController,
//                                       decoration: InputDecoration(
//                                           border: OutlineInputBorder(),
//                                           hintText: "Suresh Shah",
//                                           hintStyle: TextStyle(
//                                               color: gerysubtitlecolor,
//                                               fontSize: 20)),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.only(bottom: 30),
//                           child: Column(
//                             children: [
//                               Row(
//                                 children: [
//                                   Text(
//                                     "Designation",
//                                     style: TextStyle(
//                                       color: whitetitlecolor,
//                                       fontSize: 20,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: TextFormField(
//                                       validator: (val) {
//                                         if (val!.isEmpty) {
//                                           return "Enter designation.";
//                                         }
//                                         return null;
//                                       },
//                                       onSaved: (val) {
//                                         Things.designation = val ?? "";
//                                       },
//                                       controller: designationController,
//                                       decoration: InputDecoration(
//                                           border: OutlineInputBorder(),
//                                           hintText:
//                                           "Marketing Manager, ID-342332",
//                                           hintStyle: TextStyle(
//                                               color: gerysubtitlecolor,
//                                               fontSize: 20)),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.only(bottom: 30),
//                           child: Column(
//                             children: [
//                               Row(
//                                 children: [
//                                   Text(
//                                     "Organization/Institute",
//                                     style: TextStyle(
//                                       color: whitetitlecolor,
//                                       fontSize: 20,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: TextFormField(
//                                       validator: (val) {
//                                         if (val!.isEmpty) {
//                                           return "Enter organization/institute.";
//                                         }
//                                         return null;
//                                       },
//                                       onSaved: (val) {
//                                         Things.institute = val ?? "";
//                                       },
//                                       controller: instituteController,
//                                       decoration: InputDecoration(
//                                           border: OutlineInputBorder(),
//                                           hintText: "Green Energy Pvt. Ltd.",
//                                           hintStyle: TextStyle(
//                                               color: gerysubtitlecolor,
//                                               fontSize: 20)),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(top: 10),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               OutlinedButton(
//                                 onPressed: () {
//                                   if (referenceKey.currentState!.validate()) {
//                                     referenceKey.currentState!.reset();
//
//                                     referenceController.clear();
//                                     designationController.clear();
//                                     instituteController.clear();
//                                   }
//                                 },
//                                 style: OutlinedButton.styleFrom(
//                                   padding: EdgeInsets.symmetric(
//                                       horizontal: 40, vertical: 15),
//                                   foregroundColor: maincolorofapp,
//                                   side: BorderSide(
//                                     color: whitetitlecolor,
//                                   ),
//                                 ),
//                                 child: Text(
//                                   "Clear",
//                                   style: TextStyle(
//                                       fontSize: 17, color: whitetitlecolor),
//                                 ),
//                               ),
//                               ElevatedButton(
//                                 onPressed: () {
//                                   if (referenceKey.currentState!.validate()) {
//                                     referenceKey.currentState!.save();
//
//                                     ScaffoldMessenger.of(context).showSnackBar(
//                                       SnackBar(
//                                         behavior: SnackBarBehavior.floating,
//                                         backgroundColor:
//                                         maincolorofapp.withOpacity(0.5),
//                                         action: SnackBarAction(
//                                           label: "Next",
//                                           onPressed: () {
//                                             setState(() {
//                                               Navigator.of(context)
//                                                   .pushNamedAndRemoveUntil(
//                                                   "workspace",
//                                                       (route) => false);
//                                             });
//                                           },
//                                           textColor: whitetitlecolor,
//                                         ),
//                                         content: Text(
//                                           "Technical skills information Saved SuccessFully!!!",
//                                         ),
//                                       ),
//                                     );
//
//                                     referenceController.clear();
//                                     designationController.clear();
//                                     instituteController.clear();
//                                   }
//                                 },
//                                 style: OutlinedButton.styleFrom(
//                                   padding: EdgeInsets.symmetric(
//                                       horizontal: 40, vertical: 15),
//                                   foregroundColor: whitetitlecolor,
//                                   backgroundColor: maincolorofapp,
//                                 ),
//                                 child: Text(
//                                   "Save",
//                                   style: TextStyle(fontSize: 17),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
