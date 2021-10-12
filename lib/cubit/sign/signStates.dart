abstract class SignStates {}

class SignInInit extends SignStates {}

class SignInSuccessState extends SignStates {}

class SignInLoadingState extends SignStates {}

class SignInErorrState extends SignStates {
  final String? error;
  SignInErorrState({this.error});
}

class SignUpSuccessState extends SignStates {
  final String? uId;
  SignUpSuccessState({this.uId});
}

class SignUpLoadingState extends SignStates {}

class SignUpErorrState extends SignStates {}
