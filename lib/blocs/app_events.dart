import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:untitled/blocs/appstates.dart';



@immutable
abstract class UserEvent extends Equatable{
 const UserEvent();
}

class LoadUserEvvent extends UserEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}