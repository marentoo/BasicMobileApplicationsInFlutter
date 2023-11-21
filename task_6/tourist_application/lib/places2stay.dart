import 'package:flutter/material.dart';

class PlacesToStayScreen extends StatelessWidget {
  final List<Accommodation> accommodations = [
    Accommodation(
      name: 'Place 1',
      location: 'Location 1',
      pricePerNight: 100,
    ),
    Accommodation(
      name: 'Place 2',
      location: 'Location 2',
      pricePerNight: 130,
    ),
    Accommodation(
      name: 'Place 3',
      location: 'Location 3',
      pricePerNight: 150,
    ),
    Accommodation(
      name: 'Place 4',
      location: 'Location 4',
      pricePerNight: 150,
    ),
    Accommodation(
      name: 'Place 5',
      location: 'Location 5',
      pricePerNight: 120,
    ),
    Accommodation(
      name: 'Place 6',
      location: 'Location 6',
      pricePerNight: 200,
    ),
    Accommodation(
      name: 'Place 7',
      location: 'Location 7',
      pricePerNight: 1000,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Places to Stay'),
      ),
      body: ListView.builder(
        itemCount: accommodations.length,
        itemBuilder: (context, index) {
          final accommodation = accommodations[index];
          return ListTile(
            leading: Icon(Icons.hotel),
            title: Text(accommodation.name),
            subtitle: Row(
              children: [
                Icon(Icons.location_on),
                SizedBox(width: 4),
                Text(accommodation.location),
              ],
            ),
            trailing: Text(
                'hotel day: PLN ${accommodation.pricePerNight.toStringAsFixed(2)}'),
          );
        },
      ),
    );
  }
}

class Accommodation {
  final String name;
  final String location;
  final double pricePerNight;

  Accommodation({
    required this.name,
    required this.location,
    required this.pricePerNight,
  });
}
