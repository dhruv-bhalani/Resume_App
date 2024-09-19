import 'package:flutter/material.dart';
import 'package:resume_builder_app/Routes/App_routes.dart';

class buildoptionpage extends StatefulWidget {
  const buildoptionpage({super.key});

  @override
  State<buildoptionpage> createState() => _buildoptionpageState();
}

class _buildoptionpageState extends State<buildoptionpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("buildoption page"),
      ),
      body: Column(
        children: AppRoutes.alloptions
            .map(
              (e) => ListTile(
                leading: Image.asset(
                  e['icon'],
                  height: 40,
                ),
                title: Text(e['title'],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    )),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(e['route']);
                  },
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
