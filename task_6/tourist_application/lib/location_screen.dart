import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  LocationData? _currentLocation;
  MapController _mapController = MapController();
  late Stream<LocationData> _locationStream;
  bool _disposed = false;

  List<PlaceToVisit> placesToVisit = [
    PlaceToVisit(
      name: 'Wroclaw Zoo',
      location: LatLng(51.1042, 17.0741),
      imagePath: 'assets/places3.jpg',
    ),
    PlaceToVisit(
      name: 'Wroclaw National Museum',
      location: LatLng(51.1078, 17.0385),
      imagePath: 'assets/places0.jpg',
    ),
    PlaceToVisit(
      name: 'Town Hall Wroclaw',
      location: LatLng(51.1109, 17.0306),
      imagePath: 'assets/places4.jpg',
    ),
    PlaceToVisit(
        name: 'Centenial Hall Wroclaw',
        location: LatLng(51.1075, 17.0765),
        imagePath: 'assets/places1.jpg'),
    PlaceToVisit(
        name: 'Aqua park Wroclaw',
        location: LatLng(51.0909, 17.0297),
        imagePath: 'assets/places11.jpg')
  ];

  @override
  void initState() {
    super.initState();
    _locationStream = Location().onLocationChanged;
    _locationStream.listen((locationData) {
      if (!_disposed) {
        setState(() {
          _currentLocation = locationData;
        });
      }
    });
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionStatus;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus != PermissionStatus.granted) {
        return;
      }
    }

    LocationData locationData = await location.getLocation();
    setState(() {
      _currentLocation = locationData;
    });
  }

  void _setMapViewToCurrentLocation() {
    if (_currentLocation != null) {
      _mapController.move(
        LatLng(
          _currentLocation!.latitude!,
          _currentLocation!.longitude!,
        ),
        13.0,
      );
    }
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map Screen'),
      ),
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          center: LatLng(51.1079, 17.0385),
          zoom: 13.0,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayerOptions(
            markers: [
              if (_currentLocation != null)
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: LatLng(
                    _currentLocation!.latitude!,
                    _currentLocation!.longitude!,
                  ),
                  builder: (ctx) => Container(
                    child: Icon(
                      Icons.location_on,
                      color: Colors.blue,
                      size: 40.0,
                    ),
                  ),
                ),
              ...placesToVisit.map(
                (place) => Marker(
                  width: 40.0,
                  height: 40.0,
                  point: place.location,
                  builder: (ctx) => Container(
                    child: Image.asset(
                      place.imagePath,
                      width: 20.0,
                      height: 20.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _setMapViewToCurrentLocation,
        child: Icon(Icons.my_location),
      ),
    );
  }
}

class PlaceToVisit {
  final String name;
  final LatLng location;
  final String imagePath;

  PlaceToVisit({
    required this.name,
    required this.location,
    required this.imagePath,
  });
}
