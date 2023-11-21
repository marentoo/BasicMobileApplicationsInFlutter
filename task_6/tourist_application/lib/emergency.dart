import 'package:flutter/material.dart';

class EmergencyContactsScreen extends StatelessWidget {
  const EmergencyContactsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Contacts'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildContactItem(
            icon: Icons.emergency,
            title: 'Emergency Number',
            number: '112',
          ),
          _buildContactItem(
            icon: Icons.local_police,
            title: 'Police',
            number: '997',
          ),
          _buildContactItem(
            icon: Icons.medical_services,
            title: 'Ambulance',
            number: '998',
          ),
          _buildContactItem(
            icon: Icons.fire_truck,
            title: 'Fire Department',
            number: '999',
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(
      {required IconData icon, required String title, required String number}) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.black,
      ),
      title: Text(title),
      subtitle: Text(number),
      trailing: const Icon(
        Icons.call,
        color: Colors.green,
      ),
      onTap: () {
//calling fun
      },
    );
  }
}
