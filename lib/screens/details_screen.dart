import 'package:booking_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_indicator/flutter_slider_indicator.dart';

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
                              child: Text(
                                tag,
                                style: kCardTitle.copyWith(
                                  color: kBlueColor,
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
                                DetailsWidget(
                                    name: 'Guest Rate',
                                    value: widget.hotelDetails['data']['body']
                                            ['guestReviews']['brands']
                                        ['formattedRating'].toString()),
                                Container(
                                  width: 1.0,
                                  height: 50,
                                  color: Colors.black26,
                                ),
                                DetailsWidget(
                                    name: 'No. of Floors', value: '12'),
                                Container(
                                  width: 1.0,
                                  height: 50,
                                  color: Colors.black26,
                                ),
                                DetailsWidget(
                                  name: 'No. of Rooms',
                                  value: '199',
                                ),
                              ],
                            ),
                          ),
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

class DetailsWidget extends StatelessWidget {
  final String name;
  final String value;

  const DetailsWidget({Key key, this.name, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          name,
          style: TextStyle(
            fontFamily: 'Sans',
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        Text(
          value,
          style: TextStyle(
              fontFamily: 'Sans',
              color: Colors.black38,
              height: 1.5,
              fontSize: 16.0),
        )
      ],
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
    Key key,
    this.price,
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
                color: Colors.black,
              ),
            ),
          ],
        ));
  }
}
