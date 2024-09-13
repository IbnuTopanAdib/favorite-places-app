// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

class Place {
  final String uid;
  final String name;
  final File image;

  Place({
    required this.name,
    required this.image,
  }) : uid = DateTime.now().toString();
}
