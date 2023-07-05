import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:designapp/Shared/CacheHelper.dart';
import 'package:designapp/Shared/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Shared/Components.dart';
import '../../../../Shared/Style.dart';
import 'LoginStates.dart';

class LoginCubit extends Cubit<LoginStates>{

  LoginCubit():super(IntialState());

  static LoginCubit createLoginObject(context) => BlocProvider.of(context);

  TextEditingController numberCodeController=TextEditingController();

  var codeFormkey=GlobalKey<FormState>();

  void loginAccount(
          {
            required String number,
            context
          }
      ){
        emit(LoginLoadingState());

        FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: '+218$number',
          verificationCompleted: (PhoneAuthCredential credential) {
            emit(LoginVerifySuccessState());
          },
          verificationFailed: (FirebaseAuthException e) {
             emit(LoginVerifyFailedState(e.toString()));
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
                                  condition: state is! LoginLoadingState ,
                                  builder: (context){
                                    return DefaultButton(
                                        Function: () async {
                                          if(codeFormkey.currentState!.validate())
                                          {
                                           var  uIdCurrent = null;
                                           print(uIdCurrent);
                                            FirebaseAuth.instance.signInWithCredential(
                                                PhoneAuthProvider.credential(
                                                    verificationId: verificationId,
                                                    smsCode: numberCodeController.text
                                                )
                                            ).then(
                                                    (value)  =>{

                                                    FirebaseFirestore.instance
                                                        .collection('users')
                                                        .limit(1)
                                                        .get()
                                                        .then(
                                                            (checkSnapshot) {
                                                                    if (checkSnapshot.size == 0) {
                                                                            value.user!.delete();
                                                                            Navigator.pop(context);
                                                                            showFailedToast("رجاء أنشاء حساب قبل تسجيل الدخول", context);
                                                                    }

                                                    }
                                                    ).then(
                                                            (object) async {
                                                                /*FirebaseFirestore.instance.collection('users').snapshots().listen(
                                                                (event) {
                                                                  event.docs.forEach((element) {


                                                                    if(element.id == FirebaseAuth.instance.currentUser!.uid)
                                                                    {
                                                                      emit(LoginSuccessState(FirebaseAuth.instance.currentUser!.uid));
                                                                      print("done");
                                                                    }
                                                                    if(element.id != FirebaseAuth.instance.currentUser!.uid)
                                                                    {
                                                                      FirebaseAuth.instance.currentUser!.delete();
                                                                      Navigator.pop(context);
                                                                      showFailedToast("رجاء أنشاء حساب قبل تسجيل الدخول", context);
                                                                    }



                                                                  });
                                                                });*/
                                                             var usercollection= FirebaseFirestore.instance.collection('users');
                                                             QuerySnapshot userdata= await usercollection.get();
                                                             var userdoc= userdata.docs;

                                                             for (var element in userdoc) {

                                                               print( element.get('uId'));

                                                               print(value.user!.phoneNumber);
                                                               //if( element.get('uId').toString().contains(value.user!.uid))
                                                               if( element.get('uId').toString().contains(value.user!.uid.toString()))
                                                               {
                                                                 print(element.get('uId')+" uid from element");
                                                                 CacheHelper.destroy();
                                                                 CacheHelper.saveData(key: "name", value: element.get('name'));
                                                                 CacheHelper.saveData(key: "phone",value: element.get('phone'));
                                                                 CacheHelper.saveData(key: "desc",value: element.get('desc'));
                                                                 CacheHelper.saveData(key: "email",value: element.get('email'));
                                                                 CacheHelper.saveData(key: "uId", value: element.get('uId'));
                                                                 uId = element.get('uId');
                                                                 print( CacheHelper.getData(key: "desc")+"  111 first");
                                                                 emit(LoginSuccessState(element.get('uId').toString(), CacheHelper.getData(key: "desc")));
                                                                 break;

                                                               }
                                                               // else if( element.get('phone') != value.user!.phoneNumber)
                                                               //         {
                                                               //           //FirebaseAuth.instance.currentUser!.delete();
                                                               //           Navigator.pop(context);
                                                               //           showFailedToast("رجاء أنشاء حساب قبل تسجيل الدخول", context);
                                                               //           break;
                                                               //         }
                                                            }
                                                            }
                                                    )


                                                }

                                            ).catchError(
                                                    (error){
                                                      emit(LoginVerifyFailedState(error.toString()));
                                                    }
                                            );
                                          }
                                        },
                                        ButtonText: "ارسل الرمز"
                                    );
                                  },
                                  fallback:(context){
                                    return Center(
                                      child: CircularProgressIndicator(
                                        color: AppColors.CustomGreen,
                                      ),
                                    );
                                  },
                                ),
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
                  emit(LoginVerifySuccessState());
                }
        )
            .catchError(
                (error){
               emit(LoginVerifyFailedState(error.toString()));
        }
        );

  }

        bool isVisible = true;

        void changeVisiblity(value){
          isVisible=!value;
          emit(ChangeVisiblity());
        }

}
