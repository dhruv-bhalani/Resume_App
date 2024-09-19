import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:resume_builder_app/Routes/App_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(AppRoutes.Black);
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: kIsWeb
            ? Image.network("lib/assets/Gif/Developer activity.gif")
            : Image.asset("lib/assets/Gif/Developer activity.gif"),
      ),
    );
  }
}
