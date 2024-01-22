abstract interface class GeolocationService {
  Future<(double, double)> getDeviceLocation();
}
