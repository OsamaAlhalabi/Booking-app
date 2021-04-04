import 'package:booking_app/constants.dart';
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
      appBar: PreferredSize(
  preferredSize: Size(double.infinity, 100),
  child: Container(
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(color: Color(0xFFF9F9F9), spreadRadius: 5, blurRadius: 2)
    ]),
    height: 84,
    child: Container(
      decoration: BoxDecoration(
          color:  kBlueColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WelcomScreen();
    }));
              },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 10, 0, 0),
                  child: Icon(
                  Icons.navigate_before,
                  size: 25,
                  color: Color(0xFFF9F9F9),
              ),
                ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 12, 0),
              child: Text(
                "Available Hotels",
                style: TextStyle(
                  fontSize: 30,
                  color: Color(0xFFF9F9F9),
                  fontFamily: 'Sans',
                ),
              ),
            ),
            Icon(
              Icons.navigate_before,
              color: Colors.transparent,
            ),
          ],
        ),
      ),
    ),
  ),
),
      body: Container(
          color: Color(0xFFF9F9F9),
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
                      return DetailsPage(
                        hotelImages: imgs,
                        hotelDetails: details,
                      );
                    }));
                  },
                  child: HotelCard2(
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
