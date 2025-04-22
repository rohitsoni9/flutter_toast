import 'package:flutter/material.dart';
import 'package:flutter_toast_plus/flutter_toast_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Toast Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ToastExample(),
    );
  }
}

class ToastExample extends StatelessWidget {
  const ToastExample({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the toast service
    ToastService.init(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Toast Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                ToastService.show(message: 'This is a simple toast message!');
              },
              child: const Text('Show Simple Toast'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                ToastService.success('Success!');
              },
              child: const Text('Show Success Toast'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                ToastService.error('Error occurred!');
              },
              child: const Text('Show Error Toast'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                ToastService.show(
                  message: 'Custom styled toast',
                  style: ToastStyle(
                    backgroundColor: Colors.orange,
                    textColor: Colors.white,
                  ),
                );
              },
              child: const Text('Show Custom Toast'),
            ),
          ],
        ),
      ),
    );
  }
}
