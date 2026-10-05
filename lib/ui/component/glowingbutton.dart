// glowing_add_button.dart
import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Reusable premium "Add Money" button with a soft rotating white halo.
class GlowingAddButton extends StatefulWidget {
  const GlowingAddButton({
    super.key,
    this.onPressed,
    this.size = 50.0,
    this.iconSize = 24.0,
    this.duration = const Duration(seconds: 3),
    this.glowStrength = 0.9,
    this.outerGlowWidth = 16.0,       // slightly larger soft halo
    this.arcLength = 0.58,
    this.glowOffset = 6,            // ← distance of the glowing ring from button edge
    this.buttonColor = const Color(0xFF1C1C1E),
  });

  final VoidCallback? onPressed;
  final double size;
  final double iconSize;
  final Duration duration;
  final double glowStrength;
  final double outerGlowWidth;
  final double arcLength;
  final double glowOffset;            // how far outside the button the ring sits
  final Color buttonColor;

  @override
  State<GlowingAddButton> createState() => _GlowingAddButtonState();
}

class _GlowingAddButtonState extends State<GlowingAddButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Extra space so the larger ring + soft glow never gets clipped
    final extra = widget.outerGlowWidth + widget.glowOffset;

    return GestureDetector(
      onTap: widget.onPressed,
      child: SizedBox(
        width: widget.size + extra * 2,
        height: widget.size + extra * 2,
        child: CustomPaint(
          painter: _GlowPainter(
            animation: _controller,
            buttonSize: widget.size,
            glowStrength: widget.glowStrength,
            outerGlowWidth: widget.outerGlowWidth,
            arcLength: widget.arcLength,
            glowOffset: widget.glowOffset,
            buttonColor: widget.buttonColor,
          ),
          child: Center(
            child: Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.buttonColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.45),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: widget.iconSize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _GlowPainter extends CustomPainter {
  _GlowPainter({
    required this.animation,
    required this.buttonSize,
    required this.glowStrength,
    required this.outerGlowWidth,
    required this.arcLength,
    required this.glowOffset,
    required this.buttonColor,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final double buttonSize;
  final double glowStrength;
  final double outerGlowWidth;
  final double arcLength;
  final double glowOffset;
  final Color buttonColor;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final buttonRadius = buttonSize / 2;

    // Glow ring sits a bit outside the button (this makes the circular line larger)
    final glowRadius = buttonRadius + glowOffset;

    final angle = animation.value * 2 * math.pi;

    // Layer 1 – soft wide outer halo
    _drawGlowLayer(
      canvas: canvas,
      center: center,
      radius: glowRadius,
      strokeWidth: outerGlowWidth,
      opacity: 0.20 * glowStrength,
      arcLength: arcLength * 1.4,
      angle: angle,
      blurSigma: 7.0,
    );

    // Layer 2 – mid diffused glow
    _drawGlowLayer(
      canvas: canvas,
      center: center,
      radius: glowRadius,
      strokeWidth: outerGlowWidth * 0.55,
      opacity: 0.40 * glowStrength,
      arcLength: arcLength * 1.15,
      angle: angle,
      blurSigma: 3.8,
    );

    // Layer 3 – brighter core
    _drawGlowLayer(
      canvas: canvas,
      center: center,
      radius: glowRadius,
      strokeWidth: 3.8,
      opacity: 0.80 * glowStrength,
      arcLength: arcLength * 0.9,
      angle: angle,
      blurSigma: 1.4,
    );

    // Layer 4 – small bright hotspot
    _drawGlowLayer(
      canvas: canvas,
      center: center,
      radius: glowRadius,
      strokeWidth: 2.0,
      opacity: 1.0 * glowStrength,
      arcLength: arcLength * 0.38,
      angle: angle,
      blurSigma: 0.7,
    );
  }

  void _drawGlowLayer({
    required Canvas canvas,
    required Offset center,
    required double radius,
    required double strokeWidth,
    required double opacity,
    required double arcLength,
    required double angle,
    required double blurSigma,
  }) {
    final halfArc = arcLength / 2;

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, blurSigma)
      ..shader = SweepGradient(
        startAngle: -halfArc,
        endAngle: halfArc,
        colors: [
          Colors.white.withOpacity(0.0),
          Colors.white.withOpacity(opacity * 0.45),
          Colors.white.withOpacity(opacity),
          Colors.white.withOpacity(opacity * 0.45),
          Colors.white.withOpacity(0.0),
        ],
        stops: const [0.0, 0.22, 0.5, 0.78, 1.0],
        transform: GradientRotation(angle),
      ).createShader(Rect.fromCircle(center: center, radius: radius));

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant _GlowPainter oldDelegate) {
    return oldDelegate.animation != animation ||
        oldDelegate.glowStrength != glowStrength ||
        oldDelegate.outerGlowWidth != outerGlowWidth ||
        oldDelegate.arcLength != arcLength ||
        oldDelegate.glowOffset != glowOffset ||
        oldDelegate.buttonSize != buttonSize;
  }
}