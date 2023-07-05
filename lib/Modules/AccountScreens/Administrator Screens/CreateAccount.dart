import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:designapp/Services/CubitServices/AuthCubitServices/SignUpAdminCubite/SignUpAdminCubit.dart';
import 'package:designapp/Services/CubitServices/AuthCubitServices/SignUpAdminCubite/SignUpAdminState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roundcheckbox/roundcheckbox.dart';


import '../../../Shared/CacheHelper.dart';
import '../../../Shared/Components.dart';
import '../../../Shared/Style.dart';
import '../../AuthFiles/Login_Design.dart';

const List<String> list = <String>['قسم المشاريع الخيرية', 'قسم المديونين','قسم المؤونة', 'قسم الدم'];
String val="projects";

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    var formkey=GlobalKey<FormState>();

    bool checkbox=false;


    TextEditingController numberController=TextEditingController();

    TextEditingController nameController=TextEditingController();

    TextEditingController emailController=TextEditingController();


    return BlocProvider(
      create: (context) => SignupAdminCubit(),
      child: BlocConsumer<SignupAdminCubit,SignupAdminStates>(
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

          SignupAdminCubit cubit= SignupAdminCubit.createSignupObject(context);

          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: AppBar(
                
              ),
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

                          const SizedBox(
                            height: 10,
                          ),


                          Text(
                              "إنشاء حساب مدير قسم",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: AppColors.CustomBlue
                              )

                          ),
                          const SizedBox(
                            height: 50,
                          ),

                          //Form Of Creating A Account
                          Row(
                            children: [
                              Padding(padding: EdgeInsetsDirectional.only(start: 35)),
                              Text('القسم'),
                              SizedBox(width: 30,),
                              Container(

                                child: DropdownButton<String>(

                                  value: dropdownValue,
                                  icon: const Icon(Icons.account_balance_rounded),
                                  elevation: 16,
                                  style: const TextStyle(color: Colors.deepPurple),

                                  items: list.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value,style: TextStyle(
                                        fontWeight: FontWeight.bold,

                                      )),
                                    );
                                  }).toList(),

                                  onChanged: (String? value) {
                                    switch(value){
                                      case "قسم المؤونة":
                                        val = "maona";
                                        break;
                                      case "قسم المديونين":
                                        val = "madion";
                                        break;
                                      case "قسم المشاريع الخيرية":
                                        val = "projects";
                                        break;
                                    }
                                    setState(() {
                                      dropdownValue = value!;
                                    }
                                    );
                                  },



                                ),
                              ),
                            ],
                          ),
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
                                      cubit.registerAccount(
                                          name: nameController.text,
                                          email: emailController.text,
                                          number: numberController.text,
                                          desc: val,
                                          context: context,  );
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
