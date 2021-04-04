import 'package:booking_app/constants.dart';
import 'package:booking_app/screens/hotels_screen.dart';
import 'package:booking_app/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  LoadingScreen(
      {@required this.location, this.checkIn, this.checkOut, this.guestCount});
  final location;
  final checkIn;
  final checkOut;
  final guestCount;
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    print(widget.location);
    getLocation();
    super.initState();
  }

  void getLocation() async {
    NetworkHelper nh = NetworkHelper();
    var loc = await nh.getLocation(widget.location);
    var res = await nh
        .getHotel(loc['suggestions'][0]['entities'][0]['destinationId']);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationPlaces: res,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    String location = widget.location;
    return Scaffold(
      backgroundColor: Color(0xFF2A6CDC),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SpinKitFadingFour(
              color: Colors.white,
              size: 50.0,
            ),
            SizedBox(
              height: 25.0,
            ),
            Text(
              'Searching in $location, Please wait a second!',
              style: kFieldTitle,
            ),
          ],
        ),
      ),
    );
  }
}
