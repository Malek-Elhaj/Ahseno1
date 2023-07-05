import 'dart:developer';

import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:designapp/Modules/ServicesScreens/BloodDonationScreen.dart';
import 'package:designapp/Modules/ServicesScreens/GoodShopScreen.dart';
import 'package:designapp/Modules/ShopCart/shopCartScreen.dart';
import 'package:designapp/Shared/Components.dart';
import 'package:designapp/Shared/Cubit/cubit.dart';
import 'package:designapp/Shared/Style.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../Services/CubitServices/DataCubitServices/BloodCubit/blood_cubit.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);


  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageindex=0;

  List<String> sliderTitles=[
    "العناية بالمساجد",
    "عالج مريضاً... تصنع أثراً",
    "افطار صايم خير فعل",
    "تبرعك يوعين محتاج"
  ];
  List<Map<String, dynamic>> blood=[];

  @override
  void initState() {
    //getBlood();
    super.initState();
    BlocProvider.of<BloodCubit>(context).getLastBlood();
  }
  @override
  Widget build(BuildContext context) {
    var carouselController= CarouselController();
    return Scaffold(
         backgroundColor: Colors.white70,
         appBar: defaultAppBar2(
           icon: Icons.shopping_cart_outlined,
           buttonfunction: (){
               NavgatetoPage(context: context, page: ShopCartScreen());
             }
         ),
         body: SingleChildScrollView(
           child: SafeArea(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Column(
                   children: [
                     //this is the Image Slide and the Stack of Title & Buttons
                     Padding(
                       padding: const EdgeInsets.only(top: 20.0),
                       child: CarouselSlider(
                         carouselController: carouselController ,
                         items: [
                           Stack(
                             children: [
                               Padding(
                               padding: const EdgeInsets.all(10.0),
                               child: Container(
                                   foregroundDecoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(10),
                                         backgroundBlendMode: BlendMode.darken,
                                         gradient: AppColors.CustomLinearGradient

                                   ),
                                   height: 220,
                                   width: 350,
                                   clipBehavior: Clip.hardEdge,
                                   decoration:   BoxDecoration(
                                       borderRadius: BorderRadius.circular(10),
                                   ),
                                   child:Image.asset(
                                     "Assets/images/SliderImages/turkeyearth.jpg",
                                     fit: BoxFit.cover,
                                   )
                               ),
                             ),
                               Positioned(
                                 top: 30,
                                 right: 40,
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                      Text(
                                       sliderTitles[3],
                                       style: const TextStyle(
                                           fontSize: 20,
                                           color: Colors.white
                                       ),
                                     ),
                                     MaterialButton(
                                       clipBehavior: Clip.hardEdge,
                                       shape: RoundedRectangleBorder(
                                           borderRadius: BorderRadius.circular(20)
                                       ),
                                       onPressed: (){
                                         Cubit_Class.get(context).changeScreen(1);
                                       },
                                       color: HexColor("#13678A"),
                                       child:   const Text(
                                         "تبرع الان",
                                         style: TextStyle(
                                           color: Colors.white,
                                         ),
                                       ),
                                     )
                                   ],
                                 ),
                               ),
                             ]
                           ),
                           Stack(
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.all(10.0),
                                   child: Container(
                                       foregroundDecoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(10),
                                           backgroundBlendMode: BlendMode.darken,
                                           gradient: AppColors.CustomLinearGradient

                                       ),
                                       height: 220,
                                       width: 350,
                                       clipBehavior: Clip.hardEdge,
                                       decoration:   BoxDecoration(
                                         borderRadius: BorderRadius.circular(10),
                                       ),
                                       child:Image.asset(
                                         "Assets/images/SliderImages/elderly-men-are-exposed-rainwater-dry-weather-global-warming.jpg",
                                         fit: BoxFit.cover,
                                       )
                                   ),
                                 ),
                                 Positioned(
                                   top: 30,
                                   right: 40,
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                        Text(
                                         sliderTitles[2],
                                         style: const TextStyle(
                                             fontSize: 20,
                                             color: Colors.white
                                         ),
                                       ),
                                       MaterialButton(
                                         clipBehavior: Clip.hardEdge,
                                         shape: RoundedRectangleBorder(
                                             borderRadius: BorderRadius.circular(20)
                                         ),
                                         onPressed: (){
                                           Cubit_Class.get(context).changeScreen(1);
                                         },
                                         color: HexColor("#13678A"),
                                         child:   const Text(
                                           "تبرع الان",
                                           style: TextStyle(
                                             color: Colors.white,
                                           ),
                                         ),
                                       )
                                     ],
                                   ),
                                 ),
                               ]
                           ),
                           Stack(
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.all(10.0),
                                   child: Container(
                                       foregroundDecoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(10),
                                           backgroundBlendMode: BlendMode.darken,
                                           gradient: AppColors.CustomLinearGradient

                                       ),
                                       height: 220,
                                       width: 350,
                                       clipBehavior: Clip.hardEdge,
                                       decoration:   BoxDecoration(
                                         borderRadius: BorderRadius.circular(10),
                                       ),
                                       child:Image.asset(
                                         "Assets/images/SliderImages/homeless-woman-holding-hands-out-help.jpg",
                                         fit: BoxFit.cover,
                                       )
                                   ),
                                 ),
                                 Positioned(
                                   top: 30,
                                   right: 40,
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                        Text(
                                          sliderTitles[1],
                                         style: const TextStyle(
                                             fontSize: 20,
                                             color: Colors.white
                                         ),
                                       ),
                                       MaterialButton(
                                         clipBehavior: Clip.hardEdge,
                                         shape: RoundedRectangleBorder(
                                             borderRadius: BorderRadius.circular(20)
                                         ),
                                         onPressed: (){
                                           Cubit_Class.get(context).changeScreen(1);
                                         },
                                         color: HexColor("#13678A"),
                                         child:   const Text(
                                           "تبرع الان",
                                           style: TextStyle(
                                             color: Colors.white,
                                           ),
                                         ),
                                       )
                                     ],
                                   ),
                                 ),
                               ]
                           ),
                           Stack(
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.all(10.0),
                                   child: Container(
                                       foregroundDecoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(10),
                                           backgroundBlendMode: BlendMode.darken,
                                           gradient: AppColors.CustomLinearGradient

                                       ),
                                       height: 220,
                                       width: 350,
                                       clipBehavior: Clip.hardEdge,
                                       decoration:   BoxDecoration(
                                         borderRadius: BorderRadius.circular(10),
                                       ),
                                       child:Image.asset(
                                         "Assets/images/SliderImages/muslims-reading-from-quran.jpg",
                                         fit: BoxFit.cover,
                                       )
                                   ),
                                 ),
                                 Positioned(
                                   top: 30,
                                   right: 40,
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                        Text(
                                         sliderTitles[0],
                                         style: const TextStyle(
                                             fontSize: 20,
                                             color: Colors.white
                                         ),
                                       ),
                                       MaterialButton(
                                         clipBehavior: Clip.hardEdge,
                                         shape: RoundedRectangleBorder(
                                             borderRadius: BorderRadius.circular(20)
                                         ),
                                         onPressed: (){
                                           Cubit_Class.get(context).changeScreen(3);
                                         },
                                         color: HexColor("#13678A"),
                                         child:   const Text(
                                           "تبرع الان",
                                           style: TextStyle(
                                             color: Colors.white,
                                           ),
                                         ),
                                       )
                                     ],
                                   ),
                                 ),
                               ]
                           ),
                         ],
                         options: CarouselOptions(
                             onPageChanged: (index,r){
                               setState(() {
                                 pageindex=index;
                               });
                             },
                             viewportFraction: 0.9,
                             autoPlay: true,
                             autoPlayCurve: Curves.easeInToLinear,
                             autoPlayInterval: const Duration(seconds: 8),
                             enlargeCenterPage: true,
                             enlargeStrategy: CenterPageEnlargeStrategy.height
                         ),

                       ),
                     ),
                     const  SizedBox(
                       height: 10,
                     ),

                     //This is the Image indecator
                     RotatedBox(
                       quarterTurns: 90,
                       child: CarouselIndicator(
                         count: 4,
                         index: pageindex,
                         activeColor: AppColors.CustomBlue,
                         color: AppColors.CustomGrey,
                         space: 20,
                         height: 4,
                       ),
                     ),
                   ],
                 ),
                 const SizedBox(height: 10,),
                 //Text indecator of Blood area
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     //Blood Needs Text
                     const Padding(
                       padding:  EdgeInsets.symmetric(horizontal: 20.0),
                       child: Text(
                           "حالات المحتاجه للدم",
                         style: TextStyle(
                           color: Colors.redAccent,
                           fontSize: 20
                         ),
                       ),
                     ),
                     // the Learn More Button Next To Blood Needs
                     Padding(
                       padding: const EdgeInsets.only(left: 8.0),
                       child: TextButton(
                           onPressed: (){
                             NavgatetoPage(context: context, page: const BloodDonationScreen());
                           },
                           child: Text(
                         "معرفة المزيد",
                         style: TextStyle(
                             color: AppColors.CustomGrey,
                             fontSize: 15
                         ),
                       )
                       ),
                     )
                   ],
                 ),
                 SizedBox(
                   height: 250,
                   child : BlocBuilder<BloodCubit,BloodState>(
                       builder:(context,state){

                         if(state is BloodLooded){
                           blood.clear();
                           blood = (state).lastBlood;
                           return bloodDonationCard(Scroll: Axis.horizontal,list: blood);
                         }else
                         {
                           BlocProvider.of<BloodCubit>(context).getLastBlood();
                           return bloodDonationCard(Scroll: Axis.horizontal,list: blood);
                         }
                       }
                   ),

                 ),

                 //this is the list of Goodshop
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Padding(
                       padding: const  EdgeInsets.symmetric(horizontal: 20.0),
                       child: Text(
                         "منتجات متجر الخير",
                         style: TextStyle(
                             color: AppColors.CustomBlue,
                             fontSize: 20
                         ),
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(left: 8.0),
                       child: TextButton(
                           onPressed: (){
                             NavgatetoPage(context: context, page: GoodShopScreen());

                       }, child: Text(
                           "معرفة المزيد",
                         style: TextStyle(
                           color: AppColors.CustomGrey,
                           fontSize: 15
                         ),
                       )),
                     )
                   ],
                 ),
                 SizedBox(
                   height: 250,
                   width: 400,
                   child: ListView.builder(
                       scrollDirection: Axis.horizontal,
                       itemBuilder: (context, index) => Padding(
                           padding:
                           const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                           child: SizedBox(
                             height: 200,
                             width: 300,
                             child: Card(
                               elevation: 10,
                               shape: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(16),
                                 borderSide: const BorderSide(color: Colors.transparent)
                               ),
                               child: Column(
                                 children: [
                                   Container(
                                       height: 60,
                                       width: MediaQuery.of(context).size.width,
                                       decoration:  BoxDecoration(
                                           borderRadius: const BorderRadius.only(topRight: Radius.circular(16),topLeft: Radius.circular(16)),
                                           image: DecorationImage(
                                             fit: BoxFit.cover,
                                             colorFilter:  ColorFilter.mode(Colors.grey.withOpacity(0.8), BlendMode.darken,),
                                             image: GoodShopScreen.images[index],
                                           )
                                       ),
                                       child: Padding(
                                         padding: const EdgeInsets.all(8.0),
                                         child: Text(
                                           GoodShopScreen.shopITems[index],
                                           style: TextStyle(
                                               color: AppColors.CustomWhite,
                                               fontSize: 15
                                           ),
                                         ),
                                       )
                                   ),
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       Padding(
                                         padding: const EdgeInsets.all(25.0),
                                         child: Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children:  [
                                             Text(
                                               "السعر",
                                               style: TextStyle(
                                                   fontSize: 16,
                                                   color: AppColors.CustomGrey
                                               ),
                                             ),
                                             Row(
                                               children: [
                                                 Text(
                                                   GoodShopScreen.prices[index],
                                                   style: TextStyle(
                                                       color: AppColors.CustomGreen,
                                                       fontSize: 30
                                                   ),
                                                 ),
                                                 const SizedBox(width: 10,),
                                                 Text(
                                                   "دينار",
                                                   style: TextStyle(
                                                       color: AppColors.CustomGrey,
                                                       fontSize: 16
                                                   ),
                                                 )
                                               ],
                                             )
                                           ],
                                         ),
                                       ),
                                       Padding(
                                         padding: const EdgeInsets.only(left: 20.0,top: 20),
                                         child: DefaultButton(
                                             Function: (){

                                             },
                                             ButtonText: "اشتري الأن",
                                             minWidth: 100,
                                             radius: 16,
                                             fontsize: 10
                                         ),
                                       )
                                     ],
                                   )
                                 ],
                               ),
                             ),
                           )
                       ),
                       itemCount: 4
                   ),
                 ),
               ],
             )
           ),
         ),
    );
  }
}
