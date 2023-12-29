import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:super_mario/components.dart';
import 'package:super_mario/mario.dart';

class homeLayout extends StatefulWidget {
  const homeLayout({Key? key}) : super(key: key);

  @override
  State<homeLayout> createState() => _homeLayoutState();
}

class _homeLayoutState extends State<homeLayout> {
  static double marioX = 0;
  static double marioY = 1;
  double shroomX = 0.5;
  double shroomY = 1;
  double time = 0;
  double height = 0;
  double initialheight = marioY;
  String direction = 'right';
  bool midrun = false;
  bool midJump = false;
  double marioSize = 50;
  var gameFont= GoogleFonts.pressStart2p(
    textStyle: TextStyle(
      fontSize: 20.0,
      color: Colors.white
    )
  );
  static double blockX = -0.3;
  static double blockY = 0.3;
  double moneyX = blockX;
  double moneyY = blockY;
  int money = 0 ;
  void releaseMoney(){
    money++;
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      setState(() {
        moneyY -= 0.1;
      });
      if(moneyY < -1){
         timer.cancel();
         moneyY = blockY;
      }
    });
 
  }
  void fail(){
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      setState(() {
        marioY += 0.05;
      });
      if(marioY > 1){
        marioY =1;
         timer.cancel();
         midJump = false;
      }
    });
  }
  bool onPlatForm(double X,double Y){
    if((X - blockX).abs()< 0.05 && (Y - blockY).abs()< 0.3){
      midJump =false;
      marioY=blockY-0.28;
      return true;
    }else{
      return false;
    }
  }

  void ateShrooms(){
    if((marioX - shroomX).abs()< 0.05 && (marioY - shroomY).abs()< 0.05 ){
setState(() {
  shroomX =2;
  marioSize =100;
});
    }
  }

 void blockCach(){
    if((marioX - blockX).abs()< 0.05 && (marioY - blockY).abs()< 0.05 ){
      fail();
setState(() {
  blockX =2;
  // marioSize =100;
});
    }
  }
  void preJump() {
    time = 0;
    initialheight = marioY;
  }

  void jump() {
   if(midJump == false)
   { midJump = true;
    preJump();
    blockCach();
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      blockCach();
      time += 0.05;
      height = -4.9 * time * time + 5 * time;
      if (initialheight - height > 1) {
        midJump = false;
        setState(() {
          marioY = 1;
        });
        timer.cancel();
      } else {
        setState(() {
          marioY = initialheight - height;
        });
      }
    });}
  }

  void moveRight() {
    direction = 'Right';
    ateShrooms();
    Timer.periodic(Duration(milliseconds: 50), (timer) {
     ateShrooms();
      if (MyButton().userIsHoldingButton() == true && (marioX + 0.02) < 1) {
        setState(() {
          marioX += 0.02;
          midrun = !midrun;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void moveLeft() {
    direction = 'Left';
    ateShrooms();
    Timer.periodic(Duration(milliseconds: 50), (timer) {
    ateShrooms();
      if (MyButton().userIsHoldingButton() == true && (marioX - 0.02) > -1) {
        setState(() {
          marioX -= 0.02;
          midrun = !midrun;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Expanded(
          flex: 4,
          child: Stack(
            children: [
              Container(
                child: AnimatedContainer(
                  alignment: Alignment(marioX, marioY),
                  duration: Duration(milliseconds: 0),
                  child: midJump
                      ? JumpingMario(direction: direction,size:marioSize)
                      : MyMario(
                          direction: direction,
                          midrun: midrun,
                          size: marioSize,
                        ),
                ),
                color: Colors.blue,
              ),
              Container(
                alignment: Alignment(shroomX, shroomY ),
                child: MyShroom(),
              ),
              Container(
                alignment: Alignment(blockX, blockY ),
                child: MyBlock(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [Text('MARIO', style: gameFont),
                      SizedBox( height: 10.0,),
                      Text('00000', style: gameFont,)],
                    ),
                    Column(
                      children: [Text('WORLD', style: gameFont),
                      SizedBox( height: 10.0,), 
                      Text('1-1', style: gameFont,)],
                    ),
                    Column(
                      children: [Text('TIME', style: gameFont),
                      SizedBox( height: 10.0,), 
                       Text('9999', style: gameFont,)],
                    )
                  ],
                ),
              )
            ],
          )),
      Expanded(
          flex: 1,
          child: Container(
            color: Colors.brown,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: MyButton(
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      function: moveLeft,
                    ),
                  ),
                  Container(
                      child: MyButton(
                    child: Icon(
                      Icons.arrow_upward,
                      color: Colors.white,
                    ),
                    function: jump,
                  )),
                  Container(
                      child: MyButton(
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                    function: moveRight,
                  )),
                ]),
          ))
    ]));
  }
}
