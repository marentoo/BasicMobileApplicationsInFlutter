import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'location_screen.dart';

class PlacesToVisitScreen extends StatefulWidget {
  const PlacesToVisitScreen({Key? key}) : super(key: key);

  @override
  _PlacesToVisitScreenState createState() => _PlacesToVisitScreenState();
}

class _PlacesToVisitScreenState extends State<PlacesToVisitScreen> {
  List<String> selectedTags = [];

  final List<String> availableTags = [
    'Center',
    'Active',
    'Museums',
    'Family',
    'Food',
    'Party',
    'Cultural'
  ];

  final List<String> attractionImages = [
    'assets/places0.jpg',
    'assets/places1.jpg',
    'assets/places2.jpg',
    'assets/places3.jpg',
    'assets/places4.jpg',
    'assets/places5.jpg',
    'assets/places6.jpg',
    'assets/places7.jpg',
    'assets/places8.jpg',
    'assets/places9.jpg',
    'assets/places10.jpg',
    'assets/places11.jpg',
    'assets/places12.jpg',
    'assets/places13.jpg',
    'assets/places14.jpg',
    'assets/places15.jpg',
  ];

  final List<String> attractionNames = [
    'National Museum',
    'Centenial Hall',
    'Cathedral Island',
    'Zoo',
    'Town hall',
    'Shambles',
    'Japanese Garden',
    'Polinka Cable Car',
    'Neon Side Gallery',
    'The Royal Palace',
    'Wroclaws Spa Center',
    'AquaPark',
    'Stadium',
    'Opera',
    'The National Forum of Music ',
    'Panorama of the Battle of Racławice'
  ];

  final Map<String, List<String>> attractionTags = {
    'Center': [
      'assets/places2.jpg',
      'assets/places4.jpg',
      'assets/places5.jpg'
    ],
    'Active': [
      'assets/places10.jpg',
      'assets/places11.jpg',
      'assets/places12.jpg',
      'assets/places3.jpg',
      'assets/places6.jpg'
    ],
    'Museums': ['assets/places0.jpg', 'assets/places9.jpg'],
    'Family': [
      'assets/places3.jpg',
      'assets/places7.jpg',
      'assets/places1.jpg'
    ],
    'Party': ['assets/places8.jpg'],
    'Cultural': [
      'assets/places1.jpg',
      'assets/places6.jpg',
      'assets/places9.jpg',
      'assets/places13.jpg',
      'assets/places14.jpg',
      'assets/places15.jpg'
    ],
    'Food': ['assets/places3.jpg']
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Places to Visit'),
      ),
      body: Column(
        children: <Widget>[
          _buildTagsRow(),
          Expanded(
            child: _buildPlacesCarousel(),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LocationScreen()),
              );
            },
            child: const Text('Go to Map Screen'),
          ),
        ],
      ),
    );
  }

  Widget _buildTagsRow() {
    return SizedBox(
      height: 150.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: availableTags.length,
        itemBuilder: (BuildContext context, int index) {
          final String tag = availableTags[index];
          final bool isSelected = selectedTags.contains(tag);

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ActionChip(
              label: Text(tag),
              onPressed: () {
                setState(() {
                  if (isSelected) {
                    selectedTags.remove(tag);
                  } else {
                    selectedTags.add(tag);
                  }
                });
              },
              backgroundColor: isSelected ? Colors.blue : null,
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : null,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPlacesCarousel() {
    List<String> filteredAttractionImages = [];

    if (selectedTags.isEmpty) {
      filteredAttractionImages = attractionImages;
    } else {
      for (var tag in selectedTags) {
        if (attractionTags.containsKey(tag)) {
          filteredAttractionImages.addAll(attractionTags[tag]!);
        }
      }
    }

    return CarouselSlider.builder(
      itemCount: filteredAttractionImages.length,
      itemBuilder: (BuildContext context, int index, int realIndex) {
        final String imagePath = filteredAttractionImages[index];
        final String placeName =
            attractionNames[attractionImages.indexOf(imagePath)];

        return SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ClipRRect(
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Text(placeName),
            ],
          ),
        );
      },
      options: CarouselOptions(
        height: double.infinity,
        enableInfiniteScroll: false,
        viewportFraction: 0.6,
      ),
    );
  }
}
