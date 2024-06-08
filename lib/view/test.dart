import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({super.key});

  @override
  State<LikeButton> createState() => _nameState();
}

class _nameState extends State<LikeButton> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;
  late Animation sizeAnimation;
  int currentState = 0;
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);

    animation = Tween(begin: 0, end: 60).animate(animationController)
      ..addListener(() {
        setState(() {
          print(animation.value);
        });
      });

    sizeAnimation = Tween(begin: 0, end: 1).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn))
      ..addListener(() {
        setState(() {
          print(sizeAnimation.value);
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.red,
        width: 200,
        height: 300,
        child: Center(
          child: Stack(
            children: [
              // Positioned(
              //   bottom: 0.2,
              //   child: Transform.scale(
              //     scale: 0.2,
              //     child: FloatingActionButton(
              //         backgroundColor: Colors.redAccent,
              //         onPressed: () {

              //         },
              //         child: Icon(Icons.cake)),
              //   ),
              // ),
              Positioned(
                bottom: 0,
                child: Transform.scale(
                  scale: 1,
                  child: FloatingActionButton(
                      backgroundColor: Colors.green,
                      onPressed: () {
                        print("ovsls");
                        animationController.forward();
                      },
                      child: Icon(Icons.close)),
                ),
              ),
              // Positioned(
              //   bottom: 0,
              //   child: Transform.scale(
              //     scale: 0.2 - 1,
              //     child: FloatingActionButton(
              //         onPressed: () {
              //           animationController.forward();
              //         },
              //         child: Icon(Icons.add)),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
