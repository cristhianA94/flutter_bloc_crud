import 'package:flutter_bloc8_fernando/models/user.dart';
// Paquete mas liviano que material/material.dart
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  // Inicializa el estado inicial
  UserBloc() : super(const UserInitialState()) {
    on<ActivateUserEvent>((event, emit)
        // TODO 3.Emite el evento deseado.
        =>
        emit(UserSetState(event.user)));

    on<DeleteUserEvent>((event, emit) => emit(const UserInitialState()));

    // Valida si existe un usario
    on<ChangeUserAgeEvent>((event, emit) {
      if (!state.existUser) return;
      // Esto emite un int, toca convertirlo en User
      // TODO 6. No es bueno mutar un estado, por ello se hace una copia del objeto
      emit(UserSetState(state.user!.copyWith(edad: event.age)));
    });

    on<ChangeUserProfessionEvent>((event, emit) {
      if (!state.existUser) return;

      final List<String> professions = [
        ...state.user!.profesiones,
        event.professions
      ];

      emit(UserSetState(state.user!.copyWith(profesiones: professions)));
    });
  }
}
