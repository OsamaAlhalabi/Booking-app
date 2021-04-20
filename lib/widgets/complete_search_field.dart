import 'package:booking_app/constants.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key key,
    @required this.checkInController,
    @required this.searchButtonPressed,
    this.title,
    this.hintText,
    this.width, 
    this.textInputType,
  }) : super(key: key);

  final TextEditingController checkInController;
  final bool searchButtonPressed;
  final String title;
  final String hintText;
  final width;
  final TextInputType textInputType;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            title,
            style: kFieldTitle,
            textAlign: TextAlign.start,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
          child: Container(
            width: width,
            child: Center(
              child: TextField(
                keyboardType: textInputType,
                controller: checkInController,
                style: kInputText,
                decoration: kInputField.copyWith(
                  hintText: hintText,
                  errorText:
                      checkInController.text.isEmpty && searchButtonPressed
                          ? 'Value Can\'t Be Empty'
                          : null,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
