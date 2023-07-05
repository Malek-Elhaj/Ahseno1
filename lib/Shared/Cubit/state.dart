

import 'package:designapp/Services/models/UserModel/UserModel.dart';
import 'package:flutter/cupertino.dart';

abstract class State_Class {}

class IntialState extends State_Class{}

class ChangeScreenState extends State_Class{}

class PaymentDone extends State_Class{}

class ChangeVisiblity extends State_Class{}



//FireBase States

class DataSuccessState extends State_Class{
 final UserModel user;
 DataSuccessState(this.user);
}

class DataFaliedState extends State_Class{
  final String error;
  DataFaliedState(this.error);
}

class UpdateDataLoadingState extends State_Class{}

class UpdateDataSuccessState extends State_Class{}

class UpdateDataFaliedState extends State_Class{
  final String error;
  UpdateDataFaliedState(this.error);
}

class SignoutAccountLoadingState extends State_Class{}

class SignoutAccountSuccessState extends State_Class{}

class SignoutAccountFaliedState extends State_Class{
  final String error;
  SignoutAccountFaliedState(this.error);
}

