
import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  final price;
  const PriceWidget({
    Key key,
    this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 24, top: 50),
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              price + ' /per day',
              style: TextStyle(
                fontFamily: 'Sans',
                fontSize: 16.2,
                color: Colors.black,
              ),
            ),
          ],
        ));
  }
}
