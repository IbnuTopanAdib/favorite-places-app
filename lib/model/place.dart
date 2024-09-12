class Place {
  final String uid;
  final String name;


  Place({required this.name})
      : uid = DateTime.now().toString();
}
