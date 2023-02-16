import 'dart:convert';

import 'package:aasf_iiitmg/src/styles/basestyle.dart';
import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:aasf_iiitmg/src/utils/constants.dart';
import 'package:aasf_iiitmg/src/widgets/AppProfileField.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _pickedimage;

  Future uploadImage() async {
    var token = ConstantsVar.studentData['token'];
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'authorization': 'Token $token'
    };

    Map data = {
      'dp': _pickedimage?.path,
    };

    print(data);
    try {
      var response = await http.put(
          Uri.parse('http://192.168.64.185:3000/users/dp'),
          body: jsonEncode(data['dp']),
          headers: headers);

      print(response.body);
      if (response.statusCode == 200) {
        print("upload successful");
      } else {
        print("unable to upload image");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.primarycolor(),
      appBar:
          BaseStyle.appbar(backbtn: false, title: "Profile", context: context),
      body: ListView(
        children: [
          const SizedBox(
            height: 50,
          ),
          Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: _pickedimage != null
                      ? FileImage(_pickedimage!)
                      : NetworkImage(ConstantsVar.studentData['user']['dp'])
                          as ImageProvider,
                ),
              ),
              Positioned(
                left: 230,
                top: 120,
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Appcolors.yew(),
                  child: IconButton(
                      onPressed: () {
                        selectImage();
                        setState(() {});
                      },
                      icon: const Icon(Icons.camera_alt)),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          AppProfileFiled(
              fieldname: 'Name',
              text: ConstantsVar.studentData['user']['name'],
              imgurl: 'assets/images/person.png'),
          const SizedBox(
            height: 10,
          ),
          BaseStyle.linealignment(0.8),
          AppProfileFiled(
              fieldname: 'Roll No.',
              text: ConstantsVar.studentData['user']['_id'],
              imgurl: 'assets/images/badge.png'),
          const SizedBox(
            height: 10,
          ),
          BaseStyle.linealignment(0.5),
          AppProfileFiled(
              fieldname: 'Email',
              text: ConstantsVar.studentData['user']['email'],
              imgurl: 'assets/images/mail.png'),
          const SizedBox(
            height: 10,
          ),
          BaseStyle.linealignment(0.4),
        ],
      ),
    );
  }

  selectImageFromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(
        source: ImageSource.gallery, imageQuality: 50, maxWidth: 150);
    final pickedimagefile = File(pickedImage!.path);
    print("images $pickedimagefile");
    setState(() {
      _pickedimage = pickedimagefile;
    });
  }

  //
  selectImageFromCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(
        source: ImageSource.camera, imageQuality: 50, maxWidth: 150);
    final pickedimagefile = File(pickedImage!.path);
    print("images $pickedimagefile");

    setState(() {
      _pickedimage = pickedimagefile;
    });
  }

  Future selectImage() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 150,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    const Text(
                      'Select Image From !',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            await selectImageFromGallery();
                            Navigator.pop(context);
                            setState(() {});
                          },
                          child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/gallery.png',
                                      height: 60,
                                      width: 60,
                                    ),
                                    Text('Gallery'),
                                  ],
                                ),
                              )),
                        ),
                        GestureDetector(
                          onTap: () async {
                            await selectImageFromCamera();

                            Navigator.pop(context);
                            setState(() {});
                          },
                          child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/camera.png',
                                      height: 60,
                                      width: 60,
                                    ),
                                    Text('Camera'),
                                  ],
                                ),
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
