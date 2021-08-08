// @dart=2.9
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context).settings.arguments as Map;
    print('data');
    print(data);

    //set background image
    String bgImage;

    bgImage = data['isDaytime'] ? 'night.jpg' : 'day.jpg';
    Color bgcolor = data['isDaytime'] ? Colors.blue : Colors.indigo[700];
    Color timecolor = data['isDaytime'] ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/$bgImage'), fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 120),
            child: Column(
              children: <Widget>[
                TextButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDaytime': result['isDaytime'],
                        'flag': result['flag'],
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: timecolor,
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      fontSize: 20,
                      color: timecolor,
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
                      style: TextStyle(
                          fontSize: 25.0, letterSpacing: 2.0, color: timecolor),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Text(
                  data['time'],
                  style: TextStyle(
                      fontSize: 60.0, letterSpacing: 2.0, color: timecolor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
