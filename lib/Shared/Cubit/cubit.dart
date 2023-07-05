
import 'package:bloc/bloc.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:designapp/Modules/AccountScreens/accountScreen.dart';
import 'package:designapp/Modules/MainScreen/mainScreen.dart';
import 'package:designapp/Modules/ServicesScreens/servicesScreen.dart';
import 'package:designapp/Modules/sectionsScreens/sectionsScreen.dart';
import 'package:designapp/Services/models/UserModel/UserModel.dart';
import 'package:designapp/Shared/Cubit/state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../CacheHelper.dart';
import '../constants.dart';


class Cubit_Class extends Cubit<State_Class> {


  Cubit_Class() :super(IntialState());
  static Cubit_Class get(context) => BlocProvider.of(context);
  int currentScreen =0;


  List<Widget> screens=[
      MainScreen(),
      SectionsScreen(),
      Container(),
      ServicesScreen(),
      AccountScreen()
  ];

  List<BottomNavyBarItem> bottomNavItems=[
              BottomNavyBarItem(
                 icon: const Icon(Icons.home_rounded),
                 title: const Text("الرئيسية"),
                 inactiveColor: HexColor("##707070"),
                 activeColor: HexColor("#45C4B0")
             ),
              BottomNavyBarItem(
                  icon: const Icon(Icons.apps),
                  title: const Text("خدمات التبرع"),
                  inactiveColor: HexColor("##707070"),
                  activeColor: HexColor("#45C4B0")
              ),
              BottomNavyBarItem(
                  icon: Icon(Icons.payments_outlined),
                  title: Text("تبرع السريع"),
                  inactiveColor: HexColor("#13678A"),
                  activeColor: HexColor("#13678A"),

              ),
              BottomNavyBarItem(
                  icon: const Icon(Icons.design_services),
                  title: const Text("الخدمات"),
                  inactiveColor: HexColor("##707070"),
                  activeColor: HexColor("#45C4B0")
              ),
              BottomNavyBarItem(
                  icon: const Icon(Icons.account_circle_outlined),
                  title: const Text("حسابي"),
                  inactiveColor: HexColor("##707070"),
                  activeColor: HexColor("#45C4B0")
              ),

  ];

  void changeScreen(value){
    if(value == 4)
      {
          getUserData();
      }
    currentScreen=value;
    emit(ChangeScreenState());
  }

  bool isclicked=false;

  var Boxcolor=HexColor("#ffffff");

  String PressedPayment(String k){
    if(k=="Paymentcontanier1")
      {
        isclicked=true;
        Boxcolor=HexColor("#45C4B0");
        emit(PaymentDone());
        return "50";
      }else if(k=="Paymentcontanier2")
           {
          isclicked=true;
          Boxcolor=HexColor("#45C4B0");
          emit(PaymentDone());
          return "100";
        }
              else if(k =="Paymentcontanier3"){
                isclicked=true;
                Boxcolor=HexColor("#45C4B0");
                emit(PaymentDone());
                return "200";
              }
         return " ";
  }

  bool isVisible = true;
  
  void changeVisiblity(value){
    isVisible=!value;
    emit(ChangeVisiblity());
  }

  UserModel user =UserModel(CacheHelper.getData(key: "name"), CacheHelper.getData(key: "email"), CacheHelper.getData(key: "phone"), CacheHelper.getData(key: "uId"),CacheHelper.getData(key: "desc"));

  Future<void> getUserData() async {

    uId = CacheHelper.getData(key: "uId");

    if(uId != null)
      {
        FirebaseFirestore.instance
            .collection('users')
            .doc(uId)
            .snapshots()
            .listen(
                (event) {
                  print(event.data());
              user = UserModel.fromJson(event.data());
              emit(DataSuccessState(user));
            }
        );
        // CacheHelper.saveData(key: "name", value: user.name);
        // CacheHelper.saveData(key: "phone", value: user.phone);
        // CacheHelper.saveData(key: "desc", value: user.desc);
        // CacheHelper.saveData(key: "email", value: user.email);
        // CacheHelper.saveData(key: "uId", value: user.uId);
      }


     /* FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .get()
          .then(
              //Document SnapShot
              (value) {
                user=UserModel.fromJson(value.data());
                print(user.name);
                emit(DataSuccessState());
              }
      ).catchError((error){
          print(error);
          emit(DataFaliedState(error.toString()));
      });*/

  }

  void updateUserData(String name,String email,String phone,String desc){

    user=UserModel(name, email, phone, uId,desc);
    emit(UpdateDataLoadingState());
    FirebaseFirestore.instance.
    collection('users')
        .doc(user.uId)
        .update(user.toMap())
        .then(
            (value) {
              getUserData();
            }
    ).catchError((error){
      emit(UpdateDataFaliedState(error.toString()));
    });
  }

  void deleteUser(){

  }
  void signOut()async{
      {
        // CacheHelper.saveData(key: "name", value: null);
        // CacheHelper.saveData(key: "phone", value: null);
        // CacheHelper.saveData(key: "desc", value: null);
        // CacheHelper.saveData(key: "email", value: null);
        // CacheHelper.saveData(key: "uId", value: null);
        CacheHelper.destroy();
        uId = null;
        // FirebaseAuth.instance.signOut().then(
        //         (value) {
        //            uId=null;
        //
        //            emit(SignoutAccountSuccessState());
        //     }
        // ).catchError((error){
        //
        // });
      }

  }

}