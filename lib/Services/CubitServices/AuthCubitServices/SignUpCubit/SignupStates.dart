
abstract class SignupStates {}

class IntialState extends SignupStates{}

class ChangeVisiblity extends SignupStates{}

class SignupSuccessState extends SignupStates{}

class SignupFailedState extends SignupStates{
  final String error;
  SignupFailedState(this.error);
}

class CreateUserSuccessState extends SignupStates{
  String uId;
  CreateUserSuccessState(this.uId);
}

class CreateUserFailedState extends SignupStates{
  final String error;
 CreateUserFailedState(this.error);
}

class VerifyFailed extends SignupStates{
  String error;
  VerifyFailed(this.error);
}

class SignupLoadingState extends SignupStates{}

