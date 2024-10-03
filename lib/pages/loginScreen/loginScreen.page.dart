import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:global_med/pages/homeScreen/home.page.dart';
import 'package:global_med/state/provider/globalmed.user.provider.dart';
import 'package:global_med/themes/themes.dart';
import 'package:global_med/utils/routes/routes.dart';
import 'package:global_med/utils/utils.dart';
import 'package:provider/provider.dart';

import 'widgets/socialSinInButtom.widget.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _isPasswordVisible = false;
  String _errorMessage = '';

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _signIn() async {
    setState(() {
      _errorMessage = '';
    });

    try {
      // final userCredential =
      //     await FirebaseAuth.instance.signInWithEmailAndPassword(
      //   email: emailController.text.trim(),
      //   password: passwordController.text.trim(),
      // );
      // print('Usuario inició sesión: ${userCredential.user}');

      // QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      //     .collection('Usuario')
      //     .where('email', isEqualTo: emailController.text.trim())
      //     .get();
      // if (querySnapshot.docs.isNotEmpty) {
      //   print("el usuario existe");
      //   final userProvider =
      //       Provider.of<GlobalMedProviderUser>(context, listen: false);
      //   var doc = querySnapshot.docs.first;
      //   userProvider.setUserData(
      //       doc.id, querySnapshot.docs.first.data() as Map<String, dynamic>);
      // } else {
      //   print("el usuario no existe");
      // }
      // ;

      // ´por defecto
      final userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'tecn0crisis0@gmail.com',
        password: 'SCristhian69*',
      );
      print('Usuario inició sesión: ${userCredential.user}');

      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Usuario')
          .where('email', isEqualTo: 'tecn0crisis0@gmail.com')
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        print("el usuario existe");
        final userProvider =
            Provider.of<GlobalMedProviderUser>(context, listen: false);
        var doc = querySnapshot.docs.first;
        userProvider.setUserData(
            doc.id, querySnapshot.docs.first.data() as Map<String, dynamic>);
      } else {
        print("el usuario no existe");
      }
      Navigator.of(context).pushNamed(RouteManager.homeScreen);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        setState(() {
          _errorMessage = 'No se encontró un usuario con ese correo.';
        });
      } else if (e.code == 'wrong-password') {
        setState(() {
          _errorMessage = 'Contraseña incorrecta.';
        });
      } else {
        setState(() {
          _errorMessage = 'Ocurrio un error, Credenciales Invalidas';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              top: -100.h,
              left: -100.h,
              child: Container(
                height: 200.h,
                width: 200.h,
                decoration: BoxDecoration(
                  color: secondary,
                  borderRadius: BorderRadius.all(
                    Radius.circular(400.h),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -200.h,
              right: -200.h,
              child: Container(
                height: 400.h,
                width: 400.h,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment.center,
                    radius: 0.6,
                    colors: [
                      secondary.withOpacity(0.8),
                      Color(0xFFFFFFFF),
                    ],
                    stops: [0.3, 0.8],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(400.h),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40, left: 20, right: 20),
              child: ListView(
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 30.h,
                        ),
                        TextOP(
                          message: 'BIENVENIDO DE',
                        ),
                        TextOP(
                          message: 'VUELTA',
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          'Dolore dolore excepteur ad deserunt velit nostrud sunt enim anim.',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w200),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20.h),
                        TextLeyend(text: 'Correo'),
                        SizedBox(height: 10.h),
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: 'Correo',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: secondary, // Color del borde
                                width: 1.0, // Ancho del borde
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black
                                    .withOpacity(0.2), // Color del borde
                                width: 1.0, // Ancho del borde
                              ),
                            ),
                            // Configura el padding dentro del TextField:
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20.h),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        TextLeyend(text: 'Contraseña'),
                        SizedBox(height: 10.h),
                        TextField(
                          controller: passwordController,
                          obscureText: !_isPasswordVisible,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelText: 'Contraseña',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: secondary, // Color del borde
                                width: 1.0, // Ancho del borde
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black
                                    .withOpacity(0.2), // Color del borde
                                width: 1.0, // Ancho del borde
                              ),
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20.h),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            ),
                          ),
                        ),
                        if (_errorMessage.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              _errorMessage,
                              style: TextStyle(color: Colors.red, fontSize: 14),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        SizedBox(height: 50.h),
                        ElevatedButton(
                          child: Text(
                            'Ingresar',
                            style: TextStyle(
                                color: Color(0xffffffff), fontSize: 20.h),
                          ),
                          onPressed: _signIn,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: tree,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 15),
                          ),
                        ),
                        SizedBox(height: 30.h),
                        SizedBox(
                          height: 30,
                          child: Container(
                            width: 30,
                            height: 30,
                            child: Center(
                              child: Text(
                                'O',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        // // SocialSignInButton(
                        // //   text: 'Iniciar sesión con Facebook',
                        // //   iconPath: 'public/assets/icons/facebook.svg',
                        // //   color: Colors.white,
                        // //   titleColor: Colors.black,
                        // //   onPressed: () {},
                        // // ),
                        // // SizedBox(height: 15),
                        SocialSignInButton(
                          text: 'Iniciar sesión con Google',
                          iconPath: 'public/assets/icons/google.svg',
                          color: Colors.white,
                          titleColor: Colors.black,
                          onPressed: () {},
                        ),
                        // SizedBox(height: 15),
                        // SocialSignInButton(
                        //   text: 'Inicia sesión con Apple',
                        //   iconPath: 'public/assets/icons/apple.svg',
                        //   color: Colors.black,
                        //   titleColor: Colors.white,
                        //   onPressed: () {},
                        // ),
                        SizedBox(height: 30.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "No tienes una cuenta? ",
                              style: TextStyle(
                                fontFamily: "Sofa",
                                fontSize: 18.h,
                                height: 1.1,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(RouteManager.createScreen);
                              },
                              child: Text(
                                "Presiona Aqui",
                                style: TextStyle(
                                  fontFamily: "Acme",
                                  fontSize: 18.h,
                                  height: 1.1,
                                  color: secondary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 60.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextOP extends StatelessWidget {
  final String message;
  const TextOP({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: TextStyle(
        fontFamily: "Acme",
        fontSize: 45.h,
        height: 1.1,
        color: tree,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class TextLeyend extends StatelessWidget {
  final text;
  const TextLeyend({
    super.key,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 15, fontWeight: FontWeight.bold, color: secondary),
      textAlign: TextAlign.start,
    );
  }
}
