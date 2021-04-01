import 'package:flutter/material.dart';
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
    dynamic tag = widget.hotelDetails['data']['body']
                              ['propertyDescription']['tagline'][0].replaceAll('<b>','');
    tag =  tag.replaceAll('</b>', '');

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
                  image: NetworkImage(img),
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
                    widget.hotelDetails['data']['body']['propertyDescription']
                        ['name'],
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
                        widget.hotelDetails['data']['body']
                            ['propertyDescription']['address']['countryName'],
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
              return Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                    height: 100.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      
                      children: <Widget>[
                        Text(
                          'TAG LINE',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(tag,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600
                        ),
                        textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                ],
              )
              ; 
            },
          ),
        ),
      ],
    ));
  }
}
