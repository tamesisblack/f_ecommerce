import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'LoginState.dart';
class LoginBlocCubit  extends Cubit<LoginState> {
  LoginBlocCubit() : super(LoginInitial());
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  // Getters to access the streams
  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get passwordStream => _passwordController.stream;

  void changeEmail(String email) {
    if(email.length < 3){
      _emailController.sink.addError("El correo debe tener al menos 3 caracteres");
      return;
    }else{
      _emailController.sink.add(email);
    }
  }
  void changePassword(String password) {
    if(password.length < 6){
      _passwordController.sink.addError("La contraseña debe tener al menos 6 caracteres");
      return;
    }else{
      _passwordController.sink.add(password);
    }
  }

  Stream<bool> get isFormValidStream => Rx.combineLatest2(emailStream, passwordStream, (a, b) => true);

  // limpiar los controladores cuando pasemos a otra pantalla
  void dispose() {
    changeEmail('');
    changePassword('');
  }

  void login(){
    print("Email: ${_emailController.value}, Password: ${_passwordController.value}");
  }
}