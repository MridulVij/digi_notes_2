// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:digi_notes_2/views/constants/colors/consts.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
// // import 'package:flutter_full_pdf_viewer_null_safe/flutter_full_pdf_viewer.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:provider/provider.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
// import 'data/api/detail_fetcher.dart';
// import 'providers/auth_providers.dart';
// import 'views/components/shimmer_effect.dart';
// import 'views/screens/splash_ui/splash.dart';
// import 'views/widgets/detail_selector.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   await FlutterDownloader.initialize();
//   runApp(const MainApp());
// }

// class MainApp extends StatefulWidget {
//   const MainApp({Key? key}) : super(key: key);

//   @override
//   State<MainApp> createState() => _MainAppState();
// }

// class _MainAppState extends State<MainApp> {
//   DetailFetcher detailFetcher = DetailFetcher();
//   DetailsFetcherAccordingToUserInput path =
//       DetailsFetcherAccordingToUserInput();
//   dynamic response;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     fetchStart();
//   }

//   Future fetchStart() async {
//     response =
//         await detailFetcher.customFetcher(path.qp_22_kuk_cse_7th_syllabus);
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         // ChangeNotifierProvider(create: (context) => DetailsSelectorProvider()),
//         ChangeNotifierProvider(create: (context) => GoogleSignInProvider()),
//       ],
//       child: MaterialApp(
//         home: Scaffold(
//           body: RefreshIndicator(
//             onRefresh: fetchStart,
//             child: StreamBuilder<DocumentSnapshot>(
//               stream: response,
//               // stream: response,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(
//                     child: ShimmerEffect(),
//                   );
//                 }

//                 if (snapshot.hasError) {
//                   return Center(
//                     child: Text('Error: ${snapshot.error}'),
//                   );
//                 }

//                 if (!snapshot.hasData || !snapshot.data!.exists) {
//                   return Center(
//                     child: Column(
//                       children: [
//                         Text('No data available.'),
//                         ElevatedButton(
//                             onPressed: () {
//                               fetchStart();
//                             },
//                             child: Text("Try Again!"))
//                       ],
//                     ),
//                   );
//                 }

//                 // Extract data from the document
//                 final data = snapshot.data!.data() as Map<String, dynamic>;
//                 String text = data['url'];
//                 // final List<String> list = List<String>.from(data[''] ?? []);

//                 // Process your data or return a widget with the extracted information
//                 return SfPdfViewer.network(text);
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:digi_notes_2/utils/routes.dart';
import 'package:digi_notes_2/views/constants/colors/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth_providers.dart';
import 'providers/internet_provider.dart';
import 'providers/notification_provider.dart';
import 'utils/google_ads.dart';
import 'utils/notifications_services.dart';
import 'views/constants/colors/consts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await LocalNotifications.init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GoogleSignInProvider()),
        ChangeNotifierProvider(create: (context) => NotificationProvider()),
        ChangeNotifierProvider(create: (context) => InternetProviderNotifier())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Digi Notes',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            elevation: 0.0,
            surfaceTintColor: Colors.grey[200],
            // backgroundColor: Colors.white,
          ),
          primarySwatch: Colors.blue,
          primaryColor: Colors.blue,
          useMaterial3: true,
          textTheme: const TextTheme(),
          scaffoldBackgroundColor: ConstColors.whitetext,
        ),
        initialRoute: RouterNames.splash_screen,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
