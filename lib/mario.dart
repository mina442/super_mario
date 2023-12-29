import 'dart:math';

import 'package:flutter/material.dart';

class MyMario extends StatelessWidget {
  final direction;
  final midrun;
  final size;

  const MyMario({super.key, this.direction, this.midrun, this.size});

  @override
  Widget build(BuildContext context) {
    if (direction == 'Right')
      {return Container(
        child: midrun? Image.asset('assets/images/1.png'):Image.asset('assets/images/2.png'),
        width: size,
        height: size,
      );}
      else {
       return Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(pi),
          child: Container(
          child: midrun? Image.asset('assets/images/1.png'):Image.asset('assets/images/2.png'),
          width: size,
          height: size,
              ),
        );
        
      }
  }
}
class JumpingMario extends StatelessWidget {
  final direction;
  final size;

  const JumpingMario({super.key, required this.direction, this.size});

  @override
  Widget build(BuildContext context) {
   if (direction == 'Right')
      {return Container(
        child: 
        // midrun?
         Image.asset('assets/images/3.png'),
        //  :Image.asset('assets/images/2.png'),
        width: 100,
        height: 100,
      );}
      else {
       return Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(pi),
          child: Container(
          child: 
          // midrun?
           Image.asset('assets/images/3.png'),
          //  :Image.asset('assets/images/2.png'),
          width: 100,
          height: 100,
              ),
        );
        
      }
  }
}
class MyShroom extends StatelessWidget {
  const MyShroom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      child: Image.asset('assets/images/5.png'),
    );
  }
}
class MyBlock extends StatelessWidget {
  const MyBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      child: Image.asset('assets/images/4.png'),
    );
  }
}
