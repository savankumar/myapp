import 'package:flutter/material.dart';
import 'package:geofence_flutter/geofence_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:myapp/providers/dashboard_provider.dart';
import 'package:myapp/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    _initGeofence();
  }

  Future<void> _initGeofence() async {
    await Geolocator.requestPermission();
    final position = await Geolocator.getCurrentPosition();

    Geofence.startGeofenceService(
      pointedLatitude: position.latitude.toString(),
      pointedLongitude: position.longitude.toString(),
      radiusMeter: "200",
      eventPeriodInSeconds: 5,
    );

    Geofence.getGeofenceStream()?.listen((GeofenceEvent event) {
      if (event == GeofenceEvent.enter) {
        context.read<DashboardProvider>().toggleCheckIn();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Center(
        child: Consumer<DashboardProvider>(
          builder: (context, dashboardProvider, child) {
            return CustomButton(
              text: dashboardProvider.checkInStatus,
              onPressed: () => dashboardProvider.toggleCheckIn(),
            );
          },
        ),
      ),
    );
  }
}
