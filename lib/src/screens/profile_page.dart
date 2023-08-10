// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';

import 'package:aasf_iiitmg/src/controller/studentsData.dart';
import 'package:aasf_iiitmg/src/styles/basestyle.dart';
import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:aasf_iiitmg/src/utils/constants.dart';
import 'package:aasf_iiitmg/src/widgets/appprofilefield.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatefulWidget {
  final Map<String, dynamic> studentData;
  const ProfilePage({super.key, required this.studentData});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _pickedimage;

  Future<void> uploadImage(File imageFile) async {
    final authToken = widget.studentData['token']['token'];

    try {
      var request = http.MultipartRequest(
        'PATCH',
        Uri.parse('${ConstantsVar.url}/user'),
      );

      request.headers["Authorization"] = "Bearer $authToken";

      request.fields['image'] = imageFile.path;

      var multipartFile = await http.MultipartFile.fromPath(
        'image',
        imageFile.path,
      );

      request.files.add(multipartFile);

      var response = await request.send();

      if (response.statusCode == 200) {
        var jsonResponse = await response.stream.bytesToString();
        var imageUrl = jsonDecode(jsonResponse)['data']['image'];

        await udpateImage(imageUrl);
        setState(() {});

        print("################ upload successful");
      } else {
        print("error response api $response");
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
        appBar: BaseStyle.appbar(
            backbtn: false, title: "Profile", context: context),
        body: FutureBuilder<Map<String, dynamic>>(
            future: StudentDetails.getStudentDataFromLocalStorage(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(child: Text('Error loading data'));
              } else {
                final studentData = snapshot.data;

                return ListView(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Stack(
                      children: [
                        Align(
                            alignment: Alignment.topCenter,
                            child: studentData!['image'] == null
                                ? CircleAvatar(
                                    radius: 80,
                                    child: Image.asset(
                                        'assets/images/userlogo.png'))
                                : CircleAvatar(
                                    radius: 80,
                                    backgroundImage:
                                        NetworkImage(studentData['image']),
                                  )),
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
                        text: widget.studentData['first_name'] +
                            ' ' +
                            widget.studentData['last_name'],
                        imgurl: 'assets/images/person.png'),
                    const SizedBox(
                      height: 10,
                    ),
                    BaseStyle.linealignment(0.8),
                    AppProfileFiled(
                        fieldname: 'Roll No.',
                        text: widget.studentData['id'],
                        imgurl: 'assets/images/badge.png'),
                    const SizedBox(
                      height: 10,
                    ),
                    BaseStyle.linealignment(0.5),
                    AppProfileFiled(
                        fieldname: 'Email',
                        text: widget.studentData['email'],
                        imgurl: 'assets/images/mail.png'),
                    const SizedBox(
                      height: 10,
                    ),
                    BaseStyle.linealignment(0.4),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () async {
                              await launchUrl(
                                  Uri.parse(widget.studentData['github_url']));
                            },
                            icon: SvgPicture.asset('assets/images/github.svg')),
                        IconButton(
                            onPressed: () async {
                              await launchUrl(Uri.parse(
                                  widget.studentData['linkedin_url']));
                            },
                            icon:
                                SvgPicture.asset('assets/images/linkedin.svg'))
                      ],
                    )
                  ],
                );
              }
            }));
  }

  selectImageFromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    final pickedimagefile = File(pickedImage!.path);
    print("images $pickedimagefile");
    setState(() {
      _pickedimage = pickedimagefile;
    });
    if (_pickedimage != null) {
      print(_pickedimage!.path.split('.').last);
      await uploadImage(pickedimagefile);
    }
  }

  //
  selectImageFromCamera() async {
    final picker = ImagePicker();
    final pickedImage =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    final pickedimagefile = File(pickedImage!.path);
    print("################ $pickedimagefile");
    print("################ $pickedImage.toString()");

    setState(() {
      _pickedimage = pickedimagefile;
    });

    if (_pickedimage != null) {
      print(_pickedimage!.path.split('.').last);
      await uploadImage(_pickedimage!);
    }
  }

  Future<void> selectImage() async {
    return showDialog(
        context: context,
        useRootNavigator: false,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: SizedBox(
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
                                    const Text('Gallery'),
                                  ],
                                ),
                              )),
                        ),
                        GestureDetector(
                          onTap: () async {
                            await selectImageFromCamera();
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
                                    const Text('Camera'),
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

  Future<void> udpateImage(String imageUrl) async {
    print("update image url $imageUrl");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? studentDataString = prefs.getString('studentData');
    print("###### $studentDataString");
    if (studentDataString != null) {
      var studentData = jsonDecode(studentDataString);
      studentData["image"] = imageUrl;
      prefs.setString('studentData', jsonEncode(studentData));
    }
  }
}
