import 'package:geolocator/geolocator.dart';
import 'package:weather_app/weather/domain/service/geolocation_service.dart';

class GeolocationServiceImpl implements GeolocationService {
  @override
  Future<(double, double)> getDeviceLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    var position = await Geolocator.getCurrentPosition();
    var latitude = position.latitude;
    var longitude = position.longitude;
    return (latitude, longitude);
  }
}
