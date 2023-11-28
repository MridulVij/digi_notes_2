// import 'dart:typed_data';
// import 'package:excel/excel.dart' as excel;
// import 'package:flutter/material.dart';
// import 'dart:io';

// class XlsViewer extends StatefulWidget {
//   final String filePath;

//   XlsViewer({required this.filePath});

//   @override
//   _XlsViewerState createState() => _XlsViewerState();
// }

// class _XlsViewerState extends State<XlsViewer> {
//   late excel.Excel _excel;
//   late List<List<String>> _data;

//   @override
//   void initState() {
//     super.initState();
//     _loadExcelFile();
//   }

//   Future<void> _loadExcelFile() async {
//     var bytes = File(widget.filePath).readAsBytesSync();
//     var excel = excel.Excel.decodeBytes(Uint8List.fromList(bytes));

//     for (var table in excel.tables.keys) {
//       print(table); //sheet Name
//       print(excel.tables[table]!.maxCols);
//       print(excel.tables[table]!.maxRows);
//       for (var row in excel.tables[table]!.rows) {
//         print('$row');
//       }
//     }

//     setState(() {
//       _excel = excel;
//       _data = excel.tables[excel.tables.keys.first]!.rows.map((row) {
//         return row.map((cell) => cell.toString()).toList();
//       }).toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('XLS Viewer'),
//       ),
//       body: _excel == null
//           ? Center(child: CircularProgressIndicator())
//           : SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: DataTable(
//                 columns: _data.isNotEmpty
//                     ? _data[0]
//                         .map((header) => DataColumn(label: Text(header)))
//                         .toList()
//                     : [],
//                 rows: _data
//                     .skip(1)
//                     .map(
//                       (row) => DataRow(
//                         cells: row.map((cell) => DataCell(Text(cell))).toList(),
//                       ),
//                     )
//                     .toList(),
//               ),
//             ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: XlsViewer(filePath: 'path/to/your/excel/file.xls'),
//   ));
// }
