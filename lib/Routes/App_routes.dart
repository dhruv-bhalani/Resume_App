import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_builder_app/views/Build_page/Build_page.dart';
import 'package:resume_builder_app/views/Build_page/all_options/Achievements_page/Achievements_page.dart';
import 'package:resume_builder_app/views/Build_page/all_options/Career_Objective_page/Career_objective.dart';
import 'package:resume_builder_app/views/Build_page/all_options/Contact_info_page/contact_info_page.dart';
import 'package:resume_builder_app/views/Build_page/all_options/Declaration_page/Declaration_page.dart';
import 'package:resume_builder_app/views/Build_page/all_options/Eduction_page/Eduction_page.dart';
import 'package:resume_builder_app/views/Build_page/all_options/Experiences_page/Experiences_page.dart';
import 'package:resume_builder_app/views/Build_page/all_options/Personal_Details_page/Personal_details.dart';
import 'package:resume_builder_app/views/Build_page/all_options/Projects_page/Projects_page.dart';
import 'package:resume_builder_app/views/Build_page/all_options/References_page/References_page.dart';
import 'package:resume_builder_app/views/Build_page/all_options/Technicall_Skills_page/Technical_skills_page.dart';
import 'package:resume_builder_app/views/Home_page/Home_page.dart';
import 'package:resume_builder_app/views/black/black.dart';
import 'package:resume_builder_app/views/splash_screen/splash_screen.dart';

class AppRoutes {
  static String Splashscreen = "/";
  static String Black = "blackpage";
  static String Homepage = "Homepage";
  static String buildoptionoage = "build_option_page";

  static String iconpath = "lib/assets/icons/";

  static List<Map<String, dynamic>> alloptions = [
    {
      'icon': "${iconpath}contact_detail-removebg-preview (1).png",
      'title': "contact info",
      'route': "contact_info_paage",
    },
    {
      'icon': "${iconpath}briefcase.png",
      'title': "Career Objective",
      'route': "career_objective_page",
    },
    {
      'icon': "${iconpath}user.png",
      'title': "Personal Details",
      'route': "personal_details_page",
    },
    {
      'icon': "${iconpath}graduation-cap.png",
      'title': "Education",
      'route': "education_info_page",
    },
    {
      'icon': "${iconpath}logical-thinking.png",
      'title': "Experience",
      'route': "experience_info_page",
    },
    {
      'icon': "${iconpath}open-book.png",
      'title': "Interest/Hobbies",
      'route': "Interest/Hobbies_page",
    },
    {
      'icon': "${iconpath}project-management.png",
      'title': "Projects",
      'route': "Projects_page",
    },
    {
      'icon': "${iconpath}experience.png",
      'title': "Achievements",
      'route': "achievements_page",
    },
    {
      'icon': "${iconpath}handshake.png",
      'title': "References",
      'route': "references_page",
    },
    {
      'icon': "${iconpath}declaration.png",
      'title': "Declaration",
      'route': "declaration_page",
    },
  ];
  static Map<String, Widget Function(BuildContext)> routes = {
    Splashscreen: (context) => const SplashScreen(),
    Black: (context) => const Blackpage(),
    Homepage: (context) => const HomePage(),
    buildoptionoage: (context) => const buildoptionpage(),
    alloptions[0]['route']: (context) => const ContactInfoPage(),
    alloptions[1]['route']: (context) => const CareerObjective(),
    alloptions[2]['route']: (context) => const PersonalDetails(),
    alloptions[3]['route']: (context) => const EductionPage(),
    alloptions[4]['route']: (context) => const ExperiencesPage(),
    alloptions[5]['route']: (context) => const TechnicalSkillsPage(),
    alloptions[6]['route']: (context) => const ProjectsPage(),
    alloptions[7]['route']: (context) => const AchievementsPage(),
    alloptions[8]['route']: (context) => const ReferencesPage(),
    alloptions[9]['route']: (context) => const DeclarationPage(),
  };
}
