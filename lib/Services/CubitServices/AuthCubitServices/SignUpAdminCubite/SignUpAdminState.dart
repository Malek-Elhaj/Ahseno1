
abstract class SignupAdminStates {}

class IntialState extends SignupAdminStates{}

class ChangeVisiblity extends SignupAdminStates{}

class SignupSuccessState extends SignupAdminStates{}

class SignupFailedState extends SignupAdminStates{
  final String error;
  SignupFailedState(this.error);
}

class CreateUserSuccessState extends SignupAdminStates{
  String uId;
  CreateUserSuccessState(this.uId);
}

class CreateUserFailedState extends SignupAdminStates{
  final String error;
  CreateUserFailedState(this.error);
}

class VerifyFailed extends SignupAdminStates{
  String error;
  VerifyFailed(this.error);
}

class SignupLoadingState extends SignupAdminStates{}

