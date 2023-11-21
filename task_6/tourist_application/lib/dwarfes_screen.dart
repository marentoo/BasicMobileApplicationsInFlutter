import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:provider/provider.dart';

class DwarfesScreen extends StatefulWidget {
  const DwarfesScreen({Key? key, required this.imageList}) : super(key: key);

  final ImageList imageList;

  @override
  _DwarfesScreenState createState() => _DwarfesScreenState();
}

class _DwarfesScreenState extends State<DwarfesScreen> {
  late List<File> _images;

  @override
  void initState() {
    super.initState();
    _images = widget.imageList.images;
  }

  Future<void> _takePhoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      final File imageFile = File(pickedFile.path);
      setState(() {
        _images.add(imageFile);
      });

      await ImageGallerySaver.saveFile(imageFile.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    final imageCount = _images.length;
    final noteCount = 'You found: $imageCount dwarfes. Congrats!';

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: Column(
          children: [
            const Text('My Captured Dwarfes',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
              noteCount,
              style: const TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          IconButton(
            onPressed: _takePhoto,
            icon: const Icon(Icons.camera_alt, size: 48.0),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: _images.length,
              itemBuilder: (BuildContext context, int index) {
                return Image.file(_images[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ImageList with ChangeNotifier {
  List<File> images = [];
}
