import 'package:flutter/material.dart';
import 'package:resume_builder_app/utils/extension.dart';
import 'package:resume_builder_app/utils/globals.dart';

class ExperiencesPage extends StatefulWidget {
  const ExperiencesPage({super.key});

  @override
  State<ExperiencesPage> createState() => _ExperiencesPageState();
}

class _ExperiencesPageState extends State<ExperiencesPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var isCurrentlyEmployed;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Experience Page'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Company Name',
                  hintText: 'New Enterprise, San Francisco',
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) => Globals.companyName = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the company name';
                  }
                  return null;
                },
              ),
              16.height,
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'School/College/Institute',
                  hintText: 'Quality Test Engineer',
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) => Globals.institute = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your role';
                  }
                  return null;
                },
              ),
              16.height,
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Roles (optional)',
                  hintText: 'Working with team members...',
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) => Globals.role = value,
                maxLines: 3,
              ),
              16.height,
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: const Text('Previously Employed'),
                      leading: Radio<bool>(
                        value: false,
                        groupValue: Globals.isCurrentlyEmployed,
                        onChanged: (bool? value) {
                          setState(() {
                            Globals.isCurrentlyEmployed = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: const Text('Currently Employed'),
                      leading: Radio<bool>(
                        value: true,
                        groupValue: Globals.isCurrentlyEmployed,
                        onChanged: (bool? value) {
                          setState(() {
                            Globals.isCurrentlyEmployed = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              16.height,
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Date Joined',
                        hintText: 'DD/MM/YYYY',
                      ),
                      onSaved: (value) => Globals.dateJoined = value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the date joined';
                        }
                        return null;
                      },
                    ),
                  ),
                  if (!Globals.isCurrentlyEmployed) 16.height,
                  if (!Globals.isCurrentlyEmployed)
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Date Exit',
                          hintText: 'DD/MM/YYYY',
                        ),
                        onSaved: (value) => Globals.dateExit = value,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the date exit';
                          }
                          return null;
                        },
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Form Saved Successfully')),
                    );
                  }
                },
                child: const Text(
                  'SAVE',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
