import 'package:flutter/material.dart';
import 'toast_style.dart';
import 'toast_type.dart';

/// A customizable toast widget that displays a message with optional icon and styling
class ToastWidget extends StatefulWidget {
  /// The message to display in the toast
  final String message;

  /// The type of toast to display
  final ToastType type;

  /// Custom style for the toast
  final ToastStyle style;

  /// Callback when the toast is dismissed
  final VoidCallback? onDismissed;

  /// Creates a [ToastWidget]
  ToastWidget({
    super.key,
    required this.message,
    this.type = ToastType.normal,
    ToastStyle? style,
    this.onDismissed,
  }) : style = style ?? ToastStyle.fromType(type);

  @override
  State<ToastWidget> createState() => _ToastWidgetState();
}

class _ToastWidgetState extends State<ToastWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _slideAnimation = Tween<double>(begin: 50.0, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _animationController.forward();

    if (!widget.style.showProgressIndicator) {
      Future.delayed(widget.style.duration, () {
        if (mounted) {
          _animationController.reverse().then((_) {
            widget.onDismissed?.call();
          });
        }
      });
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Opacity(
          opacity: _fadeAnimation.value,
          child: Transform.translate(
            offset: Offset(0, _slideAnimation.value),
            child: Material(
              color: Colors.transparent,
              child: Container(
                padding: widget.style.padding,
                decoration: BoxDecoration(
                  color: widget.style.backgroundColor,
                  borderRadius: BorderRadius.circular(
                    widget.style.borderRadius,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (widget.style.icon != null) ...[
                      Icon(
                        widget.style.icon,
                        color: widget.style.iconColor ?? widget.style.textColor,
                      ),
                      const SizedBox(width: 12),
                    ],
                    Flexible(
                      child: Text(
                        widget.message,
                        style: TextStyle(color: widget.style.textColor),
                      ),
                    ),
                    if (widget.style.showProgressIndicator) ...[
                      const SizedBox(width: 12),
                      SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            widget.style.textColor,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
