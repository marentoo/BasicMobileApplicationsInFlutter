import 'dart:io';
import 'package:flutter/material.dart';
import 'full_photo.dart';

//purpose of this file is to provide when Taping photo in gallery app a FullPhoto functionality through all images in gallery app

class SelectPhoto extends StatefulWidget {
  final List<File> photos;
  final int index;

  const SelectPhoto({
    required this.photos,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  _SelectPhotoState createState() => _SelectPhotoState();
}

class _SelectPhotoState extends State<SelectPhoto> {
  void showFullPhoto(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => FullPhoto(
                photos: widget.photos,
                index: widget.index,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showFullPhoto(context);
      },
      child: Image.file(
        widget.photos[widget.index],
        fit: BoxFit.cover,
      ),
    );
  }
}
