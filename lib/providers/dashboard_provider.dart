import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:myapp/services/location_service.dart';

class DashboardProvider with ChangeNotifier {
  final LocationService _locationService = LocationService();
  String _checkInStatus = 'Check In';
  Position? _position;

  String get checkInStatus => _checkInStatus;
  Position? get position => _position;

  Future<void> toggleCheckIn() async {
    if (_checkInStatus == 'Check In') {
      _checkInStatus = 'Check Out';
      _position = await _locationService.getCurrentLocation();
    } else {
      _checkInStatus = 'Check In';
      _position = null;
    }
    notifyListeners();
  }
}
