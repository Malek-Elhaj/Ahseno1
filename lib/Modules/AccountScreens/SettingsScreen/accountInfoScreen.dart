import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:designapp/Shared/Components.dart';
import 'package:designapp/Shared/Cubit/cubit.dart';
import 'package:designapp/Shared/Cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Shared/Style.dart';

class AccountInfoScreen extends StatelessWidget {
  const AccountInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<Cubit_Class,State_Class>(
        builder: (context,state){

          TextEditingController emailController=TextEditingController();
          TextEditingController nameController=TextEditingController();
          var formKey=GlobalKey<FormState>();

          Cubit_Class cubit=Cubit_Class.get(context);
          var model=  cubit.user;

          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: defaultAppBar(title: "معلومات شخصية",context: context),
              body: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 80,
                      child: Card(
                        elevation: 5,
                        child: ListTile(
                          title:  Text(
                            "الأسم كامل",
                            style: TextStyle(
                                fontSize: 10,
                                color: AppColors.CustomGrey
                            ),
                          ),
                          minVerticalPadding: 10,
                          subtitle:  Text(
                            model.name ,
                            style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                overflow: TextOverflow.ellipsis
                            ),
                          ),
                          minLeadingWidth: 10,
                          leading: Icon(
                            Icons.account_circle_outlined,
                            size: 35,
                            color: AppColors.CustomBlue,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15,),
                    SizedBox(
                      height: 80,
                      child: Card(
                        elevation: 5,
                        child: ListTile(
                          title:  Text(
                            "البريد الكتروني",
                            style: TextStyle(
                                fontSize: 10,
                                color: AppColors.CustomGrey
                            ),
                          ),
                          minVerticalPadding: 10,
                          minLeadingWidth: 10,
                          subtitle: Text(
                            model.email ,
                            style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                overflow: TextOverflow.ellipsis
                            ),
                          ),
                          leading: Icon(
                            Icons.email_outlined,
                            size: 35,
                            color: AppColors.CustomBlue,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15,),
                    SizedBox(
                      height: 80,
                      child: Card(
                        elevation: 5,
                        child: ListTile(
                          title:  Text(
                            "الهاتف",
                            style: TextStyle(
                                fontSize: 10,
                                color: AppColors.CustomGrey
                            ),
                          ),
                          minVerticalPadding: 10,
                          minLeadingWidth: 10,
                          subtitle:  Text(
                            model.phone  ,
                            style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                overflow: TextOverflow.ellipsis
                            ),
                          ),
                          leading: Icon(
                            Icons.phone_enabled_outlined,
                            size: 35,
                            color: AppColors.CustomBlue,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    DefaultButton(
                        Function: (){
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (context)=>Directionality(
                                textDirection: TextDirection.rtl,
                                child: SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 20.0),
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          bottom: MediaQuery.of(context).viewInsets.bottom
                                      ),
                                      width: double.infinity,
                                      child: Form(
                                        key: formKey,
                                        child: Column(
                                          children: [
                                            const SizedBox(height: 15,),
                                            Text(
                                              " نموذج التعديل الحساب",
                                              style: TextStyle(
                                                  color: AppColors.CustomGrey,
                                                  fontSize: 18
                                              ),
                                            ),

                                            //add defualt value before change

                                            DefaultTextField(
                                                label: "الاسم الجديد",
                                                textcontroller: nameController,
                                                function: (value){
                                                  if(value!.isEmpty){
                                                    return "رجاءاكتب اسمك بشكل كامل";
                                                  }
                                                  return null;

                                                }
                                            ),
                                            DefaultTextField(
                                                label: "البريد الكتروني",
                                                textcontroller: emailController,
                                                function: (value){
                                                  if(value!.isEmpty){
                                                    return "رجاء ادخال البريد الكتروني";
                                                  }
                                                  return null;
                                                },
                                                keyboardtype: TextInputType.emailAddress
                                            ),
                                            const SizedBox(height: 10,),
                                            ConditionalBuilder(

                                              condition: state is! UpdateDataLoadingState,
                                              builder: (BuildContext context) { return DefaultButton(
                                                  Function: (){
                                                    cubit.updateUserData(
                                                        nameController.text,
                                                        emailController.text,
                                                        model.phone,
                                                      model.desc
                                                    );
                                                  },
                                                  ButtonText: "انهاء العملية التعديل"
                                              );},
                                              fallback: (BuildContext context) {
                                                return Center(child: CircularProgressIndicator(color: AppColors.CustomGreen,));
                                              },
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              shape: const OutlineInputBorder(
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                                  borderSide: BorderSide(color: Colors.transparent)
                              )
                          );
                        },
                        ButtonText: "تعديل البيانات"
                    ),
                  ],
                ),
              ),
            ),
          );
        }, listener: (context,state){
          if(state is DataSuccessState)
            {
              Navigator.pop(context);
              showSuccessToast("تم تحدث البيانات ", context);
            }
    }
    );
  }
}
