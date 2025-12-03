import 'package:flutter/material.dart';
class DefaultTextfield extends StatelessWidget {
  String label;
  String? errorText;
  IconData icon;
  Function(String text) onChanged;
  bool obscureText;

  DefaultTextfield({
    super.key, // Convertir a super parámetro
    required this.label,
    required this.icon, 
    required this.onChanged,
    this.errorText,
    this.obscureText = false,
  }); // Remover : super(key: key)

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      onChanged: (String text) {
        onChanged(text);
      },
      decoration: InputDecoration(
        label: Text(label, style: TextStyle(color: Colors.white),),
        enabledBorder: UnderlineInputBorder( // borde cuando no está enfocado
          borderSide: BorderSide(color: Colors.white),
        ),
        errorText: errorText,
        focusedBorder: UnderlineInputBorder( // borde cuando está enfocado
          borderSide: BorderSide(color: Colors.white),
        ),
        prefixIcon: Icon(icon, color: Colors.white,),
      ),
      style: TextStyle(color: Colors.white),
    );
  }
}