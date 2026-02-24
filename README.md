## Features

Modern and highly customizable alerts for Flutter.
- Standard Alerts (Success, Info, Error, etc.)
- Loading Indicators
- Image Dialogues
- List/Bulleted Alerts
- Completely Custom Body support
- Singleton Theme management

## Images

<div style="display: flex;">
<img src="https://riccimobile.com.br/github/flutter/awesomealert/simple.png" alt="Simple example" style="flex: 1; padding: 10px;" width="324" height="720">
<img src="https://riccimobile.com.br/github/flutter/awesomealert/custom.png" alt="Custom example" style="flex: 1; padding: 10px;" width="324" height="720">
<img src="https://riccimobile.com.br/github/flutter/awesomealert/loading.png" alt="Loading" style="flex: 1; padding: 10px;" width="324" height="720">
<img src="https://riccimobile.com.br/github/flutter/awesomealert/image.png" alt="Image" style="flex: 1; padding: 10px;" width="324" height="720">
</div>

## Getting started

Add the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  awesome_alert: ^1.1.6
```

Import the package:

```dart
import 'package:awesome_alert/awesome_alert.dart';
```

## Usage

### Simple Alert
The modern way to show an alert is using the static `show` method.

```dart
AwesomeAlert.show(
  context,
  title: "Modern Alert",
  description: "This is using the new static API!",
  confirmText: "Cool!",
  confirmAction: () => Navigator.of(context).pop(),
);
```

### Loading Alert
```dart
AwesomeAlert.showLoading(context);
```

### Image Alert
```dart
AwesomeAlert.showImage(
  context,
  type: ImageType.imageFromWeb,
  path: "https://example.com/image.png",
);
```

### Custom Alert
```dart
AwesomeAlert.showCustom(
  context,
  body: MyCustomWidget(),
);
```

## Examples

Check the full example in the [example/](https://github.com/gaabrielricci/AwesomeAlert/tree/main/example) folder.

## Credits

- Created by [Ricci Mobile](https://riccimobile.com.br)


