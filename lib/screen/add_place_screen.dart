import 'package:favorite_places/model/place.dart';
import 'package:favorite_places/provider/places_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _formKey = GlobalKey<FormState>();
  String _enteredTitle = '';
  void _savePlace() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ref.read(placesProvider.notifier).addPlace(Place(name: _enteredTitle));
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add place'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Place Name',
                  ),
                  initialValue: _enteredTitle,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Place name cannot be empty';
                    }

                    if (value.trim().length < 3) {
                      return 'Place name must be at least 3 characters long';
                    }

                    final validCharacters = RegExp(r'^[a-zA-Z0-9 ]+$');
                    if (!validCharacters.hasMatch(value.trim())) {
                      return 'Place name can only contain letters, numbers, and spaces';
                    }

                    return null;
                  },
                  onSaved: (newValue) {
                    _enteredTitle = newValue!;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(onPressed: _savePlace, child: Text('Submit'))
              ],
            )),
      ),
    );
  }
}
