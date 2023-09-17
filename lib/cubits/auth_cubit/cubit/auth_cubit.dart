import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state.dart';

// String? userName;

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  String? userName;
  String? email_profile;
  Future<void> SignUpCubit(
      {required String name,
      required String email,
      required String password}) async {
    emit(RegisterLoading());
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      userName = name;
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFailure(errMessege: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailure(
            errMessege: 'The account already exists for that email.'));
      }
    } catch (e) {
      emit(RegisterFailure(errMessege: e.toString()));
    }
  }

  Future<void> LoginCubit(
      {required String email,
      required String password,
      required String name}) async {
    emit(LoginLoading());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      userName = name;
      email_profile = email;
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure(errMessege: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(
            LoginFailure(errMessege: 'Wrong password provided for that user.'));
      }
    } catch (e) {
      emit(LoginFailure(errMessege: e.toString()));
    }
  }
}
