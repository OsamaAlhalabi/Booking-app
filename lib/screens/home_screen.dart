import 'package:flutter/cupertino.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
          // ignore: missing_return
          onWillPop: () { int count = 0;
           Navigator.of(context).popUntil((_) => count++ >= 2); },
          child: Container(
        
      ),
    );
  }
}