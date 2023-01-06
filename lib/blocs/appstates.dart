import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../Models/UserModel.dart';


@immutable
abstract class UserState extends Equatable {}

//Data Loading State
class UserLoadingState  extends UserState{

  @override
  // TODO: implement props
  List<Object?> get props => [];
}



//Data loaded State
class UserLoadedState  extends UserState{
  @override
  UserLoadedState(this.Users);
  final List<Datum> Users;
  // TODO: implement props
  List<Object?> get props => [Users];

}

//Data Error loading State
class ErrorState extends UserState{
  ErrorState(this.Error);
  String Error;
  @override
  // TODO: implement props
  List<Object?> get props => [];

}