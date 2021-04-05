import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingSpinWidget extends StatelessWidget {
  const LoadingSpinWidget({
    Key key,
    @required this.searchButtonPressed,
  }) : super(key: key);

  final bool searchButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: searchButtonPressed,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.black54,
        ),
        child: Center(
          child: Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(45),
            ),
            child: SpinKitCircle(
              color: Colors.black,
              size: 50.0,
            ),
          ),
        ),
      ),
    );
  }
}
