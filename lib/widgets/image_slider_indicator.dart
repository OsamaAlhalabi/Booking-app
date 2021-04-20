
import 'package:flutter/material.dart';
import 'package:flutter_slider_indicator/flutter_slider_indicator.dart';

class ImageSliderIndicator extends StatelessWidget {
  const ImageSliderIndicator({
    Key key,
    @required this.imgCount,
    @required int currentIndex,
  })  : _currentIndex = currentIndex,
        super(key: key);

  final imgCount;
  final int _currentIndex;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .45),
        child: SliderIndicator(
            length: imgCount,
            activeIndex: _currentIndex,
            indicator: Icon(
              Icons.radio_button_unchecked,
              color: Colors.white,
              size: 10.0,
            ),
            activeIndicator: Icon(
              Icons.fiber_manual_record,
              color: Colors.white,
              size: 12.0,
            )),
      ),
    );
  }
}
