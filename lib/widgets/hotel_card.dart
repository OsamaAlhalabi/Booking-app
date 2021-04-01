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
      decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(60)
  ),
      height: 150,
      child: Card(
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    imgUrl,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Text(
                      placeName,
                      style: kHotelCard,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Expanded(
       
                      child: StarDisplay(
                    value: rate.toInt(),
                  )),
                  Expanded(
         
                      child: Text(
                        
                        price + ' /per night',
                        
                        style: kHotelCard,
                        textAlign: TextAlign.left,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
