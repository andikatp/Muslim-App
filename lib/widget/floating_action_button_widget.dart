import 'package:flutter/material.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(56), boxShadow: [
        BoxShadow(
          color: Color(0xFFFF4E4C).withOpacity(0.3),
          offset: Offset(2, 5),
          blurRadius: 6.0,
        )
      ]),
      child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Color(0xFFFF4E4C),
          shape: RoundedRectangleBorder(
              side: BorderSide(width: 3, color: Colors.white),
              borderRadius: BorderRadius.circular(56)),
          child: Icon(
            Icons.add,
          )),
    );
  }
}
