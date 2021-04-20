import 'dart:convert';

import 'package:booking_app/constants.dart';
import 'package:booking_app/widgets/back_button_widget.dart';
import 'package:booking_app/widgets/details_widget.dart';
import 'package:booking_app/widgets/image_slider_indicator.dart';
import 'package:booking_app/widgets/image_slider_widget.dart';
import 'package:booking_app/widgets/price_widget.dart';
import 'package:booking_app/widgets/row_item_widget.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage(
      {@required this.hotelImages, @required this.hotelDetails, this.jsnData});
  final hotelImages;
  final hotelDetails;
  final jsnData;

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var _pageController = PageController();
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    var data = widget.jsnData;
    _pageController.addListener(() {
      setState(() {
        _currentIndex = _pageController.page.round();
      });
    });
    dynamic tag = widget.hotelDetails['data']['body']['propertyDescription']
            ['tagline'][0]
        .replaceAll('<b>', '');
    dynamic imgCount = widget.hotelImages['hotelImages'].length;
    if (imgCount > 12) imgCount = 12;
    tag = tag.replaceAll('</b>', '');
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ImageSliderWidget(
              pageController: _pageController,
              url: widget.hotelImages['hotelImages']),
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
                              child: Text(
                                tag,
                                style: kCardTitle.copyWith(
                                  color: kGoldColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 24.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                RowItemWidget(
                                    name: 'Guest Rate',
                                    value: widget.hotelDetails['data']['body']
                                            ['guestReviews']['brands']
                                            ['formattedRating']
                                        .toString()),
                                Container(
                                  width: 1.0,
                                  height: 50,
                                  color: Colors.black26,
                                ),
                                RowItemWidget(
                                    name: 'No. of Floors', value: '12'),
                                Container(
                                  width: 1.0,
                                  height: 50,
                                  color: Colors.black26,
                                ),
                                RowItemWidget(
                                  name: 'No. of Rooms',
                                  value: '199',
                                ),
                              ],
                            ),
                          ),
                          DetailsWidget(
                              data: data['INTERNET'][0].toString() +
                                  ' & ' +
                                  data['INTERNET'][1].toString(),
                              title: 'Freebies'),
                          DetailsWidget(
                              data: data['HYGIENE'].toString(),
                              title: 'HYGIENE'),
                          DetailsWidget(
                              data: data['PETS'][0].toString() +
                                  '\n' +
                                  data['PETS'][1].toString(),
                              title: 'Pets'),
                          DetailsWidget(
                              data: data['ROOMS'][0].toString() +
                                  '\n' +
                                  data['ROOMS'][1].toString() +
                                  '\n' +
                                  data['ROOMS'][2].toString() +
                                  '\n' +
                                  data['ROOMS'][3].toString() +
                                  '\n' +
                                  data['ROOMS'][4].toString(),
                              title: 'Rooms'),
                          DetailsWidget(
                              data: data['CHECKIN_REQUIRED'][0].toString() +
                                  '\n' +
                                  data['CHECKIN_REQUIRED'][1].toString() +
                                  '\n' +
                                  data['CHECKIN_REQUIRED'][2].toString(),
                              title: 'Check-In Required'),
                          DetailsWidget(
                              data: data['HOTEL_FEATURE'][0].toString() +
                                  '\n' +
                                  data['HOTEL_FEATURE'][1].toString() +
                                  '\n' +
                                  data['HOTEL_FEATURE'][2].toString() +
                                  '\n' +
                                  data['HOTEL_FEATURE'][3].toString() +
                                  '\n' +
                                  data['HOTEL_FEATURE'][4].toString() +
                                  '\n' +
                                  data['HOTEL_FEATURE'][5].toString() +
                                  '\n' +
                                  data['HOTEL_FEATURE'][6].toString(),
                              title: 'Hotel Features'),
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
