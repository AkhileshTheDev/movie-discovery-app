import 'package:flutter/material.dart';

// A widget that animates its child with a scale effect when it appears
class AnimatedScrollViewItem extends StatefulWidget {
  final Widget child; // The child widget to be animated

  const AnimatedScrollViewItem({super.key, required this.child});

  @override
  State<AnimatedScrollViewItem> createState() => _AnimatedScrollViewItemState();
}

class _AnimatedScrollViewItemState extends State<AnimatedScrollViewItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController; // Controller for the animation
  late final Animation<double> _scaleAnimation; // Animation for scaling

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _animationController = AnimationController(
      vsync: this, // Ticker provider for the animation
      duration: const Duration(milliseconds: 300), // Duration of the animation
    )..forward(); // Start the animation immediately

    // Define the scale animation from 0.5 to 1 (scale up)
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut)); // Apply ease-in-out curve
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose(); // Clean up the animation controller
  }

  @override
  Widget build(BuildContext context) {
    // Return a ScaleTransition that animates the scaling of the child widget
    return ScaleTransition(
      scale: _scaleAnimation, // The scale animation
      child: widget.child, // The child widget to animate
    );
  }
}
