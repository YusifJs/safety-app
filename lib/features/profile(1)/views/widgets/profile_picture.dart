import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ProfilePicture extends StatefulWidget {
  ProfilePicture({super.key});

  @override
  State<ProfilePicture> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  File? _image;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 117,
      height: 117,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: _image != null
              ? FileImage(_image!)
              : AssetImage("assets/images/profile_picture.jpg"),
          fit: BoxFit.fill,
        ),
        color: Colors.red,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: IconButton(
                onPressed: () {
                  _pickImage();
                },
                icon: Icon(Icons.camera_alt_outlined),
                color: Color(0xFF174C8A),
                iconSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
