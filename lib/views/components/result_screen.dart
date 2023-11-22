// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:provider/provider.dart';

// import '../../providers/detail_fetch_provider.dart';
// import '../../utils/enums.dart';
// import '../constants/colors/colors.dart';
// import 'custom_appbar.dart';
// import 'custom_buttons.dart';
// import 'custom_selector.dart';
// import 'image_viewer.dart';
// import 'pdf_viewer.dart';

// class ResultScreen extends StatefulWidget {
//   ResultScreen(

//       // required this.querySnapshot
//       // required this.queryPath
//       );
//   // final QuerySnapshot? querySnapshot;
//   // String queryPath = "Unknown Path, Please Go Back & Search Again!";

//   @override
//   State<ResultScreen> createState() => _ResultScreenState();
// }

// class _ResultScreenState extends State<ResultScreen> {
//   //Artifical Fetch

//   void testFetch() {
//     CollectionReference _products = FirebaseFirestore.instance
//         .collection('main_data/2022/KUK/CSE/7th/Notes/oose/');
//     Future<QuerySnapshot> querySnapshot = _products.get();
//   }

//   //
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     // fetchResources();
//     testFetch();
//   }

//   var resource = Resource.pyqp;

//   String pyqp = "";
//   String notes = "";
//   String syllabus = "";
//   String timetable = "";
//   String pdfUrl = "";
//   String resultWanted = "";
//   String data = "";

//   Map<String, dynamic>? TimeTable, Syllabus, PYQP, Notes;
//   // List<Map<String, dynamic>> Notes = [];
//   List<QueryDocumentSnapshot>? document;
//   void fetchResources() async {
//     QuerySnapshot? querySnapshot =
//         context.read<DetailFetchProvider>().querySnapshot;
//     document = await querySnapshot!.docs;
//     Notes = document![0].data() as Map<String, dynamic>;
//     PYQP = document![1].data() as Map<String, dynamic>;
//     Syllabus = document![2].data() as Map<String, dynamic>;
//     TimeTable = document![3].data() as Map<String, dynamic>;

//     print(Notes);
//     print(PYQP);
//     print(Syllabus);
//     print(TimeTable);

//     switch (resultWanted) {
//       case "syllabus":
//         data = Syllabus!['url'];
//       case "timetable":
//         data = TimeTable!['url'];
//       case "pyqp":
//         data = PYQP!['url'];
//       case "notes":
//         data = Notes!['url'];
//       default:
//         data = PYQP!['url'];
//         count = PYQP!.entries.length;
//     }
//     checkFileExtension(data);
//     setState(() {});
//   }

//   bool isPNG = false;
//   bool isPDF = false;
//   void checkFileExtension(String url) {
//     isPNG = checkFileType(url, '.png');
//     isPDF = checkFileType(url, '.pdf');

//     print('.png found: $isPNG');
//     print('.pdf found: $isPDF');
//   }

//   bool checkFileType(String input, String fileType) {
//     // Convert the input string and file type to lowercase for case-insensitive matching
//     String lowercaseInput = input.toLowerCase();
//     String lowercaseFileType = fileType.toLowerCase();

//     return lowercaseInput.contains(lowercaseFileType);
//   }

//   int count = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<DetailFetchProvider>(
//       builder: (context, value, child) => Scaffold(
//         appBar: CustomAppBar(
//           appBarColor: Color.fromARGB(255, 242, 251, 255),
//           height: 155,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   CustomButton(
//                       iconBackgroundColor: ConstColors.primaryColor,
//                       icon: Icons.arrow_back_rounded,
//                       iconColor: ConstColors.whitetext,
//                       onPress: () {
//                         Navigator.pop(context);
//                       },
//                       radius: 22),
//                   Padding(
//                     padding: const EdgeInsets.all(4.0),
//                     child: Text(
//                       'Resources',
//                       style: TextStyle(
//                           color: ConstColors.primaryColor,
//                           fontSize: 40,
//                           fontWeight: FontWeight.w300),
//                     ),
//                   )
//                 ],
//               ),
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(6),
//                       child: CustomSelector(
//                         backwardIcon: false,
//                         centerText: true,
//                         forwardIcon: false,
//                         isSelected: resource == Resource.pyqp,
//                         isSquareShapeButton: false,
//                         onPress: () {
//                           setState(() {
//                             resource = Resource.pyqp;
//                           });
//                           resultWanted = "pyqp";
//                           fetchResources();
//                           count = PYQP!.entries.length;
//                         },
//                         titleText: " Prev-Year\nQs'n Papers",
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(6),
//                       child: CustomSelector(
//                           backwardIcon: false,
//                           centerText: true,
//                           forwardIcon: false,
//                           isSelected: resource == Resource.notes,
//                           isSquareShapeButton: false,
//                           onPress: () {
//                             setState(() {
//                               resource = Resource.notes;
//                             });
//                             resultWanted = "notes";
//                             fetchResources();
//                             // count = Notes!.entries.length;
//                           },
//                           titleText: "Notes"),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(6),
//                       child: CustomSelector(
//                           backwardIcon: false,
//                           centerText: true,
//                           forwardIcon: false,
//                           isSelected: resource == Resource.syllabus,
//                           isSquareShapeButton: false,
//                           onPress: () {
//                             setState(() {
//                               resource = Resource.syllabus;
//                             });
//                             resultWanted = "syllabus";
//                             fetchResources();
//                             count = Syllabus!.entries.length;
//                           },
//                           titleText: "Syllabus"),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(6),
//                       child: CustomSelector(
//                           backwardIcon: false,
//                           centerText: true,
//                           forwardIcon: false,
//                           isSelected: resource == Resource.timetable,
//                           isSquareShapeButton: false,
//                           onPress: () {
//                             setState(() {
//                               resource = Resource.timetable;
//                             });
//                             resultWanted = "timetable";
//                             fetchResources();
//                             count = TimeTable!.entries.length;
//                           },
//                           titleText: "Time Table"),
//                     )
//                   ],
//                 ),
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
//                     child: Text(
//                       // widget.queryPath,
//                       "",
//                       style: TextStyle(
//                           color: ConstColors.primaryColor,
//                           fontSize: 15,
//                           fontWeight: FontWeight.w300),
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//         body: StreamBuilder(
//           stream: _products!.snapshots(),
//           builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) =>
//               ListView.builder(
//             itemCount: streamSnapshot.data!.docs.length,
//             itemBuilder: (context, index) {
//               final DocumentSnapshot documentSnapshot =
//                   streamSnapshot.data!.docs[index];
//               return InkWell(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => isPDF
//                           ? PdfViewer(
//                               path: documentSnapshot['u'],
//                             )
//                           : ImageViewer(
//                               imageUrls: [documentSnapshot['u']],
//                               initialIndex: 0),
//                     ),
//                   );
//                 },
//                 child:
//                     CustomResultBox(isPdf: isPDF, title: documentSnapshot['t']),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CustomResultBox extends StatelessWidget {
//   const CustomResultBox({super.key, required this.isPdf, required this.title});
//   final bool isPdf;
//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         padding: const EdgeInsets.all(5),
//         margin: const EdgeInsets.all(10),
//         // height: 3,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             boxShadow: [
//               BoxShadow(
//                 color: ConstColors.lightGrey,
//                 blurRadius: 4,
//                 offset: const Offset(0, 2),
//               )
//             ],
//             color: Colors.white),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Row(
//               children: [
//                 Container(
//                   child: isPdf
//                       ? Icon(
//                           Icons.picture_as_pdf,
//                           color: Colors.red,
//                           size: 30,
//                         )
//                       : Icon(
//                           Icons.photo,
//                           color: Colors.blue,
//                           size: 30,
//                         ),
//                 ),
//                 Text(
//                   '  ${title}',
//                   style: TextStyle(
//                     fontSize: 13,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 IconButton(
//                   icon: Icon(Icons.download),
//                   onPressed: () {},
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.share),
//                   onPressed: () {},
//                 ),
//               ],
//             )
//           ],
//         ));
//   }
// }
