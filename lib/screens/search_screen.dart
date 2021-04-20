import 'package:booking_app/constants.dart';
import 'package:booking_app/screens/hotels_screen.dart';
import 'package:booking_app/services/networking.dart';
import 'package:booking_app/widgets/complete_search_field.dart';
import 'package:booking_app/widgets/loading_spin.dart';
import 'package:flutter/material.dart';

class WelcomScreen extends StatefulWidget {
  @override
  _WelcomScreenState createState() => _WelcomScreenState();
}

class _WelcomScreenState extends State<WelcomScreen> {
  var cityFieldController = TextEditingController();
  var checkInController = TextEditingController();
  var checkOutController = TextEditingController();
  var guestCountController = TextEditingController();
  bool searchButtonPressed = false;
  bool check() {
    if (cityFieldController.text.isEmpty ||
        checkInController.text.isEmpty ||
        checkOutController.text.isEmpty ||
        guestCountController.text.isEmpty) {
      return false;
    }
    return true;
  }

  void getLocation() async {
    NetworkHelper nh = NetworkHelper();
    var loc = await nh.getLocation(cityFieldController.text);
    var res = await nh
        .getHotel(loc['suggestions'][0]['entities'][0]['destinationId']);
    searchButtonPressed = false;
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationPlaces: res,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: new BoxDecoration(
                image: new DecorationImage(
              image: new AssetImage("assets/hotel3.jpg"),
              fit: BoxFit.fill,
            )),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.7),
                ),
                margin: EdgeInsets.fromLTRB(20, 140, 20, 140),
                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'FIND YOUR HOTEL',
                      style: kCardTitle,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SearchField(
                        title: 'City Name',
                        hintText: 'City, Country, etc..',
                        width: MediaQuery.of(context).size.width,
                        checkInController: cityFieldController,
                        searchButtonPressed: searchButtonPressed,
                        textInputType: TextInputType.name,
                        ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        SearchField(
                            title: 'Check-In',
                            hintText: '10/06/2021',
                            width: MediaQuery.of(context).size.width / 2.55,
                            checkInController: checkInController,
                            searchButtonPressed: searchButtonPressed,
                            textInputType: TextInputType.numberWithOptions(),),
                        SearchField(
                            title: 'Check-Out',
                            hintText: '23/06/2021',
                            width: MediaQuery.of(context).size.width / 2.55,
                            checkInController: checkOutController,
                            searchButtonPressed: searchButtonPressed,
                            textInputType: TextInputType.numberWithOptions(),),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SearchField(
                        title: 'Number of Guest',
                        hintText: '2 Guests',
                        width: MediaQuery.of(context).size.width,
                        checkInController: guestCountController,
                        searchButtonPressed: searchButtonPressed,
                        textInputType: TextInputType.numberWithOptions(),),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 142),
                      child: FloatingActionButton.extended(
                        backgroundColor: Color(0xFFE0B84C),
                        onPressed: () {
                          setState(() {
                            searchButtonPressed = true;
                          });
                          if (check()) {
                            getLocation();
                          }
                        },
                        label: Text(
                          'Search',
                          style: TextStyle(
                              color: Colors.black54,
                              fontFamily: 'Lobster',
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          LoadingSpinWidget(
              searchButtonPressed: searchButtonPressed && check()),
        ],
      ),
    );
  }
}
