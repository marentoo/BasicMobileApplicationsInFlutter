import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tourist_application/dwarfes_screen.dart';
import 'package:provider/provider.dart';
import 'package:tourist_application/location_screen.dart';
import 'package:tourist_application/places2stay.dart';
import 'package:tourist_application/places2visit.dart';
import 'package:tourist_application/tour_proposal.dart';

import 'emergency.dart';
import 'event_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ImageList(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tourist guide - Wroclaw',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: const MyHomePage(title: 'TOURIST APPLICATION'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  void emergency(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => EmergencyContactsScreen()));
  }

  void location(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LocationScreen()));
  }

  void openEvents(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => EventScreen()));
  }

  void openPlaces2Stay(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => PlacesToStayScreen()));
  }

  void openTour(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => TourProposalScreen()));
  }

  void openPlaces(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => PlacesToVisitScreen()));
  }

  void captureDwarfes(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Consumer<ImageList>(
          builder: (context, imageList, _) =>
              DwarfesScreen(imageList: imageList),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            IconButton(
              icon: Icon(Icons.local_hospital),
              color: Color.fromARGB(255, 141, 0, 0),
              onPressed: () => emergency(context),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/im4.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 128.0,
                    height: 100.0,
                    child: Opacity(
                      opacity: 0.8,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          location(context);
                        },
                        icon: Icon(Icons.location_on),
                        label: Text('Current Location'),
                      ),
                    ),
                  ),
                  Container(
                    width: 128.0,
                    height: 100.0,
                    child: Opacity(
                      opacity: 0.8,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          openPlaces2Stay(context);
                        },
                        icon: Icon(Icons.hotel),
                        label: Text('Place to stay'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 128.0,
                    height: 100.0,
                    child: Opacity(
                      opacity: 0.8,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          openEvents(context);
                        },
                        icon: Icon(Icons.event),
                        label: Text('Events'),
                      ),
                    ),
                  ),
                  Container(
                    width: 128.0,
                    height: 100.0,
                    child: Opacity(
                      opacity: 0.8,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          openTour(context);
                        },
                        icon: Icon(Icons.directions),
                        label: Text('Tour proposals'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 128.0,
                    height: 100.0,
                    child: Opacity(
                      opacity: 0.8,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          openPlaces(context);
                        },
                        icon: Icon(Icons.visibility),
                        label: Text('Places to visit'),
                      ),
                    ),
                  ),
                  Container(
                    width: 128.0,
                    height: 100.0,
                    child: Opacity(
                      opacity: 0.8,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          captureDwarfes(context);
                        },
                        icon: SvgPicture.asset(
                          'assets/dwarf.svg',
                          width: 24.0,
                          height: 24.0,
                          color: Colors.black,
                        ),
                        label: Text('Dwarfes'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
