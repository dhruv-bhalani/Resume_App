import 'package:flutter/material.dart';
import 'package:resume_builder_app/utils/extension.dart';

class EductionPage extends StatefulWidget {
  const EductionPage({super.key});

  @override
  State<EductionPage> createState() => _EductionPageState();
}

class _EductionPageState extends State<EductionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Eduction"),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.green[50],
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(
                      "Course/Degree",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.blue[900]),
                    ),
                  ],
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "B.Tech information Technology",
                    border: OutlineInputBorder(),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "School/College/institute",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.blue[900],
                      ),
                    ),
                  ],
                ),
                10.height,
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Bhagavan Mahavir university",
                    border: OutlineInputBorder(),
                  ),
                ),
                10.height,
                Row(
                  children: [
                    Text(
                      "School/College/institute",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue[900],
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                10.height,
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: " 70% (or) 7.0 CGPA",
                    border: OutlineInputBorder(),
                  ),
                ),
                10.height,
                Row(
                  children: [
                    Text(
                      "Year of Pass",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue[900],
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                10.height,
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "2019",
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
