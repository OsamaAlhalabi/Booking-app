import 'dart:convert';
import 'package:http/http.dart' as http;


class NetworkHelper {
  final String apiKey =
      "5ae2e3f221c38a28845f05b6862cadcee936a16d50308813cb45978b";
  final headers = {
    'x-rapidapi-key': "bc4ee83b66msh64496286c1e7ed7p155ac0jsn0fc9bf530755",
    'x-rapidapi-host': "hotels4.p.rapidapi.com"
  };
  Future getData() async {
    http.Response response = await http.get(
        "https://api.opentripmap.com/0.1/en/places/xid/R4682064?apikey=5ae2e3f221c38a28845f05b6862cadcee936a16d50308813cb45978b");
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print('404 error');
    }
  }

  Future getHotel(String hotelID) async {
    var endpointUrl = "https://hotels4.p.rapidapi.com/properties/list";
    String queryString = Uri(queryParameters: {
      "destinationId": hotelID,
      "pageNumber": "1",
      "checkIn": "2021-03-30",
      "checkOut": "2021-04-15",
      "pageSize": "25",
      "adults1": "1",
      "currency": "USD",
      "locale": "en_US",
      "sortOrder": "PRICE"
    }).query;

    var requestUrl = endpointUrl + '?' + queryString;

    http.Response response = await http.get(
      requestUrl,
      headers: headers,
    );
    return jsonDecode(response.body);
  }

  Future getDetails(String hotelID) async {
    var endpointUrl = "https://hotels4.p.rapidapi.com/properties/get-details";
    String queryString = Uri(queryParameters: {
      "id": hotelID,
      "locale": "en_US",
      "currency": "USD",
      "checkOut": "2020-01-15",
      "adults1": "1",
      "checkIn": "2020-01-08"
    }).query;

    var requestUrl = endpointUrl + '?' + queryString;

    http.Response response = await http.get(
      requestUrl,
      headers: headers,
    );
    return jsonDecode(response.body);
  }

  Future getImages(String hotelID) async {
    var endpointUrl =
        "https://hotels4.p.rapidapi.com/properties/get-hotel-photos";
    String queryString = Uri(queryParameters: {"id": hotelID}).query;
    print(queryString);
    var requestUrl = endpointUrl + '?' + queryString;

    http.Response response = await http.get(
      requestUrl,
      headers: headers,
    );
    return jsonDecode(response.body);
  }

  Future getLocation(String str) async {
    var endpointUrl = "https://hotels4.p.rapidapi.com/locations/search";
    String queryString =
        Uri(queryParameters: {"query": str, "locale": "en_US"}).query;

    var requestUrl = endpointUrl + '?' + queryString;

    http.Response response = await http.get(
      requestUrl,
      headers: headers,
    );
    return jsonDecode(response.body);
  }
}
