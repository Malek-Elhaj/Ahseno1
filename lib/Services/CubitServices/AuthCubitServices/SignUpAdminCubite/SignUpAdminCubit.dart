import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Shared/Components.dart';
import '../../../../Shared/Style.dart';
import '../../../models/AdminModel/adminModel.dart';
import 'SignUpAdminState.dart';

class SignupAdminCubit extends Cubit<SignupAdminStates>{

  SignupAdminCubit():super(IntialState());

  static SignupAdminCubit createSignupObject(context) => BlocProvider.of(context);

  TextEditingController numberCodeController=TextEditingController();

  var codeFormkey=GlobalKey<FormState>();

  void registerAccount(
      {
        required String name,
        required String email,
        required String number,
        required String desc,
        context
      }
      ){
    emit(SignupLoadingState());

    //you can add a function to see if there are a use with the same number

    FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+218$number',
      verificationCompleted: (PhoneAuthCredential credential) {

      },
      verificationFailed: (FirebaseAuthException e) {
        emit(VerifyFailed(e.toString()));
      },
      codeSent: (String verificationId, int? resendToken) {

        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16))
            ),
            builder: (context){
              return  Directionality(
                textDirection: TextDirection.rtl,
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: codeFormkey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "التحقق برمز",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: AppColors.CustomGrey
                                ),
                              ),
                            ),
                            DefaultTextField(
                                label: "رمز التحقق",
                                textcontroller: numberCodeController,
                                function: (value)
                                {
                                  if(value!.isEmpty)
                                  {
                                    return "رجاء إدخال رمز التحقق";
                                  }
                                  return null;
                                }
                            ),
                            ConditionalBuilder(
                              condition: state is! SignupLoadingState,
                              builder: (BuildContext context) { return DefaultButton(
                                  Function: () async {
                                    if(codeFormkey.currentState!.validate())
                                    {
                                      FirebaseAuth.instance.signInWithCredential(PhoneAuthProvider.credential(
                                          verificationId: verificationId,
                                          smsCode: numberCodeController.text
                                      )).then(
                                              (value) => {
                                            createUser(
                                                name: name,
                                                email: email,
                                                number: number,
                                                desc : desc,
                                                uId: value.user!.uid
                                            ),
                                            emit(CreateUserSuccessState(value.user!.uid))
                                          }
                                      ).catchError(
                                              (error)=> {
                                            emit(VerifyFailed(error.toString()))
                                          }
                                      );
                                    }
                                  },
                                  ButtonText: "ارسل الرمز"
                              ); },
                              fallback: (BuildContext context) {
                                return  Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.CustomGreen,
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
        );

      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    )
        .then(
            (value) {
          emit(SignupSuccessState());
        }
    ).catchError((error){
      emit(SignupFailedState(error));
    });

  }


  void createUser({
    required String name,
    required String email,
    required String number,
    required String uId,
    required String desc,

  }){
    emit(SignupLoadingState());

    AdminModel admin = AdminModel(
        name,
        email,
        number,
        uId,
        desc
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(admin.toMap()).then(
            (value) => {
          emit(CreateUserSuccessState(uId)),
        }
    ).catchError(
            (error)=> emit(CreateUserFailedState(error))
    );
  }




  bool isVisible = true;

  void changeVisiblity(value){
    isVisible=!value;
    emit(ChangeVisiblity());
  }

}
