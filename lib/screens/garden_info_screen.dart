// Garden Information Screen
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:plant_cord/screens/questionnaire_screen.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

class GardenInfoScreen extends StatefulWidget {
  @override
  _GardenInfoScreenState createState() => _GardenInfoScreenState();
}

class _GardenInfoScreenState extends State<GardenInfoScreen> {
  String _gpsCoordinates = '';
  List<XFile> _gardenPhotos = [];
  List<String> _selectedSpecies = [];

  final List<String> _speciesList = [
    'Species 1',
    'Species 2',
    'Species 3',
    // Add more species to the list
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Garden Information'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () async {
                final coordinates = await _getGpsCoordinates();
                setState(() {
                  _gpsCoordinates = coordinates;
                });
              },
              child: Text('Get GPS Coordinates'),
            ),
            SizedBox(height: 10),
            Text(_gpsCoordinates),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final photo = await ImagePicker().pickImage(source: ImageSource.camera);
                setState(() {
                  if (_gardenPhotos.length < 2) {
                    _gardenPhotos.add(photo!);
                  }
                });
              },
              child: Text('Take Garden Photo'),
            ),
            SizedBox(height: 10),
            _gardenPhotos.isEmpty
                ? Text('No photos taken')
                : GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: _gardenPhotos.length,
                    itemBuilder: (context, index) {
                      return Image.file(File(_gardenPhotos[index].path));
                    },
                  ),
            SizedBox(height: 20),
            Text('Select Species:'),
            SizedBox(height: 10),
            Wrap(
              children: _speciesList.map((species) {
                return FilterChip(
                  label: Text(species),
                  selected: _selectedSpecies.contains(species),
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        _selectedSpecies.add(species);
                      } else {
                        _selectedSpecies.remove(species);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Send data to server and handle response
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuestionnaireScreen()),
                );
              },
              child: Text('Submit'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }

Future<String> _getGpsCoordinates() async {
  try {
    final coordinates = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    return '${coordinates.latitude}, ${coordinates.longitude}';
  } catch (e) {
    print('Error getting GPS coordinates: $e');
    return 'Error getting GPS coordinates';
  }
}

}