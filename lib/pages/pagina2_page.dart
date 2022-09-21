import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc8_fernando/bloc/user/user_bloc.dart';
import 'package:flutter_bloc8_fernando/models/user.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 2'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            color: Colors.blue,
            onPressed: () {
              final User newUser = User(
                  nombre: 'Cristhian',
                  edad: 28,
                  profesiones: ['Flutter Developer']);

              // TODO 2. Crea instancia del Bloc y emite un evento
              userBloc.add(ActivateUserEvent(newUser));
            },
            child: const Text('Establecer Usuario',
                style: TextStyle(color: Colors.white)),
          ),
          MaterialButton(
            color: Colors.blue,
            onPressed: () {
              userBloc.add(ChangeUserAgeEvent(30));
            },
            child: const Text('Cambiar Edad',
                style: TextStyle(color: Colors.white)),
          ),
          MaterialButton(
            color: Colors.blue,
            onPressed: () {
              String professions = 'Mobile Developer';
              userBloc.add(ChangeUserProfessionEvent(professions));
            },
            child: const Text('Añadir Profesion',
                style: TextStyle(color: Colors.white)),
          ),
        ],
      )),
    );
  }
}
