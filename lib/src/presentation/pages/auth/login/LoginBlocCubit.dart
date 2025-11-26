import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'LoginState.dart';
class LoginBlocCubit  extends Cubit<LoginState> {
  LoginBlocCubit() : super(LoginInitial());
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
}