import 'package:booking_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_indicator/flutter_slider_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CityScreen extends StatefulWidget {
  CityScreen({@required this.hotelImages, @required this.hotelDetails});
  final hotelImages;
  final hotelDetails;

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  @override
  Widget build(BuildContext context) {
    dynamic img = widget.hotelImages['hotelImages'][1]['baseUrl']
        .replaceAll('_{size}', '');
    dynamic tag = widget.hotelDetails['data']['body']['propertyDescription']
            ['tagline'][0]
        .replaceAll('<b>', '');
    tag = tag.replaceAll('</b>', '');

    return Scaffold(
        body: Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0,
                    ),
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image(
                  width: MediaQuery.of(context).size.width,
                  image: AssetImage('assets/hotel.jpg'
                      // img
                      ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    iconSize: 30.0,
                    color: Colors.black,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.search),
                        iconSize: 30.0,
                        color: Colors.black,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      IconButton(
                        icon: Icon(FontAwesomeIcons.sortAmountDown),
                        iconSize: 25.0,
                        color: Colors.black,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              left: 20.0,
              bottom: 20.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    // widget.hotelDetails['data']['body']['propertyDescription']
                    //     ['name'],
                    'NY Moore Hostel',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.locationArrow,
                        size: 20.0,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        // widget.hotelDetails['data']['body']
                        //     ['propertyDescription']['address']['countryName'],
                        'New York',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              right: 20.0,
              bottom: 20.0,
              child: Icon(
                Icons.location_on,
                color: Colors.white70,
                size: 25.0,
              ),
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return SingleChildScrollView(
                  child: Column(
                children: <Widget>[
                  HotelFeatureCard(
                    title: 'TAG LINE',
                    text: 'Well, Hello There!',
                  ),
                  HotelFeatureCard(
                    title: 'FREEBIES',
                    text: 'Free WiFi and free parking',
                  ),
                  HotelFeatureCard(
                    title: 'AROUND THE HOTEL',
                    text:
                        "Brooklyn Bridge Park - 3.2 mi / 5.1 km,Prospect Park - 3.6 mi / 5.7 km,Barclays Center Brooklyn - 3.9 mi / 6.3 km",
                  ),
                  HotelFeatureCard(
                    title: 'AMENITIES',
                    text:
                        "Garden','Computer station','Meeting room','Multilingual staff",
                  ),
                ],
              ));
            },
          ),
        ),
      ],
    ));
  }
}

class HotelFeatureCard extends StatelessWidget {
  HotelFeatureCard({
    this.text,
    this.title,
  });
  final String title;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 24.0,
              fontFamily: 'Sans',
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            text,
            style: kHotelCard,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class DetailsPage extends StatefulWidget {
  DetailsPage({@required this.hotelImages, @required this.hotelDetails});
  final hotelImages;
  final hotelDetails;

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var _pageController = PageController();
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    _pageController.addListener(() {
      setState(() {
        _currentIndex = _pageController.page.round();
      });
    });
    dynamic img = widget.hotelImages['hotelImages'][1]['baseUrl']
        .replaceAll('_{size}', '');
    dynamic tag = widget.hotelDetails['data']['body']['propertyDescription']
            ['tagline'][0]
        .replaceAll('<b>', '');
    dynamic imgCount = widget.hotelImages['hotelImages'].length;
    if (imgCount > 12) imgCount = 12;
    tag = tag.replaceAll('</b>', '');
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ImageSliderWidget(pageController: _pageController, widget: widget),
          ImageSliderIndicator(imgCount: imgCount, currentIndex: _currentIndex),
          BackButtonWidget(),
          PriceWidget(
            price: widget.hotelDetails['data']['body']['propertyDescription']
            ['featuredPrice']['currentPrice']['formatted'],
          ),
          DraggableScrollableSheet(
            initialChildSize: .5,
            maxChildSize: .8,
            minChildSize: .5,
            builder: (context, controller) {
              return SingleChildScrollView(
                controller: controller,
                child: Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 25),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25)),
                      ),
                      child: Column(
                        children: <Widget>[
                          Center(
                            child:
                                Icon(Icons.drag_handle, color: Colors.black38),
                          ),
                          Padding(
                            padding: EdgeInsets.all(24.0),
                            child: Text(
                                widget.hotelDetails['data']['body']
                                    ['propertyDescription']['name'],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Sans',
                                    fontSize: 30.0)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Expanded(
                              child: Text(tag,
                                  style: kCardTitle.copyWith(
                                    color: kBlueColor,
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class ImageSliderWidget extends StatelessWidget {
  const ImageSliderWidget({
    Key key,
    @required PageController pageController,
    @required this.widget,
  })  : _pageController = pageController,
        super(key: key);

  final PageController _pageController;
  final DetailsPage widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .6,
      child: PageView.builder(
          controller: _pageController,
          itemBuilder: (context, index) {
            return Image.network(
              widget.hotelImages['hotelImages'][index]['baseUrl']
                  .replaceAll('_{size}', ''),
              fit: BoxFit.cover,
            );
          }),
    );
  }
}

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

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        margin: EdgeInsets.only(right: 24, top: 45),
        child: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class PriceWidget extends StatelessWidget {
  final price;
  const PriceWidget({
    Key key, this.price,
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
                color : Colors.black,

              ),
            ),
          ],
        ));
  }
}
