// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
//import 'package:world_time/pages/home.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  //String time = 'loading...';

  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();
    //Map dada;
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
    print(instance.time);
  }
  //Navigator.push(context, new MaterialPageRoute( builder: (context) => new Home()));

  //print(instance.time);
  /*setState(() {
    time = instance.time!;
  });*/

  /*//simulate network request for a username
    String username = await Future.delayed(Duration(seconds: 3),(){
      return 'adevikki';
    });

    //simulate network request to get bio of the username
    String bio = await Future.delayed(Duration(seconds: 2),(){
      return 'programmer';
    });
    print('$username - $bio' );*/

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
