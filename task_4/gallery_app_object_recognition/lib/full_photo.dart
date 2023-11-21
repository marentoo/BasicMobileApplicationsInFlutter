import 'package:flutter/material.dart';
import 'dart:io';

// Purpose of this file is to display a photo in full screen with zoom in/out and swipe capabilities.

class FullPhoto extends StatefulWidget {
  final List<File> photos;
  final int index;

  const FullPhoto({
    required this.photos,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  _FullPhotoState createState() => _FullPhotoState();
}

class _FullPhotoState extends State<FullPhoto> {
  late int _currentIndex;
  double _scale = 1.0;
  double _previousScale = 1.0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.index;
  }

  void _nextPhoto() {
    setState(() {
      if (_currentIndex < widget.photos.length - 1) {
        _currentIndex++;
      }
    });
  }

  void _prevPhoto() {
    setState(() {
      if (_currentIndex > 0) {
        _currentIndex--;
      }
    });
  }

  void _zoomOut() {
    setState(() {
      _scale = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragEnd: (DragEndDetails details) {
          if (details.velocity.pixelsPerSecond.dx > 200) {
            _prevPhoto();
          } else if (details.velocity.pixelsPerSecond.dx < -200) {
            _nextPhoto();
          }
          //zoom inout
        },
        onScaleStart: (ScaleStartDetails details) {
          _previousScale = _scale;
        },
        onScaleUpdate: (ScaleUpdateDetails details) {
          setState(() {
            _scale = _previousScale * details.scale * 1.5;
          });
        },
        onDoubleTap: () {
          _zoomOut();
        },
        child: Stack(
          children: [
            Positioned.fill(
              child: Transform.scale(
                scale: _scale,
                child: Image.file(
                  widget.photos[_currentIndex],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            //helping arrow to go back -- not needed now
            Positioned(
              top: MediaQuery.of(context).padding.top + 10,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back),
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
