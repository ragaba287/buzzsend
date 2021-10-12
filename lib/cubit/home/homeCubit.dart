import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/home/homeStates.dart';
import '../../cubit/sign/signCubit.dart';
import '../../models/signUserModel.dart';
import '../../screens/home/feeds.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState());
  static HomeCubit get(context) => BlocProvider.of(context);

  SignUserModel? model;

  void getUserDate() {
    emit(HomeGetUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      model = SignUserModel.fromJson(value.data()!);
      print(model!.name);
      emit(HomeGetUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(HomeGetUserErrorState(error: error.toString()));
    });
  }

  int currentIndex = 0;

  List<Widget> screens = [
    Feeds(),
    Feeds(),
  ];

  void changeNavBottom(int index) {
    currentIndex = index;
    emit(HomeChangeBottomNavState());
  }
}
