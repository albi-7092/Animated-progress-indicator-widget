import 'package:flutter/material.dart';

class AnimatedCircularProgressIndicator extends StatefulWidget {
  final double progress;

  const AnimatedCircularProgressIndicator({super.key, required this.progress})
      : assert(
            progress >= 0 && progress <= 1, 'Progress must be between 0 and 1');

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedCircularProgressIndicatorState createState() =>
      _AnimatedCircularProgressIndicatorState();
}

class _AnimatedCircularProgressIndicatorState
    extends State<AnimatedCircularProgressIndicator> {
  late double _progress;

  @override
  void initState() {
    super.initState();
    _progress = widget.progress;
    _animateProgress();
  }

  void _animateProgress() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _progress =
            widget.progress.clamp(0.0, 1.0); // Ensure value is between 0 and 1
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: _progress),
      duration: const Duration(seconds: 2),
      builder: (context, value, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 70,
              height: 70,
              child: CircularProgressIndicator(
                value: value,
                strokeWidth: 8.0,
              ),
            ),
            Positioned.fill(
              child: Center(
                child: Text(
                  '${(value * 100).toInt()}%',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
