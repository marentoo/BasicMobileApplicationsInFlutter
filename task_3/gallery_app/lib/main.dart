import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gallery_app/select_photo.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gallery Application',
      theme: ThemeData(
        primaryColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(
              fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      home: const MyHomePage(title: 'Gallery App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<File> _images = [];

  Future<void> _takePhoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _images.add(File(pickedFile.path));
      });
      await ImageGallerySaver.saveFile(pickedFile.path);
    }
  }

  Future<void> _uploadPhoto() async {
    final picker = ImagePicker();
    final pickedFiles = await picker.pickMultiImage();
    for (var pickedFile in pickedFiles) {
      final file = File(pickedFile.path);
      setState(() {
        _images.add(file);
      });
    }
  }

  void _deletePhoto(BuildContext context, int index) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Delete Photo'),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              TextButton(
                child: const Text('Delete'),
                onPressed: () {
                  setState(() {
                    _images.removeAt(index);
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(widget.title),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 100.0),
            child: Row(
              children: [
                IconButton(
                  // Take button press
                  onPressed: _takePhoto,
                  icon: const Icon(Icons.photo_camera, color: Colors.black),
                ),
                IconButton(
                  onPressed:
                      // Upload button press
                      _uploadPhoto,
                  icon: const Icon(Icons.file_upload, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: _images.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onLongPress: () => _deletePhoto(context, index),
            child: SelectPhoto(photos: _images, index: index),
          );
        },
      ),
    );
  }
}
