import 'package:favorite_places/model/place.dart';
import 'package:flutter/material.dart';

class PlaceDetail extends StatelessWidget {
  final Place place;
  const PlaceDetail({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Place"),
      ),
      body: Stack(
        children: [
          Image.file(
            place.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(place.name),
          ),
        ],
      ),
    );
  }
}
