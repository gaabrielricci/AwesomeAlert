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
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Pressed")));
          awesomeAlert.hideAlert();
        },
        cancelText: "Back",
        cancelAction: () {
          awesomeAlert.hideAlert();
        },
        buttonTextStyle: const TextStyle(
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
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Alert hidded")));
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
              const SizedBox(height: 20),
              Icon(
                Icons.check_box,
                color: Colors.green[700],
                size: 60,
              ),
              const SizedBox(height: 20),
              Text(
                "Custom description for a custom alert",
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),
              const CircularProgressIndicator(color: Colors.blue),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        awesomeAlert.hideAlert();
                      },
                      child: const Text("Hide alert"),
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
      appBar: AppBar(title: const Text("Awesome Alert - Ricci Mobile")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MaterialButton(
              onPressed: _simpleAlert,
              color: Colors.blue,
              height: 40,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Text(
                "Show simple Alert",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            MaterialButton(
              onPressed: _customAlert,
              color: Colors.green,
              height: 40,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Text(
                "Show custom Alert",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            MaterialButton(
              onPressed: _alertLoading,
              color: Colors.red,
              height: 40,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Text(
                "Show Alert loading",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            MaterialButton(
              onPressed: _alertImage,
              color: Colors.pink,
              height: 40,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Text(
                "Show Alert image",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}