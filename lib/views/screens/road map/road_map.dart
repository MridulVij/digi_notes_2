import 'package:digi_notes_2/views/constants/colors/colors.dart';
import 'package:flutter/material.dart';

import '../../components/custom_container.dart';

class RoadMapUI extends StatefulWidget {
  const RoadMapUI({super.key});

  @override
  State<RoadMapUI> createState() => _RoadMapUIState();
}

class _RoadMapUIState extends State<RoadMapUI> {
  List<String> technologyName = [
    'React Native',
    'Flutter',
    'React.js',
    'Vue.js',
    'Angular.js',
    'Node.js'
  ];
  List<String> logoImageLink = [
    'https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png',
    'https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png',
    'https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png',
    'https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png',
    'https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png',
    'https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png',
    'https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png',
    'https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // You can change this value based on your needs
          crossAxisSpacing: 2.0,
          mainAxisSpacing: 2.0,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          return CustomContainer(
            boxColor: ConstColors.lightSky,
            child: Image.network(
              logoImageLink[index],
              fit: BoxFit.cover,
              height: 100,
            ),
            inRow: false,
            textColor: ConstColors.lightGrey,
            title: technologyName[index],
          );
        },
      ),
    );
  }
}
