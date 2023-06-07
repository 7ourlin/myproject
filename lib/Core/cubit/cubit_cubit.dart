import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cubit_state.dart';

class AuthflowCubit extends Cubit<AuthflowState> {
  AuthflowCubit()
      : super(
          const AuthflowState(status: Status.intial),
        ) {
    authcheck();
  }

  authcheck() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        emit(const AuthflowState(status: Status.logout));
      } else {
        emit(const AuthflowState(status: Status.loggedin));
      }
    });
  }
}
