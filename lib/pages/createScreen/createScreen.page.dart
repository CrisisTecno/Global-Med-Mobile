import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:global_med/pages/loginScreen/loginScreen.page.dart';
import 'package:global_med/themes/themes.dart';
import 'package:global_med/utils/Size/sizer.dart';
import 'package:global_med/utils/routes/routes.dart';
import 'package:global_med/widgets/widgets.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _repeatPasswordController = TextEditingController();

  final passwordController1 = TextEditingController();
  bool _isPasswordVisible1 = false;
  final passwordController2 = TextEditingController();
  bool _isPasswordVisible2 = false;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<void> _uploadPost() async {
    try {
      String email = _emailController.text;
      String password = _passwordController.text;
      String name = _nameController.text;
      final Timestamp timestamp = Timestamp.now();
      DocumentReference docRef = await firestore.collection("Usuario").add({
        'email': email,
        'nombre': name,
        'contra': password,
        'rol': 'USER',
        'fechaDeCreacion': timestamp,
      });

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Text(
                'Excelente',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            content: Text(
              'Se a creado tu cuenta correctamente disfruta de GlobalMed',
              style: TextStyle(
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 50.w, vertical: 2.w),
                    decoration: BoxDecoration(
                        color: secondary,
                        border: Border.all(width: 2, color: secondary),
                        borderRadius: BorderRadius.all(Radius.circular(12.w))),
                    child: Text(
                      'OK',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      );
    } catch (error) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to add user: $error'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    bool allFieldsFilled = _emailController.text.isNotEmpty &&
        _nameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _repeatPasswordController.text.isNotEmpty;

    return SafeArea(
      child: Scaffold(
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
            Padding(
              padding: EdgeInsets.only(top: 5, left: 20, right: 20),
              child: ListView(
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 900.h,
                          width: double.infinity,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(height: 40.h),
                                TextOP(
                                  message: 'CREACION DE',
                                ),
                                TextOP(
                                  message: 'CUENTA',
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                SizedBox(height: 30.h),
                                TextLeyend(text: 'Nombres'),
                                SizedBox(height: 10.h),
                                InputText(
                                  label: 'Juanito Ar',
                                  icon: Icon(Icons.email_outlined),
                                  borderColor:
                                      const Color.fromARGB(255, 194, 192, 192),
                                  borderFocusedColor: secondary,
                                  controllersc: _nameController,
                                ),
                                SizedBox(height: 20.h),
                                TextLeyend(text: 'Correo'),
                                SizedBox(height: 10.h),
                                InputText(
                                  label: 'Correo',
                                  icon: Icon(Icons.email_outlined),
                                  borderColor:
                                      const Color.fromARGB(255, 194, 192, 192),
                                  borderFocusedColor: secondary,
                                  controllersc: _emailController,
                                ),
                                SizedBox(height: 20.h),
                                TextLeyend(text: 'Contraseña'),
                                SizedBox(height: 10.h),
                                TextField(
                                  controller: _passwordController,
                                  obscureText: !_isPasswordVisible1,
                                  decoration: InputDecoration(
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    labelText: 'Contraseña',
                                    focusedBorder: OutlineInputBorder(
                                      gapPadding: 10.w,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.w)),
                                      borderSide: BorderSide(
                                        color: secondary, // Color del borde
                                        width: 2, // Ancho del borde
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.w)),
                                      borderSide: BorderSide(
                                        color: const Color.fromARGB(255, 194,
                                            192, 192), // Color del borde
                                        width: 1, // Ancho del borde
                                      ),
                                    ),
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 20.h),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _isPasswordVisible1
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _isPasswordVisible1 =
                                              !_isPasswordVisible1;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                // InputText(
                                //   label: 'Contraseña',
                                //   icon: Icon(Icons.remove_red_eye_outlined),
                                //   borderColor: Colors.black.withOpacity(0.2),
                                //   borderFocusedColor: secondary,
                                //   controllersc: _passwordController,
                                // ),
                                SizedBox(height: 20.h),
                                TextLeyend(text: 'Repetir Contraseña'),
                                SizedBox(height: 10.h),
                                TextField(
                                  controller: _repeatPasswordController,
                                  obscureText: !_isPasswordVisible2,
                                  decoration: InputDecoration(
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    labelText: 'Repite la Contraseña',
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.w)),
                                      borderSide: BorderSide(
                                        color: secondary, // Color del borde
                                        width: 2, // Ancho del borde
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.w)),
                                      borderSide: BorderSide(
                                        color: const Color.fromARGB(
                                                255, 194, 192, 192)
                                            .withOpacity(
                                                0.1), // Color del borde
                                        width: 1, // Ancho del borde
                                      ),
                                    ),
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 20.h),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _isPasswordVisible2
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _isPasswordVisible2 =
                                              !_isPasswordVisible2;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(height: 50),
                                SizedBox(
                                  width: 400.h,
                                  height: 60.h,
                                  child: ElevatedButton(
                                    child: Text(
                                      'Crea tu cuenta',
                                      style: TextStyle(
                                        color: Color(0xffffffff),
                                        fontSize:
                                            18.h, // Tamaño de texto ajustado
                                      ),
                                    ),
                                    onPressed: allFieldsFilled
                                        ? _passwordController.text ==
                                                _repeatPasswordController.text
                                            ? () {
                                                _uploadPost();
                                              }
                                            : () {
                                                _showIncompleteFieldsDialogRepeat(
                                                    context);
                                              }
                                        : () {
                                            _showIncompleteFieldsDialogRepeat(
                                                context);
                                          },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          tree, // Color de fondo del botón
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            16), // Bordes redondeados
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          vertical:
                                              15), // Espaciado interno vertical
                                    ),
                                  ),
                                ),

                                SizedBox(height: 20.h),
                                Container(
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
                                SizedBox(height: 20.h),
                                Container(
                                  width: 400.h,
                                  height: 60.h,
                                  child: SocialSignInButton(
                                    text: 'Iniciar sesión con Google',
                                    iconPath: 'public/assets/icons/google.svg',
                                    color: Colors.white,
                                    titleColor: Colors.black,
                                    onPressed: () {},
                                  ),
                                ),
                                SizedBox(height: 60.h),
                              ],
                            ),
                          ),
                        )
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

  void _showIncompleteFieldsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text(
              'Campos Incompletos',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          content: Text(
            'Por favor, complete todos los campos antes de continuar.',
            style: TextStyle(
              fontSize: 15,
            ),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 50.w, vertical: 2.w),
                  decoration: BoxDecoration(
                      color: secondary,
                      border: Border.all(width: 2, color: secondary),
                      borderRadius: BorderRadius.all(Radius.circular(12.w))),
                  child: Text(
                    'OK',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showIncompleteFieldsDialogRepeat(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text(
              'Los campos no coinciden',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          content: Text(
            'Por favor, verifique los campos y vuelva a intentarlo',
            style: TextStyle(
              fontSize: 15,
            ),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 50.w, vertical: 2.w),
                  decoration: BoxDecoration(
                      color: secondary,
                      border: Border.all(width: 2, color: secondary),
                      borderRadius: BorderRadius.all(Radius.circular(12.w))),
                  child: Text(
                    'OK',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
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

class SocialSignInButton extends StatelessWidget {
  final String text;
  final String iconPath;
  final Color color;
  final Color titleColor;
  final VoidCallback onPressed;

  const SocialSignInButton({
    Key? key,
    required this.text,
    required this.iconPath,
    required this.color,
    required this.onPressed,
    required this.titleColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            iconPath,
            height: 35.0,
            width: 35.0,
          ),
          SizedBox(width: 20.h),
        ],
      ),
      label: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          color: titleColor,
        ),
      ),
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
        foregroundColor: MaterialStateProperty.all(titleColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 5)),
      ),
    );
  }
}
