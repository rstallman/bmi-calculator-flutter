import 'package:flutter/material.dart';
class ReusableCard extends StatelessWidget {

  final Color color;
  final Widget? cardChild;
  final  void Function()? onTap;

  ReusableCard({required this.color, this.cardChild, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
