// Questionnaire Screen
import 'package:flutter/material.dart';

class QuestionnaireScreen extends StatefulWidget {
  @override
  _QuestionnaireScreenState createState() => _QuestionnaireScreenState();
}

class _QuestionnaireScreenState extends State<QuestionnaireScreen> {
  bool _kijaniBefore = false;
  bool _hasContract = false;
  String _groupName = '';
  int _survivingTrees = 0;
  DateTime _lastTreeCount = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Questionnaire')),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Have you worked with Kijani before?'),
            Row(
              children: [
                Radio(
                  value: true,
                  groupValue: _kijaniBefore,
                  onChanged: (value) {
                    setState(() {
                      _kijaniBefore = value!;
                    });
                  },
                ),
                Text('Yes'),
                Radio(
                  value: false,
                  groupValue: _kijaniBefore,
                  onChanged: (value) {
                    setState(() {
                      _kijaniBefore = value!;
                    });
                  },
                ),
                Text('No'),
              ],
            ),
            _kijaniBefore
                ? TextField(
                    decoration: InputDecoration(
                      labelText: 'Previous group name',
                    ),
                    onChanged: (value) {
                      setState(() {
                        _groupName = value;
                      });
                    },
                  )
                : Container(),
            Text('How many surviving trees?'),
            TextField(
              decoration: InputDecoration(
                labelText: 'Number of trees',
              ),
              onChanged: (value) {
                setState(() {
                  _survivingTrees = int.parse(value);
                });
              },
            ),
            Text('When was the last tree count conducted?'),
            TextField(
              decoration: InputDecoration(
                labelText: 'Date',
              ),
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: _lastTreeCount,
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2030),
                );
                setState(() {
                  if (date != null) {
                    _lastTreeCount = date;
                  }
                });
              },
            ),
            Text('Do you have a contract with Kijani?'),
            Row(
              children: [
                Radio(
                  value: true,
                  groupValue: _hasContract,
                  onChanged: (value) {
                    setState(() {
                      _hasContract = value!;
                    });
                  },
                ),
                Text('Yes'),
                Radio(
                  value: false,
                  groupValue: _hasContract,
                  onChanged: (value) {
                    setState(() {
                      _hasContract = value!;
                    });
                  },
                ),
                Text('No'),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                // Send data to server and handle response
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}