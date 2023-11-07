import 'package:flutter/material.dart';

class DashboardUI extends StatefulWidget {
  const DashboardUI({super.key});

  @override
  State<DashboardUI> createState() => _DashboardUIState();
}

class _DashboardUIState extends State<DashboardUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                //

                ElevatedButton(
                    onPressed: () {}, child: Text("Prev Year Question Papers")),
                ElevatedButton(onPressed: () {}, child: Text("Solutions")),
              ],
            ),
            Row(
              children: [
                //
                ElevatedButton(onPressed: () {}, child: Text("Syllabus")),
                ElevatedButton(onPressed: () {}, child: Text("Guide"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
