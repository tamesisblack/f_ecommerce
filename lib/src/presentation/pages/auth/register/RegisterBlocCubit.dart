import 'package:f_ecommerce/src/presentation/pages/auth/register/RegisterBlocState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class RegisterBlocCubit extends Cubit<RegisterBlocState> {
  RegisterBlocCubit() : super(RegisterInitialState());

  final _nameController = BehaviorSubject<String>();
  final _lastnameController = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();
  final _phoneController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _confirmPasswordController = BehaviorSubject<String>();

  Stream<String> get nameStream => _nameController.stream;
  Stream<String> get lastnameStream => _lastnameController.stream;
  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get phoneStream => _phoneController.stream;
  Stream<String> get passwordStream => _passwordController.stream;
  Stream<String> get confirmPasswordStream => _confirmPasswordController.stream;

  Stream<bool> get isFormValidStream => Rx.combineLatest6(
    nameStream,
    lastnameStream,
    emailStream,
    phoneStream,
    passwordStream,
    confirmPasswordStream,
    (a, b, c, d, e, f) => true,
  );

  void register(){
    print("Nombre: ${_nameController.value}");
    print("Apellido: ${_lastnameController.value}");
    print("Email: ${_emailController.value}");
    print("Teléfono: ${_phoneController.value}");
    print("Contraseña: ${_passwordController.value}");
    print("Confirmar Contraseña: ${_confirmPasswordController.value}");
  }

  void changeName(String value) {
    if(value.isNotEmpty && value.length <= 2) {
      _nameController.sink.addError("El nombre debe tener al menos 2 caracteres");
      print("Error en name");
    }else{
      _nameController.sink.add(value);
    }
  }

  void changeLastname(String value) {
      if(value.isNotEmpty && value.length <= 2) {
        _lastnameController.sink.addError("El apellido debe tener al menos 2 caracteres");
        print("Error en lastname");
    }else {
      _lastnameController.sink.add(value);
    }
  }

  void changeEmail(String value) {
    final bool emailFormatValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
    if(value.isNotEmpty && value.length <= 5) {
      _emailController.sink.addError("El email debe tener al menos 5 caracteres");
      print("Error en email");
    }
    else if(value.isNotEmpty && !emailFormatValid) {
      _emailController.sink.addError("El formato del email es incorrecto");
      print("Error en email formato");
    }else{
      _emailController.sink.add(value);
    }
  }

  void changePhone(String value) {
    if(value.isNotEmpty && value.length <= 8) {
      _phoneController.sink.addError("El teléfono debe tener al menos 8 caracteres");
      print("Error en phone");
    }else{
      _phoneController.sink.add(value);
    }
  }

  void changePassword(String value) {
    if(value.isNotEmpty && value.length <= 6) {
      _passwordController.sink.addError("La contraseña debe tener al menos 6 caracteres");
      print("Error en password");    
    }else{
      _passwordController.sink.add(value);
    }
  }

  void changeConfirmPassword(String value) {
    if(value.isNotEmpty && value.length <= 6) {
      _confirmPasswordController.sink.addError("La confirmación de la contraseña debe tener al menos 6 caracteres");
      print("Error en confirmPassword");
    }
    else if(value != _passwordController.value) {
      _confirmPasswordController.sink.addError("Las contraseñas no coinciden");
      print("Error en confirmPassword no coinciden");
    }
    else{
      _confirmPasswordController.sink.add(value);
    }
  }
  void dispose() {
    changeName("");
    changeLastname("");
    changeEmail("");
    changePhone("");
    changePassword("");
    changeConfirmPassword("");
  }
}