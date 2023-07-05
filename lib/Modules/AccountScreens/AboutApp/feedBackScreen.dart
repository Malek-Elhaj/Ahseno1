import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:designapp/Shared/Components.dart';
import 'package:designapp/Shared/Style.dart';
import 'package:flutter/material.dart';

class FeedBackScreen extends StatelessWidget {
  const FeedBackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final snackBarFailed = SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'حدث خظأ',
        message:
        'تأكد من ادخال البيانات بشكل صحيح',

        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
        contentType: ContentType.failure,
      ),
    );
    final snackBarDone = SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'شكراًً',
        message:
        'تمت عملية ارسال الملاحظة بنجاح شاكرين معاونتك',

        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
        contentType: ContentType.success,
      ),
    );

    var formkey=GlobalKey<FormState>();

    var nameController=TextEditingController();
    var emailController=TextEditingController();
    var numberController=TextEditingController();
    var feedbackController=TextEditingController();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "الشكاوي و الملاحظات",
            style: TextStyle(
                fontSize: 17
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    tileMode: TileMode.clamp,
                    /* begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,*/
                    colors: [
                      AppColors.CustomBlue.withOpacity(0.0),
                      AppColors.CustomGreen.withOpacity(0.9),
                    ],
                    stops: const [
                      0.0,
                      0.9
                    ])
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Column(
                children: [
                  DefaultTextField(
                      label: "الاسم ",
                      maxline: 1,
                      isExpaned: false,
                      textcontroller: nameController,
                      function: (value)
                      {
                        if(value!.isEmpty)
                          {
                            return "رجاء ادخال ألاسم";
                          }
                        return null;
                      },
                     paddingTB: 10
                  ),
                  DefaultTextField(
                      label: "البريد الاكتروني ",
                      textcontroller: emailController,
                      function: (value)
                      {
                        if(value!.isEmpty)
                        {
                          return "رجاء ادخال البريد الاكتروني";
                        }
                        return null;
                      },
                      paddingTB: 10,
                      keyboardtype: TextInputType.emailAddress
                  ),
                  DefaultTextField(
                      label: "رقم الهاتف ",
                      textcontroller: numberController,
                      function: (value)
                      {
                        if(value!.isEmpty)
                        {
                          return "رجاء ادخال رقم الهاتف";
                        }
                        RegExp regex =
                        RegExp(r'^(?=.*?\d).{10,13}$');
                        if(!regex.hasMatch(value)){
                          return "رقم الهاتف الذي ادخلته غير صحيح";
                        }
                        return null;
                      },
                      paddingTB: 10,
                      keyboardtype: TextInputType.number
                  ),
                  SizedBox(
                    height: 300,
                    child: DefaultTextField(
                        maxline: null,
                        isExpaned: true,
                        label: "الرسالة",
                        textcontroller: feedbackController,
                        function: (value){
                          if(value!.isEmpty)
                            {
                              return "رجاء ادخال ملاحظات او الشكاوي";
                            }
                          return null;
                        },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: DefaultButton(
                        Function: (){
                          if(formkey.currentState!.validate())
                            {
                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(snackBarDone);
                            }else
                              {

                                ScaffoldMessenger.of(context)
                                  ..hideCurrentSnackBar()
                                  ..showSnackBar(snackBarFailed);
                              }
                            },
                        ButtonText: "إرسال"
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
