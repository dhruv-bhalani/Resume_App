import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:resume_builder_app/Routes/App_routes.dart';
import 'package:resume_builder_app/utils/extension.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Home page"),
      ),
      body: Column(
        children: [
          100.height,
          Image.asset("lib/assets/icons/package_2945609.png", height: 200),
          30.height,
          Center(
            child: Text(
              "Welcome to Resume Builder App",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            AppRoutes.buildoptionoage,
          );
        },
        child: Icon(
          Icons.add,
          size: 30,
        ),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
