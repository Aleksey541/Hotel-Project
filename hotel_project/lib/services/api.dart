import 'package:hotel_project/models/hotel_model.dart';
import 'package:http/http.dart' as http;

class Api{
  Future<HotelModel> getData() async {
    var response = await http.get(
      Uri.parse("https://run.mocky.io/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3")
    );
    HotelModel data = hotelModelFromJson(response.body);
    return data;
  }
}


