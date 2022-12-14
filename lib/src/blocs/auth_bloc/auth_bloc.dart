import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kaser/src/repository/repo_auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo _authRepo;
  AuthBloc(this._authRepo) : super(AuthLoading()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      final result = await _authRepo.login(event.email, event.password);
      if (result['meta']['code'] == 200) {
        emit(AuthSuccessful(result['meta']['message'].toString()));
      } else {
        emit(AuthError(result['meta']['message'].toString()));
      }
    });
  }
}
