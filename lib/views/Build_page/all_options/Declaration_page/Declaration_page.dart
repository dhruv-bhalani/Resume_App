import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:resume_builder_app/utils/extension.dart';
import 'package:resume_builder_app/utils/globals.dart';

class DeclarationPage extends StatefulWidget {
  const DeclarationPage({super.key});

  @override
  State<DeclarationPage> createState() => _DeclarationPageState();
}

class _DeclarationPageState extends State<DeclarationPage> {
  DateTime? date;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Declaration"),
      ),
      backgroundColor: Colors.green[50],
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Declaration"),
                  Switch(
                    value: Globals.isChecked,
                    onChanged: (val) {
                      Globals.isChecked = val;
                      setState(() {});
                    },
                  ),
                ],
              ),
              Visibility(
                visible: Globals.isChecked,
                child: Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset("lib/assets/icons/target.png",
                              height: 50, width: 50),
                        ],
                      ),
                      30.height,
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Description",
                        ),
                      ),
                      const Text(
                          "------------------------------------------------------------------------------"),
                      25.height,
                      const Row(
                        children: [
                          Text(
                            "Date",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            date != null
                                ? DateFormat('dd/MM/yyyy').format(
                                    date!,
                                  )
                                : 'DD/MM/YYYY',
                          ),
                        ],
                      ),
                      Row(
                        children: [
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
                      10.height,
                      const Row(
                        children: [
                          Text(
                            "Place(Interview venue/city)",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      10.height,
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Eg. Surat",
                        ),
                      ),
                      10.height,
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        onPressed: () {},
                        child: Text(
                          "SAVE",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
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
