import 'package:aasf_iiitmg/src/styles/basestyle.dart';
import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:aasf_iiitmg/src/utils/constants.dart';
import 'package:aasf_iiitmg/src/widgets/AppProfileField.dart';
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

  void _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(
        source: ImageSource.camera, imageQuality: 50, maxWidth: 150);
    final pickedimagefile = File(pickedImage!.path);

    setState(() {
      _pickedimage = pickedimagefile;
    });
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
                      onPressed: _pickImage,
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
}
