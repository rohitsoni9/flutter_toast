import 'package:flutter/material.dart';
import 'toast_type.dart';

/// Class to customize the appearance of toast notifications
class ToastStyle {
  /// Background color of the toast
  final Color backgroundColor;

  /// Text color of the toast message
  final Color textColor;

  /// Icon to display in the toast (optional)
  final IconData? icon;

  /// Color of the icon
  final Color? iconColor;

  /// Border radius of the toast
  final double borderRadius;

  /// Padding inside the toast
  final EdgeInsets padding;

  /// Duration for which the toast should be visible
  final Duration duration;

  /// Whether to show a progress indicator
  final bool showProgressIndicator;

  /// Creates a [ToastStyle] instance
  const ToastStyle({
    this.backgroundColor = Colors.black87,
    this.textColor = Colors.white,
    this.icon,
    this.iconColor,
    this.borderRadius = 8.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    this.duration = const Duration(seconds: 3),
    this.showProgressIndicator = false,
  });

  /// Creates a preset style based on the toast type
  factory ToastStyle.fromType(ToastType type) {
    switch (type) {
      case ToastType.success:
        return ToastStyle(
          backgroundColor: Colors.green.shade800,
          icon: Icons.check_circle,
          iconColor: Colors.white,
        );
      case ToastType.error:
        return ToastStyle(
          backgroundColor: Colors.red.shade800,
          icon: Icons.error,
          iconColor: Colors.white,
        );
      case ToastType.warning:
        return ToastStyle(
          backgroundColor: Colors.orange.shade800,
          icon: Icons.warning,
          iconColor: Colors.white,
        );
      case ToastType.info:
        return ToastStyle(
          backgroundColor: Colors.blue.shade800,
          icon: Icons.info,
          iconColor: Colors.white,
        );
      case ToastType.normal:
      case ToastType.custom:
        return const ToastStyle();
    }
  }

  /// Creates a copy of this [ToastStyle] with the given fields replaced with new values
  ToastStyle copyWith({
    Color? backgroundColor,
    Color? textColor,
    IconData? icon,
    Color? iconColor,
    double? borderRadius,
    EdgeInsets? padding,
    Duration? duration,
    bool? showProgressIndicator,
  }) {
    return ToastStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
      icon: icon ?? this.icon,
      iconColor: iconColor ?? this.iconColor,
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
      duration: duration ?? this.duration,
      showProgressIndicator:
          showProgressIndicator ?? this.showProgressIndicator,
    );
  }
}
