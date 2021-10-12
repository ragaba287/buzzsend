import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/sign/signStates.dart';

String? uId = '';

class SignCubit extends Cubit<SignStates> {
  SignCubit() : super(SignInInit());

  static SignCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String name,
    required String email,
    required String password,
  }) {
    emit(SignUpLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((valueUser) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(valueUser.user!.uid)
          .set({
        'name': name,
        'email': email,
        'uid': valueUser.user!.uid,
      }).then((value) {
        emit(SignUpSuccessState(uId: valueUser.user!.uid));
      });
    }).catchError((error) {
      print(error.toString());
      emit(SignUpErorrState());
    });
  }

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(SignInLoadingState());

    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      emit(SignInSuccessState());
    }).catchError((error) {
      emit(SignInErorrState(error: error.toString()));
    });
  }
}
