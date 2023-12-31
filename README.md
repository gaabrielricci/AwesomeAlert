## Features

Simply display alerts to the user, or create your own custom alerts.

## Images

<div style="display: flex;">
<img src="https://riccimobile.com.br/github/flutter/awesomealert/simple.png" alt="Simple example" style="flex: 1; padding: 10px;" width="324" height="720">
<img src="https://riccimobile.com.br/github/flutter/awesomealert/custom.png" alt="Custom example" style="flex: 1; padding: 10px;" width="324" height="720">
<img src="https://riccimobile.com.br/github/flutter/awesomealert/loading.png" alt="Loading" style="flex: 1; padding: 10px;" width="324" height="720">
<img src="https://riccimobile.com.br/github/flutter/awesomealert/image.png" alt="Image" style="flex: 1; padding: 10px;" width="324" height="720">
</div>

## Getting started

Just import the package.

```dart
import 'package:awesome_alert/awesome_alert.dart';
```

And init the class whit your valid context

```dart

AwesomeAlert awesomeAlert = AwesomeAlert(context: context);
```

Enjoy.

## Usage

This a simple stateless screen with usage example.

[example.dart](https://github.com/gaabrielricci/AwesomeAlert/blob/main/lib/example/awesome_alert_example.dart)

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
        description: "A simple description that will be showed on a alert",
        confirmText: "OK",
        confirmAction: () {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Pressed")));
          awesomeAlert.hideAlert();
        },
        cancelText: "Back",
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

    _alertLoading() {
      AwesomeAlert awesomeAlert = AwesomeAlert(context: context);
      awesomeAlert.alertLoading(
          sizeProgress: 40,
          paddingFromProgress: 15,
          onComplete: () {
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Alert hidded")));
          });
    }

    _alertImage() {
      AwesomeAlert awesomeAlert = AwesomeAlert(context: context);
      awesomeAlert.alertImage(
        cancelable: true,
        isLocal: false,
        imageUrl: "https://riccimobile.com.br/github/flutter/awsomealert/cat.jpeg",
        borderRadius: 15,
        fit: BoxFit.cover,
      );
    }

    _customAlert() {
      AwesomeAlert awesomeAlert = AwesomeAlert(context: context);
      awesomeAlert.showCustomAlert(
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
              color: Colors.green,
              height: 40,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            MaterialButton(
              onPressed: _alertLoading,
              child: Text(
                "Show Alert loading",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.red,
              height: 40,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            MaterialButton(
              onPressed: _alertImage,
              child: Text(
                "Show Alert image",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.pink,
              height: 40,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

```

## Credits

- Created by [Ricci Mobile](https://riccimobile.com.br)

