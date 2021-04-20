import 'dart:convert';

import 'package:booking_app/screens/details_screen.dart';
import 'package:booking_app/services/networking.dart';
import 'package:booking_app/widgets/app_bar.dart';
import 'package:booking_app/widgets/hotel_card.dart';
import 'package:booking_app/widgets/loading_spin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({@required this.locationPlaces});
  final locationPlaces;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  var data;
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/details_sample.json');
    data = await json.decode(response);
  }

  // ignore: non_constant_identifier_names
  bool hotel_pressed = false;
  @override
  Widget build(BuildContext context) {
    readJson();
    dynamic ress =
        widget.locationPlaces['data']['body']['searchResults']['results'];
    print(ress.toString());
    int l = ress.length;
    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, 100),
            child: AppBarWidget(),
          ),
          body: Stack(
            children: <Widget>[
              Container(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: l,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            setState(() {
                              hotel_pressed = true;
                            });
                            NetworkHelper nh = NetworkHelper();
                            var imgs = await nh.getImages(widget
                                .locationPlaces['data']['body']['searchResults']
                                    ['results'][index]['id']
                                .toString());
                            var details = await nh.getDetails(widget
                                .locationPlaces['data']['body']['searchResults']
                                    ['results'][index]['id']
                                .toString());
                            setState(() {
                              hotel_pressed = false;
                            });
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return DetailsPage(
                                hotelImages: imgs,
                                hotelDetails: details,
                                jsnData: data,
                              );
                            }));
                          },
                          child: HotelCard(
                            imgUrl: widget.locationPlaces['data']['body']
                                    ['searchResults']['results'][index]
                                ['optimizedThumbUrls']['srpDesktop'],
                            rate: widget.locationPlaces['data']['body']
                                    ['searchResults']['results'][index]
                                ['starRating'],
                            placeName: widget.locationPlaces['data']['body']
                                ['searchResults']['results'][index]['name'],
                            price: widget.locationPlaces['data']['body']
                                    ['searchResults']['results'][index]
                                ['ratePlan']['price']['current'],
                          ),
                        );
                      })),
            ],
          ),
        ),
        LoadingSpinWidget(searchButtonPressed: hotel_pressed),
      ],
    );
  }
}
