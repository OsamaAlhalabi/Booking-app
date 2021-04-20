
import 'package:flutter/material.dart';

class RowItemWidget extends StatelessWidget {
  final String name;
  final String value;

  const RowItemWidget({Key key, this.name, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          name,
          style: TextStyle(
            fontFamily: 'Sans',
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        Text(
          value,
          style: TextStyle(
              fontFamily: 'Sans',
              color: Colors.black38,
              height: 1.5,
              fontSize: 16.0),
        )
      ],
    );
  }
}

