import 'dart:io';

import 'package:awesome_alert/awesome_theme.dart';
import 'package:awesome_alert/image_type.dart';
import 'package:flutter/material.dart';

/// A widget to display an image inside an alert dialog.
class BodyAlertImage extends StatelessWidget {
  const BodyAlertImage({
    super.key,
    required this.onClose,
    this.width,
    required this.borderRadius,
    required this.path,
    required this.type,
    required this.closeIconSize,
    required this.fit,
    this.loadingColor,
  });

  final VoidCallback onClose;
  final double? width;
  final double borderRadius;
  final double closeIconSize;
  final String path;
  final int type;
  final BoxFit? fit;
  final Color? loadingColor;

  @override
  Widget build(BuildContext context) {
    /// Method to load and display the image based on the specified type.
    Widget loadImage() {
      switch (type) {
        case ImageType.imageFromWeb:
          return Image.network(
            path,
            fit: fit,
            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(40),
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 5,
                        color: loadingColor ?? AwesomeAlertTheme().progressColor ?? Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) => const Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Icon(Icons.error_outline, color: Colors.red, size: 40),
              ),
            ),
          );

        case ImageType.assetImage:
          return Image.asset(path, fit: fit);

        case ImageType.localFileImage:
          return Image.file(File(path), fit: fit);

        default:
          return const Center(child: Text("Select a valid type"));
      }
    }

    return Stack(
      alignment: Alignment.topRight,
      children: [
        SizedBox(
          width: width ?? double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: loadImage(),
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: Material(
            color: Colors.white,
            shape: const CircleBorder(),
            elevation: 2,
            child: IconButton(
              onPressed: onClose,
              icon: Icon(
                Icons.close,
                color: Colors.red,
                size: closeIconSize,
              ),
              constraints: const BoxConstraints(),
              padding: const EdgeInsets.all(8),
            ),
          ),
        ),
      ],
    );
  }
}

