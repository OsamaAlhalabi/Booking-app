import 'package:booking_app/constants.dart';
import 'package:booking_app/screens/hotels_screen.dart';
import 'package:booking_app/services/networking.dart';
import 'package:booking_app/widgets/loading_spin.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
              image: new AssetImage("assets/hotel.jpg"),
              fit: BoxFit.fill,
            )),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black.withOpacity(0.6),
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
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(
                        'City Name',
                        textAlign: TextAlign.start,
                        style: kFieldTitle,
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2.55,
                        child: Center(
                          child: TextField(
                            style: kInputText,
                            controller: cityFieldController,
                            decoration: kInputField.copyWith(
                              hintText: 'City, Country, etc..',
                              errorText: cityFieldController.text.isEmpty &&
                                      searchButtonPressed
                                  ? 'Value Can\'t Be Empty'
                                  : null,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Text(
                                'Check-In',
                                style: kFieldTitle,
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                              child: Container(
                                width: MediaQuery.of(context).size.width / 2.55,
                                child: Center(
                                  child: TextField(
                                    keyboardType: TextInputType.datetime,
                                    controller: checkInController,
                                    style: kInputText,
                                    decoration: kInputField.copyWith(
                                      hintText: '4/4/2021',
                                      errorText:
                                          checkInController.text.isEmpty &&
                                                  searchButtonPressed
                                              ? 'Value Can\'t Be Empty'
                                              : null,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Text(
                                'Check-Out',
                                style: kFieldTitle,
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                              child: Container(
                                width: MediaQuery.of(context).size.width / 2.55,
                                child: Center(
                                  child: TextField(
                                      keyboardType: TextInputType.datetime,
                                      controller: checkOutController,
                                      style: kInputText,
                                      decoration: kInputField.copyWith(
                                        hintText: '16/4/2021',
                                        errorText:
                                            checkOutController.text.isEmpty &&
                                                    searchButtonPressed
                                                ? 'Value Can\'t Be Empty'
                                                : null,
                                      )),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(
                        'Number of Guests',
                        textAlign: TextAlign.start,
                        style: kFieldTitle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2.55,
                        child: Center(
                          child: TextField(
                              keyboardType: TextInputType.number,
                              controller: guestCountController,
                              style: kInputText,
                              decoration: kInputField.copyWith(
                                hintText: '2 Guests',
                                errorText: guestCountController.text.isEmpty &&
                                        searchButtonPressed
                                    ? 'Value Can\'t Be Empty'
                                    : null,
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.white70,
                      onPressed: () {
                        setState(() {
                          searchButtonPressed = true;
                        });
                        if (check()) {
                          getLocation();
                        }
                      },
                      child: Icon(
                        FontAwesomeIcons.search,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          LoadingSpinWidget(searchButtonPressed: searchButtonPressed && check()),
        ],
      ),
    );
  }
}
