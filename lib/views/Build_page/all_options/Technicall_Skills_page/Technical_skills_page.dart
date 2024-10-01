import 'package:flutter/material.dart';
import 'package:resume_builder_app/utils/extension.dart';
import 'package:resume_builder_app/utils/globals.dart';

class TechnicalSkillsPage extends StatefulWidget {
  const TechnicalSkillsPage({super.key});

  @override
  State<TechnicalSkillsPage> createState() => _TechnicalSkillsPageState();
}

class _TechnicalSkillsPageState extends State<TechnicalSkillsPage> {
  List<TextEditingController> allControllers = [];

  @override
  void initState() {
    if (Globals.Technicalskills.isEmpty) {
      allControllers = List.generate(
        2,
        (i) => TextEditingController(),
      );
    } else if (Globals.Technicalskills.length < 2) {
      Globals.Technicalskills.forEach((e) {
        allControllers.add(
          TextEditingController(text: e),
        );
      });
      allControllers.add(TextEditingController());
    } else {
      Globals.Technicalskills.forEach((e) {
        allControllers.add(
          TextEditingController(text: e),
        );
      });
    }

    super.initState();
  }

  @override
  void dispose() {
    Globals.Technicalskills.clear();
    for (int i = 0; i < allControllers.length; i++) {
      if (allControllers[i].text.isNotEmpty) {
        Globals.Technicalskills.add(allControllers[i].text);
      }
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Technical Skills Page"),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListView(
            children: [
              const Text(
                "Enter your skills",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.blue,
                ),
              ),
              Column(
                children: List.generate(
                  allControllers.length,
                  (index) => Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: allControllers[index],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          allControllers[index].clear();
                          allControllers.removeAt(index);
                          setState(() {});
                        },
                        icon: const Icon(Icons.delete_outline),
                      ),
                    ],
                  ),
                ),
              ),
              20.height,
              ElevatedButton.icon(
                onPressed: () {
                  allControllers.add(TextEditingController());
                  setState(() {});
                },
                icon: const Icon(Icons.add),
                label: const Text("Add"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
