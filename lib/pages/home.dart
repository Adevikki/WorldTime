import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Map;
    print('data');
    print(data);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TextButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/location');
              },
              icon: Icon(
                Icons.edit_location,
                color: Colors.black,
              ),
              label: Text(
                'Edit Location',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  letterSpacing: 2,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  data['location'],
                  style: TextStyle(fontSize: 25.0, letterSpacing: 2.0),
                ),
              ],
            ),
            SizedBox(height: 15.0),
            Text(
              data['time'],
              style: TextStyle(fontSize: 60.0, letterSpacing: 2.0),
            ),
          ],
        ),
      ),
    );
  }
}
