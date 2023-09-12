import 'package:flutter/material.dart';

class button extends StatelessWidget {
  const  button(
      {super.key,
      required this.onTap,
      required this.height,
      required this.charcolor,
      required this.width,
    required  this.color,
      required this.char});
  final void Function()? onTap;
  final double width;
  final double height;
  final String char;
  final  Color charcolor;
  final Color color ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 15),
          child: Container(
            decoration: BoxDecoration(
                color: color,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(16)),
            height: height,
            width: width,
            child: Center(
                child: Text(
              char,
              style: TextStyle(
                  fontSize: 40, color: charcolor, fontWeight: FontWeight.w700),
            )),
          ),
        ));
  }
}
