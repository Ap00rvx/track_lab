import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tracklab/src/resources/authentication/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async{
      emit(AuthLoading()); 
      final res = await AuthRepository().login(event.email, event.password);
      if (res['error'] == true) {
        emit(AuthFailure(res['message']));
      } else {
        emit(AuthSuccess(res));
      }
    });
  }
}
