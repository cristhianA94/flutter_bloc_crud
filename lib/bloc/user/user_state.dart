// Manejara solo el estado del bloc
part of 'user_bloc.dart';

@immutable
abstract class UserState {
  final bool existUser;
  final User? user;

  const UserState({
    this.existUser = false,
    this.user,
  });
}

// Siempre extiende del UserState
class UserInitialState extends UserState {
  // Inicializa los datos en el primer evento
  const UserInitialState() : super(existUser: false, user: null);
}

// Actualiza un nuevo usuario
class UserSetState extends UserState {
  final User newUser;

  const UserSetState(this.newUser) : super(existUser: true, user: newUser);
}
