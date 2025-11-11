import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Layanan lokasi tidak ada');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('layanan tidak disetujui');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Izin lokasi diblokir secara permanen.');
    }
    return await Geolocator.getCurrentPosition();
  }

  // Koordinat Vokasi Panggung (sesuaikan dengan koordinat sebenarnya)
  static const double vokasiLatitude = -7.767000; // Ganti dengan latitude sebenarnya
  static const double vokasiLongitude = 110.377000; // Ganti dengan longitude sebenarnya

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder<Position>(
          future: _determinePosition(),
          builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
            if (snapshot.hasData) {
              final Position currentLocation = snapshot.data!;
              return SfMaps(
                layers: [
                  MapTileLayer(
                    initialFocalLatLng: MapLatLng(
                      currentLocation.latitude,
                      currentLocation.longitude,
                    ),
                    initialZoomLevel: 15,
                    initialMarkersCount: 2, // Diubah menjadi 2 untuk 2 marker
                    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    markerBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        // Marker lokasi pengguna saat ini
                        return MapMarker(
                          latitude: currentLocation.latitude,
                          longitude: currentLocation.longitude,
                          child: const Icon(
                            Icons.location_on,
                            color: Colors.green,
                          ),
                        );
                      } else {
                        // Marker Vokasi Panggung (tambahan sesuai latihan)
                        return MapMarker(
                          latitude: vokasiLatitude,
                          longitude: vokasiLongitude,
                          child: const Icon(
                            Icons.location_pin,
                            color: Colors.red,
                          ),
                        );
                      }
                    },
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}