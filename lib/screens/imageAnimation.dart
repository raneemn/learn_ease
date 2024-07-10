import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class imageAnimation extends StatefulWidget {
  const imageAnimation({super.key});
  static const routeName = 'image Anim';

  @override
  State<imageAnimation> createState() => _imageAnimationState();
}

class _imageAnimationState extends State<imageAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Animation'),
      ),
      body: Hero(
          tag: 'Image1',
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.scale(
                scale: _animation.value,
                child: Image.asset('assets/images/image.png'),
              );
            },
          ),),
    );
    
  }
}
