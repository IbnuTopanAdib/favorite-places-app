import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  final void Function(File image) onPickImage;
  const ImageInput({super.key, required this.onPickImage});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _selectedImage;

  void _takePicture() async {
    final imagePicker = ImagePicker();

    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.camera,
    );
    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
      widget.onPickImage(_selectedImage!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 250,
        decoration: BoxDecoration(
            border:
                Border.all(width: 1, color: Theme.of(context).primaryColor)),
        alignment: Alignment.center,
        child: _selectedImage == null
            ? TextButton.icon(
                onPressed: _takePicture,
                label: const Text('Place Picture'),
                icon: const Icon(Icons.camera),
              )
            : GestureDetector(
                onTap: _takePicture,
                child: Image.file(
                  _selectedImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ));
  }
}
