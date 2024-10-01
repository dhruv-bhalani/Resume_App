import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:resume_builder_app/utils/extension.dart';
import 'package:resume_builder_app/utils/globals.dart';

class ExperiencesPage extends StatefulWidget {
  const ExperiencesPage({super.key});

  @override
  State<ExperiencesPage> createState() => _ExperiencesPageState();
}

class _ExperiencesPageState extends State<ExperiencesPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DateTime? date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Experience Page'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Text(
                "Company Name",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.blue[900],
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
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
              16.height, // This should be an extension method for spacing
              Text(
                'School/College/Institute',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.blue[900],
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
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
              Text(
                'Roles (optional)',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.blue[900],
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText:
                      'Working with team members to come up with new concepts and product analysis...',
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) => Globals.role = value,
                maxLines: 2,
              ),
              16.height,
              Text(
                'Employed Status',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.blue[900],
                ),
              ),
              ListTile(
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
              ListTile(
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
              16.height,
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Date Entry',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.blue[900],
                          ),
                        ),
                        10.height,
                        Text(
                          date != null
                              ? DateFormat('dd/MM/yyyy').format(date!)
                              : 'DD/MM/YYYY',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.blue[900],
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      date = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                        initialDate: DateTime.now(),
                      );

                      setState(() {});
                    },
                    icon: const Icon(Icons.calendar_month),
                  ),
                ],
              ),
              if (!Globals.isCurrentlyEmployed) 16.height,
              if (!Globals.isCurrentlyEmployed)
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Date Exit',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.blue[900],
                            ),
                          ),
                          10.height,
                          Text(
                            date != null
                                ? DateFormat('dd/MM/yyyy').format(date!)
                                : 'DD/MM/YYYY',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.blue[900],
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        date = await showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                          initialDate: DateTime.now(),
                        );

                        setState(() {});
                      },
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              20.height,
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
