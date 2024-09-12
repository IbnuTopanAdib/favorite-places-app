import 'package:favorite_places/provider/places_provider.dart';
import 'package:favorite_places/screen/add_place_screen.dart';
import 'package:favorite_places/screen/place_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesScreen extends ConsumerStatefulWidget {
  const PlacesScreen({super.key});

  @override
  ConsumerState<PlacesScreen> createState() => _PlacesScreenState();
}

class _PlacesScreenState extends ConsumerState<PlacesScreen> {
  void _addPlace() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const AddPlaceScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final places = ref.watch(placesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorite Places'),
        actions: [
          IconButton(onPressed: _addPlace, icon: const Icon(Icons.add))
        ],
      ),
      body: places.isNotEmpty
          ? ListView.builder(
              itemCount: places.length,
              itemBuilder: (context, index) {
                final place = places[index];
                return ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PlaceDetail(place: place)));
                  },
                  title: Text(
                    place.name,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.white),
                  ),
                );
              })
          : const Center(child: Text('No places added yet')),
    );
  }
}
