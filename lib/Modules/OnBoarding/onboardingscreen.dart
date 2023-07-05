import 'package:designapp/Layout/layoutScreen.dart';
import 'package:designapp/Modules/AuthFiles/signupScreen.dart';
import 'package:designapp/Shared/CacheHelper.dart';
import 'package:designapp/Shared/Style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {



    return Scaffold(
           body: SafeArea(
             child:OnBoardingSlider(

               finishButtonText: 'ابدأ في الرحلة',
               finishButtonTextStyle: const TextStyle(
                 fontSize: 16,
               ),
               onFinish: () {
                 CacheHelper.putBoolean(key: "onBoarding", value: true).then(
                         (value) {
                                  if (value) {
                                              Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (buildcontext) => const LayoutScreen()),
                                                        (route) => false);
                                            }
                                 }
                                 );
               },
               finishButtonStyle: FinishButtonStyle(
                 backgroundColor: AppColors.CustomBlue
               ),
               skipTextButton: Padding(
                 padding: const EdgeInsets.only(right: 10.0),
                 child: Text(
                   'تخطي',
                   style: TextStyle(
                     fontSize: 16,
                     color: AppColors.CustomBlue,
                     fontWeight: FontWeight.w600,
                   ),
                 ),
               ),
               

               //TopRight button when finish
               trailing: Padding(
                 padding: const EdgeInsets.only(right: 10.0),
                 child: Text(
                   'أنشاء حساب',
                   style: TextStyle(
                     fontSize: 16,
                     color: AppColors.CustomBlue,
                     fontWeight: FontWeight.w600,
                   ),
                 ),
               ),
               trailingFunction: () {
                 Navigator.push(
                   context,
                   MaterialPageRoute(
                     builder: (context) => const SignUpScreen(),
                   ),
                 );
               },
               
               
               //color of indicate
               controllerColor: AppColors.CustomLightBlue,
               indicatorAbove: true,
               indicatorPosition: 30,


               
               totalPage: 3,
               headerBackgroundColor: Colors.white,
               pageBackgroundColor: Colors.white,



               imageHorizontalOffset: 40,
               imageVerticalOffset: 80,

               background: [

                 Image.asset(
                   'Assets/images/Onboarding/2210_w046_n005_352b_p1_352.jpg',
                   height: 300,
                   width: 300,
                 ),
                 Image.asset(
                   'Assets/images/Onboarding/Contributions donation color icon.jpeg',
                   height: 300,
                   width: 300,
                 ),
                 Image.asset(
                   'Assets/images/Onboarding/2201.i605.039.S.m005.c12.charity illustration.jpg',
                   height: 300,
                   width: 300,
                 ),

               ],
               speed: 5,

               pageBodies: [
                 Container(
                   padding: const EdgeInsets.symmetric(horizontal: 40),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children:  [
                      const SizedBox(
                         height: 420,
                       ),
                       Text(
                         'فرض تبرع متنوعة ',
                         textAlign: TextAlign.center,
                         style: TextStyle(
                           color: AppColors.CustomBlue,
                           fontSize: 24.0,
                           fontWeight: FontWeight.w600,
                         ),
                       ),
                      const SizedBox(
                         height: 20,
                       ),
                      const  Text(
                         "تغطي كافة مجالات الخير و تصل الي من يستحقها من الفئات الأشد احتياجا",
                         textAlign: TextAlign.center,
                         style: TextStyle(
                           color: Colors.black26,
                           fontSize: 18.0,
                           fontWeight: FontWeight.w600,
                         ),
                       ),
                     ],
                   ),
                 ),
                 Container(
                   padding: const EdgeInsets.symmetric(horizontal: 40),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: <Widget>[
                       const SizedBox(
                         height: 420,
                       ),
                       Text(
                         'طرق أمنة و سهلة ',
                         textAlign: TextAlign.center,
                         style: TextStyle(
                           color: AppColors.CustomBlue,
                           fontSize: 24.0,
                           fontWeight: FontWeight.w600,
                         ),
                       ),
                      const  SizedBox(
                         height: 20,
                       ),
                      const  Text(
                         'عبر خيارات مختلفة من طرق الدفع التي تسهل عملية العطاء  ',
                         textAlign: TextAlign.center,
                         style: TextStyle(
                           color: Colors.black26,
                           fontSize: 18.0,
                           fontWeight: FontWeight.w600,
                         ),
                       ),
                     ],
                   ),
                 ),
                 Container(
                   padding: const EdgeInsets.symmetric(horizontal: 40),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       const SizedBox(
                         height: 420,
                       ),
                       Text(
                         'طرق لحساب زكاتك ',
                         textAlign: TextAlign.center,
                         style: TextStyle(
                           color: AppColors.CustomBlue,
                           fontSize: 24.0,
                           fontWeight: FontWeight.w600,
                         ),
                       ),
                      const SizedBox(
                         height: 20,
                       ),
                      const  Text(
                         'عبر توفير الة لحساب كافة أنواع الزكاة ',
                         textAlign: TextAlign.center,
                         style: TextStyle(
                           color: Colors.black26,
                           fontSize: 18.0,
                           fontWeight: FontWeight.w600,
                         ),
                       ),
                     ],
                   ),
                 ),
               ],
             ),
           ),
    );
  }
}




