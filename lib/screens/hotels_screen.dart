import 'package:booking_app/screens/details_screen.dart';
import 'package:booking_app/screens/search_screen.dart';
import 'package:booking_app/services/networking.dart';
import 'package:booking_app/widgets/hotel_card.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({@required this.locationPlaces});
  final locationPlaces;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    dynamic ress =
        widget.locationPlaces['data']['body']['searchResults']['results'];
    print(ress.toString());
    int l = ress.length;
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Hotels'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.home_outlined),
            onPressed: () async {
                    Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return WelcomScreen(
                      
                    );
                  },
                ),
              );
                  },
          ),
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: Container(
          color: Colors.white,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: l,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () async {
                    NetworkHelper nh = NetworkHelper(
                        );
                    var imgs = await nh.getImages(widget.locationPlaces['data']['body']
                        ['searchResults']['results'][index]['id'].toString());
                    var details = await nh.getDetails(widget.locationPlaces['data']['body']
                        ['searchResults']['results'][index]['id'].toString());
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CityScreen(
                        hotelImages: imgs,
                        hotelDetails: details,
                      );
                    }));
                  },
                  child: HotelCard(
                    imgUrl: widget.locationPlaces['data']['body']
                            ['searchResults']['results'][index]
                        ['optimizedThumbUrls']['srpDesktop'],
                    rate: widget.locationPlaces['data']['body']['searchResults']
                        ['results'][index]['starRating'],
                    placeName: widget.locationPlaces['data']['body']
                        ['searchResults']['results'][index]['name'],
                    price: widget.locationPlaces['data']['body']
                            ['searchResults']['results'][index]['ratePlan']
                        ['price']['current'],
                  ),
                );
              })),
    );
  }
}
