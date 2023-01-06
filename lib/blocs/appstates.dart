import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';


@immutable
abstract class UserState extends Equatable {}

//Data Loading State
class UserLoadingState  extends UserState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserLoadedState  extends UserState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

//Data loaded State


//Data Error loading State