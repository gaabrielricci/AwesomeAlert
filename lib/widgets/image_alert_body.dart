import 'package:flutter/material.dart';

class BodyAlertImage extends StatelessWidget {
  const BodyAlertImage({
    super.key,
    required this.onClose,
    this.width,
    required this.borderRadius,
    required this.imageUrl,
    required this.isLocal,
    required this.closeIconSize,
    required this.fit,
    this.loadingColor,
  });

  final Function onClose;
  final double? width;
  final double borderRadius;
  final double closeIconSize;
  final String imageUrl;
  final bool isLocal;
  final BoxFit? fit;
  final Color? loadingColor;

  @override
  Widget build(BuildContext context) {

    //this is the body of alertImage. here receive an url to download image and display it in an alert.
    return Stack(
      alignment: Alignment.topRight,
      children: [
        SizedBox(
          width: width ?? double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: !isLocal
                ? Image.network(imageUrl, fit: fit,
                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        color: loadingColor ?? Colors.blue,
                        backgroundColor: Colors.white,
                      ),
                    );
                  })
                : Image.asset(imageUrl, fit: fit),
          ),
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
