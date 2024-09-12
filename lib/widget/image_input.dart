import 'package:flutter/material.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  void _takePicture() {}
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Theme.of(context).primaryColor)),
      alignment: Alignment.center,
      child: TextButton.icon(
          onPressed: _takePicture, label: const Text('Place Picture')),
    );
  }
}
