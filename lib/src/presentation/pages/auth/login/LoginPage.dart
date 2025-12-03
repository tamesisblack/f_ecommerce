import 'package:f_ecommerce/src/presentation/pages/auth/login/LoginBlocCubit.dart';
import 'package:f_ecommerce/src/presentation/widgets/DefaultTextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
   LoginBlocCubit? _loginBlocCubit;
   @override
   void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _loginBlocCubit?.dispose();
    });
    
  }

  @override
  Widget build(BuildContext context) {
    _loginBlocCubit = BlocProvider.of<LoginBlocCubit>(context, listen: true);
    return Scaffold(
      body: Container(
        width: double.infinity, // ocupa todo el ancho
        // color: Colors.amber,    // ✅ ahora sí pinta el fondo
        child: Stack(
          alignment: Alignment.center, // centra los hijos del Stack
          children: [
            Image.asset(
              'assets/img/background2.jpg',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color:Colors.black54,
              colorBlendMode: BlendMode.darken,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.3), // color de fondo con opacidad
                borderRadius: BorderRadius.all(Radius.circular(25)), // bordes redondeados
              ),
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.75,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // centra los hijos en el eje vertical
                crossAxisAlignment: CrossAxisAlignment.center, // centra los hijos en el eje horizontal
                children: [
                  const Icon(
                    Icons.person,
                    size: 125,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 20), // espacio entre icono y texto
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 25, right: 25), // espacio entre el texto y el TextField
                    child: StreamBuilder(
                      stream: _loginBlocCubit?.emailStream,
                      builder: (context, asyncSnapshot) {
                        return DefaultTextfield(
                          label: 'Correo electrónico',
                          icon: Icons.email,
                          errorText: asyncSnapshot.error?.toString() ,
                          onChanged: (text) {
                            _loginBlocCubit?.changeEmail(text);
                          });
                      }
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25), // espacio entre los dos TextField
                    child: StreamBuilder(
                      stream: _loginBlocCubit?.passwordStream,
                      builder: (context, asyncSnapshot) {
                        return DefaultTextfield(
                          label: 'Contraseña',
                          icon: Icons.lock,
                          onChanged: (text) {
                            _loginBlocCubit?.changePassword(text);
                          },
                          errorText: asyncSnapshot.error?.toString() ,
                          obscureText: true,
                        );
                      }
                    )
                  ),
                  const SizedBox(height: 20), // espacio entre texto y botón
                 Container(
                    width: MediaQuery.of(context).size.width, // ancho del botón
                    height: 55,
                    margin: EdgeInsets.only(left: 25, right: 25, top: 25, bottom: 15),// margen a los lados
                    child: StreamBuilder(
                      stream: _loginBlocCubit?.isFormValidStream,
                      builder: (context, asyncSnapshot) {
                        return ElevatedButton(
                        onPressed: () {
                          if(asyncSnapshot.hasData){
                              _loginBlocCubit?.login();
                          }else{
                            print("Formulario no válido");
                           Fluttertoast.showToast(
                                msg: "Por favor, complete el formulario correctamente",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0
                            );
                          }
                        
                         // Navigator.pushNamed(context, '/home');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: asyncSnapshot.hasData ? Colors.green : Colors.grey,
                        ),
                        child: const Text(
                          'Iniciar sesión',
                          style: TextStyle(
                            color: Colors.white, // 👈 en lugar de backgroundColor dentro del texto
                          ),
                        ),
                                       );
                      }
                    ),
                 ),
              
                const SizedBox(height: 10), // espacio entre los botones y el texto
              
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(width: 65,height: 1, color: Colors.white, margin: EdgeInsets.only(right: 5.0),),
                    const Text('¿No tienes cuenta?',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    Container(width: 65,height: 1, color: Colors.white, margin: EdgeInsets.only(left: 5.0),),
                  ],
                ),
              
                Container(
                  width: MediaQuery.of(context).size.width, // ancho del botón
                  height: 55,
                  margin: EdgeInsets.only(left: 25, right: 25, top: 15), // margen a los lados
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'register');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    child: const Text(
                      'Regístrate',
                      style: TextStyle(color: Colors.white),
                    ),
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
