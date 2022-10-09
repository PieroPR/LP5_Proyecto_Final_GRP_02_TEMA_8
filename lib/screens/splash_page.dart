// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:after_layout/after_layout.dart';
// import 'package:mi_nueva_app/pages/home_page3.dart';
import '../screens/nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import '../widgets/contenedor_circulo.dart';
import '../widgets/contenedor_input.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

// cuando se llama AfterLayoutMixin, te va a permitir llamar el after_layout
// Lo que hace este AfterLayoutMixin, es sobreescribir el initState,
// de modo que, pregunta si ya la instancia del widget ha sido montada, es decir,
// si ya se genero el layout, ya tengo yo los recursos que el widget necesarias,
// recien lo puedo usar

class _SplashPageState extends State<SplashPage> {
  bool _isVisible = false;
  bool _isChecked = false;
  double _fontSize = 20;

  // No confiarse en poner directamente el navigator en initState, porque
  // no se sabe, si los widgets o paginas terminaron de renderisarse.
  // Por ello, se pone un tiempo de espera de 3 segundos.

  // Para solucionar ese problema, se instala el paquete after_layout.
  // ================= after_layout =================
  // Este paquete me da la funcionalidad de ejecutar codigo despues que
  // se haya generado ya la pagina principal, es decir,
  // cuando se haya construido el widget principal

  //los futuros son ouna operacion asyncrona, y se llama con then, es decir,
  // llama una funcion cuando se complete el futuro, osea, despues de los
  // 3 segundos, voy a llamar a una funcion.
  // Y para esa funcion que va cambiar de pagina, se llama al navigator

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      ContenedorCirculo(
                        width: 70,
                        height: 70,
                        child: SvgPicture.asset(
                          'assets/svg/usuario2.svg',
                          width: 50,
                          height: 50,
                          color: Colors.pinkAccent,
                        ),
                        // child: Icon(Icons.phone_android,size: 50,color: Colors.red,),
                      ),
                      Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10),
                          child: const Text(
                            'Sign in',
                            style: TextStyle(
                                color: Color.fromARGB(96, 140, 33, 228),
                                fontWeight: FontWeight.w500,
                                fontSize: 30),
                          )),
                      ContenedorInputs(
                        stringsinput: "User Name",
                        obscure: false,
                        colr: Color.fromARGB(96, 140, 33, 228),
                      ),
                      ContenedorInputs(
                        stringsinput: "Password",
                        obscure: true,
                        colr: Color.fromARGB(96, 140, 33, 228),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(96, 140, 33, 228),
                          ),
                          child: const Text('Login'),
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              NavScreen.routeName,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
