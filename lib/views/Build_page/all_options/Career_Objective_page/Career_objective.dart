import 'package:flutter/material.dart';

class CareerObjective extends StatefulWidget {
  const CareerObjective({super.key});

  @override
  State<CareerObjective> createState() => _CareerObjectiveState();
}

class _CareerObjectiveState extends State<CareerObjective> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Career Objective"),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.green[50],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: 400,
          height: 330,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListView(
            children: [
              Row(
                children: [
                  // Padding(padding: EdgeInsets.all(16.0)),
                  Text(
                    "Career Objective",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.blue[900],
                    ),
                  ),
                ],
              ),
              TextFormField(
                maxLines: 5,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(),
                  // labelText: "Description",
                  hintText: "Description",
                  // prefixIcon: Icon(Icons.description),
                  border: OutlineInputBorder(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  "Current Designation (Experience Candidate",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.blue[900],
                  ),
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(),
                  // labelText: "Description",
                  hintText: "Software Engineer",
                  // prefixIcon: Icon(Icons.description),
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
