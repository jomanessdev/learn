import 'dart:io';
import 'package:flutter/material.dart';

class ImageInput extends StatefulWidget {
  final File selectedImage;

  ImageInput(this.selectedImage);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          //TODO Ask if they would like to retake picture.
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: widget.selectedImage != null
              ? Image.file(
                  widget.selectedImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text(
                  'No Image Taken',
                  textAlign: TextAlign.center,
                ),
          alignment: Alignment.center,
        ));
  }
}
