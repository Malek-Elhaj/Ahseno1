import 'package:designapp/Modules/AccountScreens/SettingsScreen/DeleteAccountScreen.dart';
import 'package:designapp/Modules/AccountScreens/SettingsScreen/accountInfoScreen.dart';
import 'package:designapp/Shared/Components.dart';
import 'package:designapp/Shared/Cubit/cubit.dart';
import 'package:designapp/Shared/Cubit/state.dart';
import 'package:designapp/Shared/Style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<String> settingsItems=[
      "معلومات شخصية",
      "حذف الحساب",
      "لغة التطبيق",
    ];
    List<String> settingItemDescribtion=[
      "اسم . البريد الأكتروني",
      "حذف الحسابك و معلوماتك",
      "العربية"
    ];

    return BlocConsumer<Cubit_Class,State_Class>(
        listener: (context,state){},
        builder: (context,state){

          Cubit_Class cubit=Cubit_Class.get(context);


          return Directionality(
            textDirection:TextDirection.rtl,
            child: Scaffold(
                backgroundColor: Colors.white,
                appBar: defaultAppBar(
                    title: "إعدادات",
                    context:context
                ),
                body:Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(

                    children: [
                      SizedBox(
                        height: 400,
                        child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context,index){
                              return  Card(
                                elevation: 5,
                                child: ListTile(
                                    onTap: (){
                                      switch(index){
                                        case 0 :
                                          NavgatetoPage(context: context, page: const AccountInfoScreen());
                                          break;
                                        case 1:
                                          NavgatetoPage(context: context, page: const DeleteAccountScreen());
                                          break;
                                        case 2: break;
                                      }
                                    },
                                    title: Text(settingsItems[index]),
                                    subtitle: Text(
                                      settingItemDescribtion[index],
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: AppColors.CustomGrey
                                      ),
                                    ),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      size: 25,
                                      color: AppColors.CustomBlue,
                                    )
                                ),
                              );
                            },
                            separatorBuilder: (context,index){
                              return  const SizedBox(height: 10,);
                            },
                            itemCount: settingsItems.length
                        ),
                      ),
                     // const Spacer(),
                      DefaultButton(
                        Function: (){
                           cubit.signOut();

                        },
                        ButtonText: "تسجيل خروج",
                        hexColor: "#ff5c33",

                      )
                    ],
                  ),
                )
            ),
          );
        },

    );
  }
}
