import 'package:flutter/material.dart';
import 'package:resume_builder_app/Routes/App_routes.dart';

class Blackpage extends StatefulWidget {
  const Blackpage({super.key});

  @override
  State<Blackpage> createState() => _BlackpageState();
}

class _BlackpageState extends State<Blackpage> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 90), () {
      Navigator.of(context).pushReplacementNamed(AppRoutes.Homepage);
    });
    return Scaffold(
      body: Container(
        color: Colors.black,
      ),
    );
  }
}
