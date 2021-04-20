import 'package:flutter/material.dart';

class ImageSliderWidget extends StatelessWidget {


  const ImageSliderWidget({
    Key key,
    @required PageController pageController,
    @required this.url,
  })  : _pageController = pageController,
        super(key: key);

  final PageController _pageController;
  final url;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .6,
      child: PageView.builder(
          controller: _pageController,
          itemBuilder: (context, index) {
            return Image.network(
              url[index]['baseUrl'].replaceAll('_{size}', '').toString(),
              fit: BoxFit.cover,
            );
          }),
    );
  }
}
