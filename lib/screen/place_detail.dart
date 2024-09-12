import 'package:favorite_places/model/place.dart';
import 'package:flutter/material.dart';

class PlaceDetail extends StatelessWidget {
  final Place place;
  const PlaceDetail({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Place"),
      ),
      body: Center(child: Text(place.name),),
    );
  }
}
