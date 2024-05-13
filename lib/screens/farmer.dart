// Farmer Information Screen
import 'package:flutter/material.dart';
import 'package:plant_cord/screens/garden_info_screen.dart';

class FarmerInfoScreen extends StatefulWidget {
  @override
  _FarmerInfoScreenState createState() => _FarmerInfoScreenState();
}

class _FarmerInfoScreenState extends State<FarmerInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  String _firstName = '';
  String _lastName = '';
  String _middleName = '';
  String _nationalId = '';
  String _gender = 'Male';
  String _contact = '';
  String _nextOfKinDetails = '';
  String _nextOfKinContact = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Farmer Information'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'First Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter first name';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _firstName = value;
                  });
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter last name';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _lastName = value;
                  });
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Middle Name',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _middleName = value;
                  });
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'National ID Number',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter national ID number';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _nationalId = value;
                  });
                },
              ),
              SizedBox(height: 10),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  labelText: 'Gender',
                  border: OutlineInputBorder(),
                ),
                value: _gender,
                onChanged: (value) {
                  setState(() {
                    _gender = value as String;
                  });
                },
                items: ['Male', 'Female'].map((gender) {
                  return DropdownMenuItem(
                    value: gender,
                    child: Text(gender),
                  );
                }).toList(),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Contact',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty || !value.isNumericOnly) {
                    return 'Please enter a valid contact number';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _contact = value;
                  });
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Next of Kin Details',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _nextOfKinDetails = value;
                  });
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Next of Kin Contact',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _nextOfKinContact = value;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GardenInfoScreen(),
                      ),
                    );
                    // Send data to server and handle response
                  }
                },
                child: Text('Next'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension on String {
  bool get isNumericOnly {
    return RegExp(r'^[0-9]+$').hasMatch(this);
  }
}