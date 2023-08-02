<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

<div style="display: flex;">
<img src="https://riccimobile.com.br/github/flutter/awsomealert/simple.png" alt="Simple example" width="324" height="720">
<img src="https://riccimobile.com.br/github/flutter/awsomealert/custom.png" alt="Custom example" width="324" height="720">
</div>
## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.

```dart

import 'package:flutter/material.dart';
import 'package:awesome_alert/awesome_alert.dart';

class AwesomeAlertExample extends StatelessWidget {
  const AwesomeAlertExample({super.key});

  @override
  Widget build(BuildContext context) {
    _simpleAlert() {
      AwesomeAlert awesomeAlert = AwesomeAlert(context: context);
      awesomeAlert.showAlert(
        title: "Example",
        description: "A simple description that will be showed on alert",
        confirmText: "OK",
        confirmAction: () {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Pressed")));
          awesomeAlert.hideAlert();
        },
        cancelText: "Voltar",
        cancelAction: () {
          awesomeAlert.hideAlert();
        },
        buttonTextStyle: TextStyle(
          fontSize: 14,
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
      );
    }

    _customAlert() {
      AwesomeAlert awesomeAlert = AwesomeAlert(context: context);
      awesomeAlert.showCustomAleert(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Custom Example",
                style: TextStyle(
                  color: Colors.red[600],
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Icon(
                Icons.check_box,
                color: Colors.green[700],
                size: 60,
              ),
              SizedBox(height: 20),
              Text(
                "Custom description for a custom alert",
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 20),
              CircularProgressIndicator(color: Colors.blue),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        awesomeAlert.hideAlert();
                      },
                      child: Text("Hide alert"),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text("Awesome Alert - Ricci Mobile")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MaterialButton(
              onPressed: _simpleAlert,
              child: Text(
                "Show simple Alert",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.blue,
              height: 40,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            MaterialButton(
              onPressed: _customAlert,
              child: Text(
                "Show custom Alert",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.blue,
              height: 40,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            )
          ],
        ),
      ),
    );
  }
}


```

## Credits

- Created by [Ricci Mobile](https://riccimobile.com.br)

