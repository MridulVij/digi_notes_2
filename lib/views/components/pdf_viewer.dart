import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewer extends StatelessWidget {
  // variable
  final String path;

  // constructor
  const PdfViewer({super.key, required this.path});

  // function
  @override
  Widget build(BuildContext context) {
    return SfPdfViewer.network(path);
  }
}
