import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Repo/Repositories.dart';
import 'app_events.dart';
import 'appstates.dart';

class UserBloc extends Bloc<UserEvent, UserState> {

  UserBloc(this._repositories) : super(UserLoadingState()) {
    on<LoadUserEvvent>((event, emit) async {
      emit(UserLoadingState());
      print("UserLoading state");

      try{
        final Users=await _repositories.GetUsers();
        print(Users.runtimeType);
        emit(UserLoadedState(Users));

      }catch(x){

        emit(ErrorState(x.toString()));


        print(x);}
     // await Future.delayed(Duration(seconds: 2)).then((value) => emit(UserLoadedState()));

    });
  }

  final Repositories _repositories;
}
