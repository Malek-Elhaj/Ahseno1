import 'package:designapp/Modules/AuthFiles/signupScreen.dart';
import 'package:designapp/Services/CubitServices/AuthCubitServices/LoginCubit/LoginCubit.dart';
import 'package:designapp/Services/CubitServices/AuthCubitServices/LoginCubit/LoginStates.dart';
import 'package:designapp/Shared/CacheHelper.dart';
import 'package:designapp/Shared/Components.dart';
import 'package:designapp/Shared/Style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_divider/text_divider.dart';

import '../../Layout/layoutScreen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var numberController = TextEditingController();

    GlobalKey<FormState> formkey = GlobalKey<FormState>();

    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginVerifyFailedState) {
            Navigator.pop(context);
            if (state.error.toString().contains(
                "The sms verification code used to create the phone auth credential is invalid. ")) {
              showFailedToast(
                  "رجاء التاكد من رمز التحقق الذي تم ادخاله", context);
            } else if (state.error.toString().contains(
                "SMS verification code request failed: unknown status code: 17052 Exceeded quota.")) {
              showFailedToast(
                  "هناك مشكلة الرجاء تحقق من قوة اتصالك بالانترنتً", context);
            } else {
              showFailedToast("هناك مشكلة الرجاء المحاولة لاحقاً", context);
            }
          }
          if (state is LoginSuccessState) {
            CacheHelper.saveData(key: "uId", value: state.uId);
            NavgateNoGoBack(context: context, page: const LayoutScreen());
            showSuccessToast("تم تسجيل الدخول بنجاح", context);
          }
        },
        builder: (context, state) {
          LoginCubit loginCubit = LoginCubit.createLoginObject(context);

          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              body: SingleChildScrollView(
                child: SafeArea(
                  child: SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Form(
                          key: formkey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 100,
                              ),
                              const CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.transparent,
                                backgroundImage: AssetImage(
                                    "Assets/images/wellness-logo.png"),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "تسجيل الدخول",
                                style: GoogleFonts.cairo(
                                    fontSize: 25, color: AppColors.CustomBlue),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              DefaultTextField(
                                label: "رقم الهاتف",
                                textcontroller: numberController,
                                function: (value) {
                                  RegExp regex = RegExp(r'^(?=.*?\d).{10,13}$');
                                  if (value!.isEmpty) {
                                    return "رجاء إدخال رقم الهاتف";
                                  } else {
                                    if (!regex.hasMatch(value)) {
                                      return "رجاء تاكد من رقم الهاتف";
                                    }
                                    if (!(value.startsWith("092") ||
                                        value.startsWith("091") ||
                                        value.startsWith("094"))) {
                                      return "رجاء ادخال رقم هاتف صحيح (092-091-094)";
                                    }
                                  }
                                  return null;
                                },
                                keyboardtype: TextInputType.number,
                                prefixicon: Icons.numbers,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              DefaultButton(
                                ButtonText: 'تسجيل الدخول',
                                Function: () {
                                  if (formkey.currentState!.validate()) {
                                    loginCubit.loginAccount(
                                        number: numberController.text,
                                        context: context);
                                    //  loginCubit.Sign();
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              TextDivider(
                                text: Text(
                                  "أو",
                                  style: GoogleFonts.cairo(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                color: AppColors.CustomGrey,
                                thickness: 1,
                                endIndent: 10,
                                indent: 10,
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                      padding: const EdgeInsets.only(right: 20),
                                      onPressed: () {
                                        NavgatetoPage(
                                            context: context,
                                            page: const SignUpScreen());
                                      },
                                      icon: Icon(
                                        Icons.account_circle_outlined,
                                        size: 25,
                                        color: AppColors.CustomGreen,
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        NavgatetoPage(
                                            context: context,
                                            page: const SignUpScreen());
                                      },
                                      child: Text(
                                        "أنشاء حساب",
                                        style: GoogleFonts.cairo(
                                            fontSize: 18,
                                            color: AppColors.CustomGreen),
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
