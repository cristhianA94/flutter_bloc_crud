part of 'user_bloc.dart';

// Metodos que espera el bloc
@immutable
abstract class UserEvent {}

class ActivateUserEvent extends UserEvent {
  final User user;
  ActivateUserEvent(this.user);
}

class ChangeUserAgeEvent extends UserEvent {
  final int age;
  ChangeUserAgeEvent(this.age);
}

class ChangeUserProfessionEvent extends UserEvent {
  final String professions;
  ChangeUserProfessionEvent(this.professions);
}

class DeleteUserEvent extends UserEvent {}
