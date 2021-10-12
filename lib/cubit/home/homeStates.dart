abstract class HomeStates {}

class HomeInitState extends HomeStates {}

class HomeGetUserSuccessState extends HomeStates {}

class HomeGetUserLoadingState extends HomeStates {}

class HomeGetUserErrorState extends HomeStates {
  HomeGetUserErrorState({this.error});
  final String? error;
}

class HomeChangeBottomNavState extends HomeStates {}
