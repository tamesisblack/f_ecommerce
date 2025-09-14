import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                    child: TextField(
                      decoration: InputDecoration(
                        label: Text('Correo electrónico', style: TextStyle(color: Colors.white),),
                        enabledBorder: UnderlineInputBorder( // borde cuando no está enfocado
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder( // borde cuando está enfocado
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        prefixIcon: Icon(Icons.email, color: Colors.white,),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25), // espacio entre los dos TextField
                    child: TextField(
                      decoration: InputDecoration(
                        label: Text('Contraseña', style: TextStyle(color: Colors.white),),
                        enabledBorder: UnderlineInputBorder( // borde cuando no está enfocado
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder( // borde cuando está enfocado
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        prefixIcon: Icon(Icons.lock, color: Colors.white,),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20), // espacio entre texto y botón
                 Container(
                    width: MediaQuery.of(context).size.width, // ancho del botón
                    height: 55,
                    margin: EdgeInsets.only(left: 25, right: 25, top: 25, bottom: 15),// margen a los lados
                    child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text(
                      'Iniciar sesión',
                      style: TextStyle(
                        color: Colors.white, // 👈 en lugar de backgroundColor dentro del texto
                      ),
                    ),
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
                    onPressed: () {},
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
