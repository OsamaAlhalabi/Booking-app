import 'package:booking_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class SearchField extends StatelessWidget {
  
   var myController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
      child: Container(
        width: MediaQuery.of(context).size.width / 2.55,
        child: Center(
          child: TextFormField(
            controller: myController,
            decoration: kInputField.copyWith(
              hintText: 'fofo',
            )     ),
        ),
      ),
    );
  }
  }