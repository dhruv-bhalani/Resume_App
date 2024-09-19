import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resume_builder_app/utils/extension.dart';
import 'package:resume_builder_app/utils/globals.dart';

class ContactInfoPage extends StatefulWidget {
  const ContactInfoPage({super.key});

  @override
  State<ContactInfoPage> createState() => _ContactInfoPageState();
}

class _ContactInfoPageState extends State<ContactInfoPage> {
  int index = 0;
  bool hide = true;

  String? name, Nmber, Email, Address;

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void setIndex(int i) {
    index = i;
    setState(() {});
  }

  Future<void> pickImage(ImageSource source) async {
    ImagePicker picker = ImagePicker();

    XFile? file = await picker.pickImage(source: source);

    if (file != null) {
      Globals.image = File(file.path);
      setState(() {});
    } else {
      log("Image picking failed." as num);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Contact Information"),
        ),
        body: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setIndex(0);
                      },
                      child: Container(
                        height: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            bottom: BorderSide(
                              width: index == 0 ? 2.5 : 0,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        child: const Text(
                          "Contact",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                            // height: 3,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setIndex(1);
                      },
                      child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            bottom: BorderSide(
                              width: index == 1 ? 2.5 : 0,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        child: const Text(
                          "Photo",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            // height: 3,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: IndexedStack(
                    index: index,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.all(13),
                        child: SingleChildScrollView(
                          child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Please enter name !!";
                                    } else {
                                      return null;
                                    }
                                  },
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    labelText: "Name",
                                    hintText: "Enter name",
                                    prefixIcon: const Icon(Icons.person),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                                15.height,
                                TextFormField(
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Please enter number !!";
                                    } else {
                                      return null;
                                    }
                                  },
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.done,
                                  decoration: InputDecoration(
                                    labelText: "Number",
                                    hintText: "Enter number",
                                    prefixIcon: const Icon(Icons.phone),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                                15.height,
                                TextFormField(
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Please enter email !!";
                                    } else {
                                      return null;
                                    }
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    labelText: "Email",
                                    hintText: "Enter email",
                                    prefixIcon: const Icon(Icons.email),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                                15.height,
                                TextFormField(
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Please enter address !!";
                                    } else {
                                      return null;
                                    }
                                  },
                                  keyboardType: TextInputType.streetAddress,
                                  textInputAction: TextInputAction.done,
                                  decoration: InputDecoration(
                                    labelText: "Address",
                                    hintText: "Enter address",
                                    prefixIcon: const Icon(Icons.location_on),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                                30.height,
                                Text("Name: ${nameController.text}"),
                                Text("Number: ${numberController.text}"),
                                Text("Email: ${emailController.text}"),
                                Text("Address: ${addressController.text}"),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            bool valid = formKey.currentState!
                                                .validate();
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.blue,
                                            // text color
                                          ),
                                          child: const Text(
                                            "Submit",
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                      15.width,
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            nameController.clear();
                                            numberController.clear();
                                            emailController.clear();
                                            addressController.clear();
                                            setState(() {});
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red,
                                            // text color
                                          ),
                                          child: const Text(
                                            "Camcel",
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.all(13),
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 0.30,
                        alignment: Alignment.center,
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.blue.shade300,
                              radius: 70,
                              foregroundImage: Globals.image != null
                                  ? FileImage(Globals.image!)
                                  : null,
                              child: const Text(
                                "Add Image",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            FloatingActionButton.small(
                              backgroundColor: Colors.white70,
                              onPressed: () {
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    backgroundColor: Colors.white,
                                    title: const Text("Select Image Source"),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ListTile(
                                          leading: const Icon(Icons.camera),
                                          title: const Text("Camera"),
                                          onTap: () {
                                            pickImage(ImageSource.camera);
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        ListTile(
                                          leading: const Icon(Icons.photo),
                                          title: const Text("Gallery"),
                                          onTap: () {
                                            pickImage(ImageSource.gallery);
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              child: const Icon(Icons.add_a_photo),
                            ),
                          ],
                        ),
                      )
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
