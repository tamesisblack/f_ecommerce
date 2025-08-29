import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity, // ocupa todo el ancho
        // color: Colors.amber,    // ✅ ahora sí pinta el fondo
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // centra los hijos en el eje vertical
          crossAxisAlignment: CrossAxisAlignment.center, // centra los hijos en el eje horizontal
          children: [
            const Icon(
              Icons.person,
              size: 125,
              color: Colors.black,
            ),
            const SizedBox(height: 20), // espacio entre icono y texto
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20), // espacio entre texto y botón
           ElevatedButton(
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

          const SizedBox(height: 10), // espacio entre los botones y el texto

          const Text('¿No tienes cuenta?'),

          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
            ),
            child: const Text(
              'Regístrate',
              style: TextStyle(color: Colors.white),
            ),
          ),
          ],
        ),
      ),
    );
  }
}
