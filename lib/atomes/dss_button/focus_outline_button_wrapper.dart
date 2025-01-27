import 'package:flutter/material.dart';

class FocusOutlineButtonWrapper extends StatefulWidget {
  final Widget child;
  final double borderRadius;
  final Color focusColor;
  final double focusWidth;

  const FocusOutlineButtonWrapper({
    super.key,
    required this.child,
    required this.borderRadius,
    required this.focusColor,
    required this.focusWidth,
  });

  @override
  State<FocusOutlineButtonWrapper> createState() =>
      _FocusOutlineButtonWrapperState();
}

class _FocusOutlineButtonWrapperState extends State<FocusOutlineButtonWrapper> {
  bool _isDescendantFocused = false;

  @override
  Widget build(BuildContext context) {
    return Focus(
      // This wrapper is NOT itself focusable:
      canRequestFocus: false,
      skipTraversal: true,
      // But its descendants (the child button) ARE focusable:
      descendantsAreFocusable: true,

      onFocusChange: (hasFocus) {
        setState(() => _isDescendantFocused = hasFocus);
      },

      // Use a Stack so we can paint the ring above the child
      child: Stack(
        children: [
          // The actual button (or any focusable widget)
          widget.child,

          // Conditionally paint the ring if a descendant is focused
          if (_isDescendantFocused)
            Positioned.fill(
              child: IgnorePointer(
                // A CustomPaint that draws a rectangle ring on top
                child: CustomPaint(
                  painter: _FocusRingPainter(
                    color: widget.focusColor,
                    width: widget.focusWidth,
                    borderRadius: widget.borderRadius,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _FocusRingPainter extends CustomPainter {
  final Color color;
  final double width;
  final double borderRadius;

  _FocusRingPainter({
    required this.color,
    required this.width,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Prepare a stroke paint for the outline
    final paint = Paint()
      ..color = color
      ..strokeWidth = width
      ..style = PaintingStyle.stroke;

    // Draw a rounded rect that fills the entire child’s area
    final rect = Rect.fromLTWH(-2, -2, size.width + 4, size.height + 4);
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(borderRadius));

    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(_FocusRingPainter oldDelegate) => false;
}
