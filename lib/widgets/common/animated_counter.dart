import 'package:flutter/material.dart';

class AnimatedCounter extends StatefulWidget {
  final String value;
  final String label;
  final Duration duration;

  const AnimatedCounter({
    super.key,
    required this.value,
    required this.label,
    this.duration = const Duration(milliseconds: 1500),
  });

  @override
  State<AnimatedCounter> createState() => _AnimatedCounterState();
}

class _AnimatedCounterState extends State<AnimatedCounter>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int _extractNumber(String value) {
    final numStr = value.replaceAll(RegExp(r'[^0-9]'), '');
    return int.tryParse(numStr) ?? 0;
  }

  String _formatValue(int number, String original) {
    if (original.contains('+')) {
      return '$number+';
    } else if (original.contains('K')) {
      return '${number}K+';
    }
    return number.toString();
  }

  @override
  Widget build(BuildContext context) {
    final targetNumber = _extractNumber(widget.value);

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        final currentNumber = (targetNumber * _animation.value).round();
        return Column(
          children: [
            Text(
              _formatValue(currentNumber, widget.value),
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              widget.label,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }
}
