import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker(this.imagePickFn);

  final void Function(File pickedImage) imagePickFn;

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _pickedImage;
  void _pickImage() async {
    final ImagePicker picker = ImagePicker();
    var pickedFile = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 65, //0-100
      maxWidth: 150,
    );

    setState(() {
      _pickedImage = File(pickedFile!.path);
    });
    widget.imagePickFn(_pickedImage!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundImage:
              _pickedImage != null ? FileImage(_pickedImage!) : null,
        ),
        TextButton.icon(
          style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).hintColor),
          onPressed: _pickImage,
          icon: Icon(
            Icons.image,
          ),
          label: Text(
            'Add Image',
            style: TextStyle(),
          ),
        ),
      ],
    );
  }
}
