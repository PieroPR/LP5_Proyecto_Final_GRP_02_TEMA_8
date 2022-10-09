import 'package:flutter/material.dart';

class ContenedorCirculo extends StatelessWidget {
  final Widget child;
  final double width, height;

  const ContenedorCirculo(
      {super.key,
      required this.width,
      required this.height,
      required this.child})
      : assert(width > 0),
        assert(height > 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      // width: double.infinity,
      height: this.height,
      // color: Colors.blue,
      // ignore: sort_child_properties_last
      child: Center(
        child: this.child,
      ),
      // ignore: prefer_const_constructors
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 127, 17, 129),
          shape: BoxShape.circle,
          // ignore: prefer_const_literals_to_create_immutables
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(74, 133, 8, 186),
              blurRadius: 10,
              offset: Offset(5, 2),
            ),
          ]),
      alignment: Alignment.center,
    );
  }
}
