import 'package:flutter/material.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../Shared/Components.dart';
import '../../../Shared/Style.dart';

class DeleteAccountScreen extends StatefulWidget {


  const DeleteAccountScreen({Key? key}) : super(key: key);

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {



  @override
  Widget build(BuildContext context) {
    bool checkbox=false;



    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: defaultAppBar(title: "حذف الحساب",context: context),
        body: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 10),
            child: Column(
              children: [
                Row(
                  children:const [
                     Text(
                      "حذف حسابك",
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("بحذف حسابك لن تتمكن من الوصول إلي حسابك في تطبيق . و ستفقد جميع معلومات الحالات الخاصة بك"),
                ),
                const SizedBox(height: 20,),
                Row(
                  children: const [
                     Text(
                      "حول حذف حسابك",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("سيتم ايقاف جميع حالاتك"),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("سيتم ايقاف جميع مشاريعك"),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("لن تتمكن من الوصول الي معلوماتك القديمة"),
                    ),
                  ],
                ),

                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 30),
                  child: Row(
                    children: [
                      RoundCheckBox(
                          checkedColor: AppColors.CustomGreen,
                          size: 25,
                          isRound: false,
                          border: Border.all(color: AppColors.CustomGrey),
                          onTap: (value){
                              checkbox = value!;
                          }
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "هل انت متاكد من حذف حسابك ",
                        style: TextStyle(
                            fontSize: 12,
                            color: AppColors.CustomGrey
                        ),
                      )
                    ],
                  ),
                ),
                DefaultButton(
                    Function: (){
                         if(checkbox == false)
                            {

                            }
                    } ,
                    ButtonText: "حذف الحساب",
                    hexColor: checkbox ? "#ff5c33" : "#707070"
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
