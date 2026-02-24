import 'package:awesome_alert/image_type.dart';
import 'package:flutter/material.dart';
import 'package:awesome_alert/awesome_alert.dart';

class AwesomeAlertExample extends StatelessWidget {
  const AwesomeAlertExample({super.key});

  @override
  Widget build(BuildContext context) {
    // --- NEW STATIC API EXAMPLES ---

    void _simpleAlert() {
      AwesomeAlert.show(
        context,
        title: "Modern Alert",
        description: "This is using the new static API with standardized parameters!",
        confirmText: "Cool!",
        showCloseButton: true, // New parameter name
        insetPadding: 20, // New parameter name
        confirmAction: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Action Triggered!")),
          );
          Navigator.of(context).pop();
        },
        cancelText: "Back",
        cancelAction: () => Navigator.of(context).pop(),
      );
    }

    void _alertLoading() {
      AwesomeAlert.showLoading(
        context,
        onDismiss: () { // New parameter name
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Loading Dismissed")),
          );
        },
      );
      
      // Auto-hide after 2 seconds for demo
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(context).pop();
      });
    }

    void _alertImage() {
      AwesomeAlert.showImage(
        context,
        type: ImageType.imageFromWeb,
        path: "https://riccimobile.com.br/github/flutter/awsomealert/cat.jpeg",
        borderRadius: 15,
        fit: BoxFit.cover,
        onDismiss: () => debugPrint("Image closed"), // New parameter name
      );
    }

    void _alertList() {
      AwesomeAlert.showList(
        context,
        title: "Feature List",
        items: [
            "Static API Methods",
            "Standardized Parameters",
            "Custom Background Colors",
            "Detailed Documentation",
            "Improved Structure"
        ],
        msg: "Current improvements in v1.2.0:",
      );
    }

    void _customAlert() {
      AwesomeAlert.showCustom(
        context,
        backgroundColor: Colors.blueGrey[900], // New feature
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Modern Custom Alert",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 15),
              const Icon(Icons.palette, size: 50, color: Colors.cyanAccent),
              const SizedBox(height: 15),
              const Text(
                "Now with custom backgroundColor!",
                style: TextStyle(color: Colors.white70),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("Close"),
              ),
            ],
          ),
        ),
      );
    }

    // --- LEGACY API EXAMPLE (Backward Compatibility) ---
    // ignore: deprecated_member_use_from_same_package
    void _legacyAlert() {
      AwesomeAlert alert = AwesomeAlert(context: context);
      alert.showAlert(
        title: "Legacy Alert",
        description: "This still works for current users, but shows a warning.",
        confirmText: "Got it",
        confirmAction: () => alert.hideAlert(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Awesome Alert - Ricci Mobile"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "New Static API",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildButton("Standard Alert", Colors.blue, _simpleAlert),
              _buildButton("Loading Alert (2s)", Colors.red, _alertLoading),
              _buildButton("Image Alert", Colors.pink, _alertImage),
              _buildButton("List Alert", Colors.orange, _alertList),
              _buildButton("Custom Alert (styled)", Colors.green, _customAlert),
              const Divider(height: 40),
              const Text(
                "Legacy API",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              const SizedBox(height: 10),
              _buildButton("Legacy Alert call", Colors.grey, _legacyAlert),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildButton(String text, Color color, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: SizedBox(
        width: 250,
        child: MaterialButton(
          onPressed: onPressed,
          color: color,
          textColor: Colors.white,
          height: 45,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Text(text),
        ),
      ),
    );
  }
}

