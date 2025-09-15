import 'package:f_ecommerce/src/presentation/widgets/DefaultButton.dart';
import 'package:f_ecommerce/src/presentation/widgets/DefaultIconBack.dart';
import 'package:f_ecommerce/src/presentation/widgets/DefaultTextfield.dart';
import 'package:flutter/material.dart';
class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                      child: DefaultTextfield(label: 'Nombre', icon: Icons.person, onChanged: (value) {})
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 25, right: 25), // espacio entre el texto y el TextField
                      child: DefaultTextfield(label: 'Apellido', icon: Icons.person, onChanged: (value) {})
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 25, right: 25), // espacio entre el texto y el TextField   
                      child: DefaultTextfield(label: 'Email', icon: Icons.email, onChanged: (value) {})
                    ),
                      Container(
                      margin: EdgeInsets.only(top: 20, left: 25, right: 25), // espacio entre el texto y el TextField
                      child: DefaultTextfield(label: 'Telefono', icon: Icons.phone, onChanged: (value) {})
                    ),
                    
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 25, right: 25), // espacio entre el texto y el TextField
                      child: DefaultTextfield(label: 'Contraseña', icon: Icons.lock, onChanged: (value) {}, obscureText: true,)
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 25, right: 25), // espacio entre el texto y el TextField
                      child: DefaultTextfield(label: 'Confirmar Contraseña', icon: Icons.lock_outline, onChanged: (value) {}, obscureText: true,)
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 25, right: 25), // espacio entre el texto y el botón
                      child: Defaultbutton(text: 'REGISTRARSE', onPressed: () {
                        // Acción a realizar al presionar el botón
                      }, color: Colors.black,),
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