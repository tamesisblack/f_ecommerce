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
    _emailController.sink.add(email);
  }
  void changePassword(String password) {
    _passwordController.sink.add(password);
  }
  void login(){
    print("Email: ${_emailController.value}, Password: ${_passwordController.value}");
  }
}