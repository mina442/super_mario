import 'package:flutter/material.dart';
class MyButton extends StatelessWidget {

    final child;
    final function;
      // Color backgraund = Colors.white,
      static bool holdingButton =false;

  const MyButton({super.key,  this.child, this.function});
  bool userIsHoldingButton(){
    return holdingButton;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap:function ,
      onTapDown:(details) {
        holdingButton = true;
        function();
      },
      onTapUp:(details) {
        holdingButton = false;
         function();
      },
      child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child:   Container(
        padding: EdgeInsets.all(15),
        color: Colors.brown[300],
        child: child,
        ),
      ),
    );
  }
}
// Widget MyButton(
//   {
   
//     }

//   {
//   double width = double.infinity,


//   required String text,
//   bool isUpperCase = true,
//   double Radius = 10.0,
// }
// ) =>
    
//               child: IconButton(
                
//                 icon: icon,
//                  onPressed: function,
//                  color: backgraund,
//                 ), 
                
          // decoration: BoxDecoration(
          //      borderRadius: BorderRadius.circular(Radius)),
          // width: width,
          // child: MaterialButton(
          //   onPressed: function,
          //   child: Text(
          //     isUpperCase ? text.toUpperCase() : text,
          //     style: TextStyle(color: Colors.white),
          //   ),
          // )

