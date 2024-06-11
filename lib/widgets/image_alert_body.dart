import 'dart:io';

import 'package:awesome_alert/awesome_theme.dart';
import 'package:awesome_alert/image_type.dart';
import 'package:flutter/material.dart';

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

  final Function onClose;
  final double? width;
  final double borderRadius;
  final double closeIconSize;
  final String path;
  final int type;
  final BoxFit? fit;
  final Color? loadingColor;

  @override
  Widget build(BuildContext context) {
    Widget loadImage() {
      switch (type) {
        case ImageType.imageFromWeb:
          return Image.network(path, fit: fit, loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) {
              return child;
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
          });

        case ImageType.assetImage:
          return Image.asset(path, fit: fit);
        case ImageType.localFileImage:
          return Image.file(File(path), fit: fit);

        default:
          return Text("Selecione um tipo válido");
      }
    }

    //this is the body of alertImage. here receive an url to download image and display it in an alert.
    return Stack(
      alignment: Alignment.topRight,
      children: [
        SizedBox(
          width: width ?? double.infinity,
          child: ClipRRect(borderRadius: BorderRadius.circular(borderRadius), child: loadImage()),
        ),
        InkWell(
          onTap: () {
            onClose();
          },
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  100,
                ),
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
