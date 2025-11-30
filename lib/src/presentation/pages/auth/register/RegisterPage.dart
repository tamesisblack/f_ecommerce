import 'package:f_ecommerce/src/presentation/pages/auth/register/RegisterBlocCubit.dart';
import 'package:f_ecommerce/src/presentation/widgets/DefaultButton.dart';
import 'package:f_ecommerce/src/presentation/widgets/DefaultIconBack.dart';
import 'package:f_ecommerce/src/presentation/widgets/DefaultTextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterBlocCubit? registerBlocCubit;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      registerBlocCubit?.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    registerBlocCubit = BlocProvider.of<RegisterBlocCubit>(context,listen:false);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [ 
            Image.asset('assets/img/background3.jpg', fit: BoxFit.cover, height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width,color: Color.fromRGBO(0, 0, 0, 0.7),colorBlendMode: BlendMode.darken,),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.75,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.3),
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person, color: Colors.white, size: 100,),
                    Text('REGISTRO',
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 25, right: 25), // espacio entre el texto y el TextField
                      child: StreamBuilder(
                        stream: registerBlocCubit?.nameStream,
                        builder: (context, asyncSnapshot) {
                          return DefaultTextfield(label: 'Nombre', icon: Icons.person, onChanged: (value) {
                            registerBlocCubit?.changeName(value);
                          });
                        }
                      )
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 25, right: 25), // espacio entre el texto y el TextField
                      child: StreamBuilder(
                        stream: registerBlocCubit?.lastnameStream,
                        builder: (context, asyncSnapshot) {
                          return DefaultTextfield(label: 'Apellido', icon: Icons.person, onChanged: (value) {
                            registerBlocCubit?.changeLastname(value);
                          });
                        }
                      )
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 25, right: 25), // espacio entre el texto y el TextField   
                      child: StreamBuilder(
                        stream: registerBlocCubit?.emailStream,
                        builder: (context, asyncSnapshot) {
                          return DefaultTextfield(label: 'Email', icon: Icons.email, onChanged: (value) {
                            registerBlocCubit?.changeEmail(value);
                          });
                        }
                      )
                    ),
                      Container(
                      margin: EdgeInsets.only(top: 20, left: 25, right: 25), // espacio entre el texto y el TextField
                      child: StreamBuilder(
                        stream:  registerBlocCubit?.phoneStream,
                        builder: (context, asyncSnapshot) {
                          return DefaultTextfield(label: 'Telefono', icon: Icons.phone, onChanged: (value) {
                            registerBlocCubit?.changePhone(value);
                          });
                        }
                      )
                    ),
                    
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 25, right: 25), // espacio entre el texto y el TextField
                      child: StreamBuilder(
                        stream: registerBlocCubit?.passwordStream,
                        builder: (context, asyncSnapshot) {
                          return DefaultTextfield(label: 'Contraseña', icon: Icons.lock, onChanged: (value) {
                            registerBlocCubit?.changePassword(value);
                          }, obscureText: true);
                        }
                      )
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 25, right: 25), // espacio entre el texto y el TextField
                      child: StreamBuilder(
                        stream:  registerBlocCubit?.confirmPasswordStream,
                        builder: (context, asyncSnapshot) {
                          return DefaultTextfield(label: 'Confirmar Contraseña', icon: Icons.lock_outline, onChanged: (value) {
                            registerBlocCubit?.changeConfirmPassword(value);
                          }, obscureText: true,);
                        }
                      )
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 25, right: 25), // espacio entre el texto y el botón
                      child: StreamBuilder(
                        stream: registerBlocCubit?.isFormValidStream,
                        builder: (context, asyncSnapshot) {
                          return Defaultbutton(text: 'REGISTRARSE', onPressed: () {
                            if(asyncSnapshot.hasData){
                              registerBlocCubit?.register();
                            }else{
                              //imprimir el error de cubit 
                              

                              Fluttertoast.showToast(
                                msg: "Por favor, complete el formulario correctamente",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0
                              );
                            }
                          }, color: Colors.black,);
                        }
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Defaulticonback(left: 45, top: 135,),
          ],
        ),
      ),
    );
  }
}