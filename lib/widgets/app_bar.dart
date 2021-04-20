
import 'package:booking_app/constants.dart';
import 'package:booking_app/screens/search_screen.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Color(0xFFF9F9F9), spreadRadius: 5, blurRadius: 2)
      ]),
      height: 84,
      child: Container(
        decoration: BoxDecoration(
            color: kGoldColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return WelcomScreen();
                  }));
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 10, 0, 0),
                  child: Icon(
                    Icons.navigate_before,
                    size: 25,
                    color: Color(0xFFF9F9F9),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 12, 0),
                child: Text(
                  "Available Hotels",
                  style: TextStyle(
                    fontSize: 30,
                    color: Color(0xFFF9F9F9),
                    fontFamily: 'Sans',
                  ),
                ),
              ),
              Icon(
                Icons.navigate_before,
                color: Colors.transparent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
