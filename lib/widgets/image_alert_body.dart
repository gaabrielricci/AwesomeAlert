import 'dart:io';

import 'package:awesome_alert/awesome_theme.dart';
import 'package:awesome_alert/image_type.dart';
import 'package:flutter/material.dart';

/// A widget to display an image inside an alert dialog.
class BodyAlertImage extends StatelessWidget {
  const BodyAlertImage({
    super.key,
    required this.onClose, // Function to call when the close icon is pressed.
    this.width, // Optional width for the image.
    required this.borderRadius, // Radius for rounding the corners of the image.
    required this.path, // Path or URL of the image.
    required this.type, // Type of the image source (web, asset, or local file).
    required this.closeIconSize, // Size of the close icon.
    required this.fit, // BoxFit for the image.
    this.loadingColor, // Optional color for the loading indicator.
  });

  final Function onClose; // Callback function to be invoked when the close button is pressed.
  final double? width; // Width of the image.
  final double borderRadius; // Radius for rounding the corners of the image.
  final double closeIconSize; // Size of the close icon.
  final String path; // Path or URL of the image.
  final int type; // Type of image source.
  final BoxFit? fit; // BoxFit to specify how the image should fit within its box.
  final Color? loadingColor; // Optional color for the loading indicator.

  @override
  Widget build(BuildContext context) {
    /// Method to load and display the image based on the specified type.
    Widget loadImage() {
      switch (type) {
        case ImageType.imageFromWeb:
        // Load image from the web and show a loading indicator while loading.
          return Image.network(
            path,
            fit: fit,
            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child; // Return the image when loading is complete.
              }
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(40),
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 5,
                              color: loadingColor ?? AwesomeAlertTheme().progressColor ?? Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );

        case ImageType.assetImage:
        // Load image from assets.
          return Image.asset(path, fit: fit);

        case ImageType.localFileImage:
        // Load image from a local file.
          return Image.file(File(path), fit: fit);

        default:
        // Return an error message if an invalid type is specified.
          return Text("Select a valid type");
      }
    }

    // Build the widget to display the image with a close icon overlay.
    return Stack(
      alignment: Alignment.topRight,
      children: [
        SizedBox(
          width: width ?? double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: loadImage(), // Load and display the image based on the specified type.
          ),
        ),
        InkWell(
          onTap: () {
            onClose(); // Call the onClose function when the close icon is pressed.
          },
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100), // Make the close button round.
              ),
              child: Icon(
                Icons.close,
                color: Colors.red,
                size: closeIconSize,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
