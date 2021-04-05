import 'package:booking_app/constants.dart';
import 'package:booking_app/widgets/star_display.dart';
import 'package:flutter/material.dart';

class HotelCard extends StatelessWidget {

  HotelCard(
      {@required this.imgUrl,
      @required this.placeName,
      @required this.rate,
      @required this.price});
  final String imgUrl;
  final String placeName;
  final double rate;
  final String price;

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(12.0),
      height: 250,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: MediaQuery.of(context).size.width * .59,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image : NetworkImage(imgUrl),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius : 7,
                    spreadRadius: 1,
                    color: Colors.black12, 
                  )
                  
                ]
              ),
              
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
              child: Container(
              width: MediaQuery.of(context).size.width * .43,
              height: 250.0,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white,
                boxShadow: [
                    BoxShadow(
                      blurRadius : 7,
                      spreadRadius: 1,
                      color: Colors.black12, 
                    )
                  ]
              ),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  placeName,
                  style: kHotelCard,
                  textAlign: TextAlign.left,
                ),
                StarDisplay(
                  value: rate.toInt(),
                ),
                Text(
                  
                  price + ' /per night',
                  
                  style: kHotelCard,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            ),
          )
        ],
      ),
    );
  }
}