import 'package:flutter/material.dart';
import 'toast_position.dart';
import 'toast_style.dart';
import 'toast_type.dart';
import 'toast_widget.dart';

/// Service to show toast notifications
class ToastService {
  static final ToastService _instance = ToastService._internal();
  static OverlayState? _overlayState;
  static final List<OverlayEntry> _activeToasts = [];
  static const int _maxActiveToasts = 5;

  /// Factory constructor to return the singleton instance
  factory ToastService() {
    return _instance;
  }

  ToastService._internal();

  /// Initialize the toast service with the overlay state
  static void init(BuildContext context) {
    _overlayState = Overlay.of(context);
  }

  /// Show a toast notification
  static void show({
    required String message,
    ToastType type = ToastType.normal,
    ToastStyle? style,
    ToastPosition position = ToastPosition.bottom,
    double margin = 16.0,
  }) {
    if (_overlayState == null) {
      throw Exception(
        'ToastService not initialized. Call ToastService.init() first.',
      );
    }

    // Remove oldest toast if maximum is reached
    if (_activeToasts.length >= _maxActiveToasts) {
      _activeToasts.first.remove();
      _activeToasts.removeAt(0);
    }

    late final OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) {
        return _ToastOverlay(
          message: message,
          type: type,
          style: style,
          position: position,
          margin: margin,
          onDismissed: () {
            overlayEntry.remove();
            _activeToasts.remove(overlayEntry);
          },
        );
      },
    );

    _activeToasts.add(overlayEntry);
    _overlayState!.insert(overlayEntry);
  }

  /// Show a success toast
  static void success(
    String message, {
    ToastStyle? style,
    ToastPosition position = ToastPosition.bottom,
  }) {
    show(
      message: message,
      type: ToastType.success,
      style: style,
      position: position,
    );
  }

  /// Show an error toast
  static void error(
    String message, {
    ToastStyle? style,
    ToastPosition position = ToastPosition.bottom,
  }) {
    show(
      message: message,
      type: ToastType.error,
      style: style,
      position: position,
    );
  }

  /// Show a warning toast
  static void warning(
    String message, {
    ToastStyle? style,
    ToastPosition position = ToastPosition.bottom,
  }) {
    show(
      message: message,
      type: ToastType.warning,
      style: style,
      position: position,
    );
  }

  /// Show an info toast
  static void info(
    String message, {
    ToastStyle? style,
    ToastPosition position = ToastPosition.bottom,
  }) {
    show(
      message: message,
      type: ToastType.info,
      style: style,
      position: position,
    );
  }
}

class _ToastOverlay extends StatelessWidget {
  final String message;
  final ToastType type;
  final ToastStyle? style;
  final ToastPosition position;
  final double margin;
  final VoidCallback onDismissed;

  const _ToastOverlay({
    required this.message,
    required this.type,
    this.style,
    required this.position,
    required this.margin,
    required this.onDismissed,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _getLeftPosition(),
      right: _getRightPosition(),
      top: _getTopPosition(),
      bottom: _getBottomPosition(),
      child: SafeArea(
        child: ToastWidget(
          message: message,
          type: type,
          style: style,
          onDismissed: onDismissed,
        ),
      ),
    );
  }

  double? _getLeftPosition() {
    switch (position) {
      case ToastPosition.topLeft:
      case ToastPosition.bottomLeft:
        return margin;
      case ToastPosition.top:
      case ToastPosition.center:
      case ToastPosition.bottom:
        return margin;
      case ToastPosition.topRight:
      case ToastPosition.bottomRight:
        return null;
    }
  }

  double? _getRightPosition() {
    switch (position) {
      case ToastPosition.topRight:
      case ToastPosition.bottomRight:
        return margin;
      case ToastPosition.top:
      case ToastPosition.center:
      case ToastPosition.bottom:
        return margin;
      case ToastPosition.topLeft:
      case ToastPosition.bottomLeft:
        return null;
    }
  }

  double? _getTopPosition() {
    switch (position) {
      case ToastPosition.top:
      case ToastPosition.topLeft:
      case ToastPosition.topRight:
        return margin;
      case ToastPosition.center:
        return null;
      case ToastPosition.bottom:
      case ToastPosition.bottomLeft:
      case ToastPosition.bottomRight:
        return null;
    }
  }

  double? _getBottomPosition() {
    switch (position) {
      case ToastPosition.bottom:
      case ToastPosition.bottomLeft:
      case ToastPosition.bottomRight:
        return margin;
      case ToastPosition.center:
        return null;
      case ToastPosition.top:
      case ToastPosition.topLeft:
      case ToastPosition.topRight:
        return null;
    }
  }
}
