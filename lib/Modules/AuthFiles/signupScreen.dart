// ignore_for_file: file_names
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:designapp/Modules/AuthFiles/Login_Design.dart';
import 'package:designapp/Services/CubitServices/AuthCubitServices/SignUpCubit/SignUpCubit.dart';
import 'package:designapp/Services/CubitServices/AuthCubitServices/SignUpCubit/SignupStates.dart';
import 'package:designapp/Shared/Components.dart';
import 'package:designapp/Shared/Style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../Shared/CacheHelper.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var formkey=GlobalKey<FormState>();

    bool checkbox=false;


    TextEditingController numberController=TextEditingController();

    TextEditingController nameController=TextEditingController();

    TextEditingController emailController=TextEditingController();


    return BlocProvider(
      create: (context) => SignupCubit(),
      child: BlocConsumer<SignupCubit,SignupStates>(
        listener: (context,state){

            if(state is SignupFailedState)
              {
                if(state.error.contains("We have blocked all requests from this device due to unusual activity. Try again later.")) {
                  showFailedToast("لا يمكن أنشاء حساب الان الرجاء المحاولة بعد وقت.", context);
                }
                showFailedToast(state.error, context);
              }

            if(state is VerifyFailed)
              {
                //SMS verification code request failed: unknown status code: 17020 null
                if(state.error.contains("The sms verification code used to create the phone auth credential is invalid."))
                  {
                    Navigator.pop(context);
                    showFailedToast("رجاء التاكد من رمز التحقق الذي تم ادخاله", context);
                  }
                print(state.error.toString());
                showFailedToast("هناك مشكلة الرجاء المحاولة لاحقاً", context);

              }

            if(state is CreateUserSuccessState)
              {
                CacheHelper.saveData(
                    key: "uId",
                    value: state.uId //state.uId
                );
                Navigator.pop(context);
                showSuccessToast("تم أنشاء الحساب بنجاح", context);
              }

            if(state is CreateUserFailedState)
              {
                Navigator.pop(context);
                showFailedToast("حدث خطا اثناء أنشاء الحساب", context);
              }
        },
        builder: (context,state){

          SignupCubit cubit= SignupCubit.createSignupObject(context);

          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
             
              body:  SafeArea(
                child: SingleChildScrollView(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Form(
                      key: formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:  [
                          //The Logo of App
                          const SizedBox(height: 50,),
                          const CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.transparent,
                            backgroundImage: AssetImage("Assets/images/wellness-logo.png"),
                          ),
                          const SizedBox(
                            height: 10,
                          ),


                          Text(
                              "أنشاء حساب",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: AppColors.CustomBlue
                              )

                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          //Form Of Creating A Account
                          DefaultTextField(
                              label: "الأسم",
                              textcontroller: nameController,
                              function: (value){
                                RegExp regex =  RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%\d-]');
                                if(value!.isEmpty)
                                {
                                  return "تأكد من ادخالك الأسم";
                                }
                                else {
                                  if(regex.hasMatch(value)){
                                    return "رجاء تاكد من الأسم";
                                  }
                                }
                                return null;
                              },
                              keyboardtype: TextInputType.name,
                              paddingTB: 15
                          ),
                          DefaultTextField(
                              label: "البريد الأكتروني",
                              textcontroller: emailController,
                              function: (value){

                                if(value!.isEmpty)
                                {
                                  return "تأكد من ادخالك للبريد";
                                }

                                return null;
                              },
                              keyboardtype: TextInputType.emailAddress,
                              prefixicon: Icons.email,
                              paddingTB: 15
                          ),
                          DefaultTextField(
                              label: "رقم الهاتف",
                              textcontroller: numberController,
                              function:  (value){
                                RegExp regex =
                                RegExp(r'^(?=.*?\d).{10,13}$');
                                if(value!.isEmpty)
                                {
                                  return "رجاء إدخال رقم الهاتف";
                                } else {
                                  if(!regex.hasMatch(value)){
                                    return "رجاء تاكد من رقم الهاتف";
                                  }
                                  if( !(value.startsWith("092") || value.startsWith("091") || value.startsWith("094")))
                                  {
                                    return "رجاء ادخال رقم هاتف صحيح (092-091-094)";
                                  }
                                }
                                return null;
                              },
                              keyboardtype: TextInputType.number,
                              prefixicon: Icons.numbers,
                              paddingTB: 15
                          ),


                          //The Checkbox of Conditions
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 8),
                            child: Row(
                              children: [
                                RoundCheckBox(
                                    checkedColor: AppColors.CustomGreen,
                                    size: 25,
                                    isRound: false,
                                    border: Border.all(color: AppColors.CustomGrey),
                                    onTap: ( value){
                                      if(value != null)
                                      {
                                        checkbox=value;
                                      }
                                    }
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "موافق علي شروط التطبيق",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.CustomGrey
                                  ),
                                )
                              ],
                            ),
                          ),


                          //The SignUp Button
                          const SizedBox(
                            height: 15,
                          ),

                          ConditionalBuilder(
                              condition: state is! SignupLoadingState,
                              builder: (context){
                                return DefaultButton(
                                  ButtonText: 'أنشاء حساب',
                                  Function: () async {
                                    if(formkey.currentState!.validate())
                                    {
                                      if(checkbox)
                                      {
                                        /*await FirebaseAuth.instance.verifyPhoneNumber(
                                          phoneNumber: '+218${numberController.text}',
                                          verificationCompleted: (PhoneAuthCredential credential) {

                                            FirebaseAuth.instance.signInWithCredential(credential).then(
                                                    (value) => {
                                                  cubit.createUser(
                                                      name: nameController.text,
                                                      email: emailController.text,
                                                      number: numberController.text,
                                                      uId: value.user!.uid
                                                  )
                                                }
                                            ).catchError(
                                                    (error)=>{
                                                      print(error)
                                                    }
                                            );
                                            Navigator.pop(context);
                                          },
                                          verificationFailed: (FirebaseAuthException e) {
                                             print(e.toString());
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
                                                                                cubit.createUser(
                                                                                    name: nameController.text,
                                                                                    email: emailController.text,
                                                                                    number: numberController.text,
                                                                                    uId: value.user!.uid
                                                                                )
                                                                              }
                                                                          ).catchError(
                                                                                  (error)=> {
                                                                                    //cubit.emit(SignupFailedState(error))
                                                                                    print(error.toString()),
                                                                                    print("fff"),
                                                                                  }
                                                                          );
                                                                          Navigator.pop(context);
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
                                        );*/
                                        cubit.registerAccount(
                                            name: nameController.text,
                                            email: emailController.text,
                                            number: numberController.text,
                                            desc: "user",
                                            context: context
                                        );
                                      }else
                                      {
                                        showFailedToast("رجاء الموافقه على شروط التطبيق",context);
                                      }
                                    }
                                  },
                                );
                              },
                              fallback: (context){
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.CustomGreen,
                                  ),
                                );
                              }
                          ),

                          const SizedBox(
                            height: 20,
                          ),
                          // This is the text under the Button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "لديك حساب ؟ ",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: AppColors.CustomGrey
                                ),
                              ),
                              TextButton(
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.only(right: 4),
                                  ),
                                  onPressed: (){
                                    NavgatetoPage(
                                      context:  context,
                                      page:  const LoginScreen(),
                                    );
                                  },
                                  child:  Text(
                                      "تسجيل دخول",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: AppColors.CustomGreen
                                      )
                                  )
                              )
                            ],
                          )
                        ],
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
