abstract class LoginStates {}

class IntialState extends LoginStates{}

class ChangeVisiblity extends LoginStates{}

class LoginSuccessState extends LoginStates{
      final String uId,desc;
      LoginSuccessState(this.uId,this.desc);
}

class LoginFailedState extends LoginStates{
  final String error;
  LoginFailedState(this.error);
}

class LoginVerifySuccessState extends LoginStates{}

class LoginVerifyFailedState extends LoginStates{
  final String error;
  LoginVerifyFailedState(this.error);
}

class LoginLoadingState extends LoginStates{}

