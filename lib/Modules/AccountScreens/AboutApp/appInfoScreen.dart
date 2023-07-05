import 'package:designapp/Shared/Style.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AppInfoScreen extends StatelessWidget {
  const AppInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "معلومات التطبيق",
            style: TextStyle(
                fontSize: 17
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: AppColors.CustomLinearGradient
            ),
          ),
        ),
        body: SizedBox(
          height: double.infinity,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 100.0),
              child: Column(
                crossAxisAlignment:CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                     Text(
                         "تطبيق أحسينو",
                       style: TextStyle(
                         fontSize: 23,
                         color: AppColors.CustomBlue
                       ),
                     ),
                     const SizedBox(
                       height: 10,
                     ),
                     Text(
                         "Version 1.0",
                       style: TextStyle(
                         color: AppColors.CustomGrey
                       ),
                     ),

                     const Spacer(),
                     Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                        child: ListTile(
                          leading: Text(
                            "عن المنصة",
                            style: TextStyle(
                                color: AppColors.CustomGrey
                            ),
                          ),
                          trailing:  Icon(
                            Icons.arrow_circle_left_outlined,
                            color: AppColors.CustomBlue,
                          ),
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                        child: ListTile(
                          leading: Text(
                            "سياسات و ضوابط التبرع",
                            style: TextStyle(
                                color: AppColors.CustomGrey
                            ),
                          ),
                          trailing:  Icon(
                            Icons.arrow_circle_left_outlined,
                            color: AppColors.CustomBlue,
                          ),
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                        child: ListTile(
                          leading: Text(
                            "سياسات الخصوصية",
                            style: TextStyle(
                                color: AppColors.CustomGrey
                            ),
                          ),
                          trailing:  Icon(
                            Icons.arrow_circle_left_outlined,
                            color: AppColors.CustomBlue,
                          ),
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          onTap: (){
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                        child: ListTile(
                          leading: Text(
                            "مركز التواصل",
                            style: TextStyle(
                                color: AppColors.CustomGrey
                            ),
                          ),
                          trailing:  Icon(
                            Icons.arrow_circle_left_outlined,
                            color: AppColors.CustomBlue,
                          ),
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          onTap: (){
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
