<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

# Flutter Toast

[![pub package](https://img.shields.io/pub/v/flutter_toast_plus.svg)](https://pub.dev/packages/flutter_toast_plus)
[![likes](https://img.shields.io/pub/likes/flutter_toast_plus)](https://pub.dev/packages/flutter_toast_plus/score)
[![popularity](https://img.shields.io/pub/popularity/flutter_toast_plus)](https://pub.dev/packages/flutter_toast_plus/score)
[![pub points](https://img.shields.io/pub/points/flutter_toast_plus)](https://pub.dev/packages/flutter_toast_plus/score)

A highly customizable Flutter toast package that provides various types of toast notifications with beautiful animations and styles.

## Features

- 🎨 Multiple toast types (normal, success, error, warning, info)
- 📍 Flexible positioning (top, bottom, center, corners)
- ⚡ Smooth animations
- 🎯 Progress indicator support
- 🎭 Fully customizable styles
- 🔄 Auto-dismiss with customizable duration
- 📱 Safe area aware
- 🔍 Maximum toast limit to prevent screen cluttering

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  flutter_toast_plus: ^1.0.0
```

## Usage

First, initialize the toast service in your app's root widget:

```dart
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) {
          ToastService.init(context);
          return MyHomePage();
        },
      ),
    );
  }
}
```

### Basic Usage

```dart
// Show a normal toast
ToastService.show(message: 'Hello World!');

// Show a success toast
ToastService.success('Operation completed successfully!');

// Show an error toast
ToastService.error('Something went wrong!');

// Show a warning toast
ToastService.warning('Please be careful!');

// Show an info toast
ToastService.info('Here is some information.');
```

### Customizing Position

```dart
ToastService.show(
  message: 'Custom position toast!',
  position: ToastPosition.topRight,
);
```

### Custom Styling

```dart
final customStyle = ToastStyle(
  backgroundColor: Colors.purple,
  textColor: Colors.white,
  icon: Icons.star,
  iconColor: Colors.yellow,
  borderRadius: 12.0,
  padding: EdgeInsets.all(16.0),
  duration: Duration(seconds: 5),
  showProgressIndicator: true,
);

ToastService.show(
  message: 'Customized toast!',
  style: customStyle,
);
```

## Toast Types

- `ToastType.normal` - Default toast with neutral styling
- `ToastType.success` - Green toast with check icon
- `ToastType.error` - Red toast with error icon
- `ToastType.warning` - Orange toast with warning icon
- `ToastType.info` - Blue toast with info icon
- `ToastType.custom` - Custom styled toast

## Toast Positions

- `ToastPosition.top`
- `ToastPosition.center`
- `ToastPosition.bottom`
- `ToastPosition.topLeft`
- `ToastPosition.topRight`
- `ToastPosition.bottomLeft`
- `ToastPosition.bottomRight`

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
