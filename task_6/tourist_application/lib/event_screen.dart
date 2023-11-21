import 'package:flutter/material.dart';

class EventScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
      ),
      body: ListView(
        children: const [
          EventItem(
            icon: Icons.event,
            name: 'Event 1',
            location: 'Location 1',
            date: 'Date 1',
          ),
          EventItem(
            icon: Icons.event,
            name: 'Event 2',
            location: 'Location 2',
            date: 'Date 2',
          ),
          EventItem(
            icon: Icons.event,
            name: 'Event 3',
            location: 'Location 3',
            date: 'Date 3',
          ),
          // Add more EventItem widgets for additional events
        ],
      ),
    );
  }
}

class EventItem extends StatelessWidget {
  final IconData icon;
  final String name;
  final String location;
  final String date;

  const EventItem({
    required this.icon,
    required this.name,
    required this.location,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Location: $location'),
            Text('Date: $date'),
          ],
        ),
      ),
    );
  }
}
