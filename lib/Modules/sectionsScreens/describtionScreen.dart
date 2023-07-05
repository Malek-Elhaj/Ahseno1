import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:designapp/Shared/Components.dart';
import 'package:designapp/Shared/Style.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:share_plus/share_plus.dart';
import 'package:intl/intl.dart' as intl;

class DescribtionScreen extends StatelessWidget {
  Map<String, dynamic> list;
  DescribtionScreen({required this.list});
  @override
  Widget build(BuildContext context) {
    Timestamp date = this.list["date"];
    DateTime aa= date.toDate();
    String formattedDate = intl.DateFormat('yyyy-MM-dd').format(aa);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
         appBar: defaultAppBar(
             title: "تفاصيل",
             leadingicon: Icons.close,
             context: context
         ),
         body: SingleChildScrollView(
           child: Padding(
             padding: const EdgeInsets.all(25.0),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                     Card(
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.transparent)
                      ),
                      clipBehavior: Clip.hardEdge,
                      elevation: 5,
                      shadowColor: AppColors.CustomGrey,
                      child: SizedBox(
                        height: 500,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Container(
                              height: 200,
                              width: double.infinity,
                              decoration: const  BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  filterQuality: FilterQuality.high,
                                  image: AssetImage("Assets/images/SliderImages/muslims-reading-from-quran.jpg")
                                )
                              ),
                            ),

                            Text(
                                "${this.list["title"]}",
                              style: TextStyle(
                                color: AppColors.CustomBlue,
                                fontSize: 20,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right:80.0,top: 15,bottom: 20),
                              child: Stack(
                                children: [
                                  Positioned(
                                    right: 100,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.location_on_outlined,
                                          size: 15,
                                          color: AppColors.CustomGrey,
                                        ),
                                        const SizedBox(width: 3,),
                                        Text(
                                          "${this.list["location"]}",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: AppColors.CustomGrey
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.date_range,
                                        size: 15,
                                        color: AppColors.CustomGrey,
                                      ),
                                      const SizedBox(width: 3,),
                                      Text(
                                        formattedDate
                                        ,
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: AppColors.CustomGrey
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              alignment: Alignment.topCenter,
                              height: 50,
                              width: 250,
                              child: Text(
                                  "انشاء ابيار في منطقة بني وليد",
                                maxLines: 2,
                                style: TextStyle(
                                  color: AppColors.CustomGrey,
                                  overflow: TextOverflow.ellipsis
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 60.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children:  [
                                        Text(
                                            "رقم الحالة",
                                          style: TextStyle(
                                            fontSize: 15,
                                              color: AppColors.CustomGrey
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                            "12390",
                                          style: TextStyle(
                                              fontSize: 18,color: AppColors.CustomGreen
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const VerticalDivider(
                                    color: Colors.red,
                                    thickness: 10,
                                    width: 20,
                                  ),
                                  Positioned(
                                    left: 1,
                                    right: 150,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                            "عدد المستفيدين",
                                          style: TextStyle(
                                              fontSize: 15,color: AppColors.CustomGrey
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                            "${this.list["mostafid"]}",
                                          style: TextStyle(
                                              fontSize: 18,color: AppColors.CustomGreen
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Container(
                              height: 25,
                              width: double.infinity,
                              color: AppColors.CustomGreen,
                              child: InkWell(
                                onTap: () async {
                                 await Share.share("تبرع ألان في تطبيق أحسينو");
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Icon(
                                        Icons.ios_share,
                                      color: Colors.white,
                                      size: 13,
                                    ),
                                    SizedBox(width: 10,),
                                    Text(
                                        "ساهم بمشاركه",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )

                          ],
                        ),

                      ),
                    ),
                     const SizedBox(
                      height: 20,
                    ),
                     Card(
                         shape: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(15),
                             borderSide: const BorderSide(color: Colors.transparent)
                         ),
                         clipBehavior: Clip.hardEdge,
                         elevation: 5,
                         shadowColor: AppColors.CustomGrey,
                         child: SizedBox(
                           height: 340,
                           width: MediaQuery.of(context).size.width,
                           child: Column(
                             children: [
                               const SizedBox(height: 30,),
                               Padding(
                                 padding: const EdgeInsets.all(10.0),
                                 child: Text("${this.list["description"]}",
                                   style: TextStyle(
                                        fontSize: 15,
                                        wordSpacing: 1,
                                        color: AppColors.CustomGrey,
                                        overflow: TextOverflow.ellipsis
                                   ),
                                   maxLines: 4,
                                 ),
                               ),
                               const SizedBox(height: 20,),
                               SizedBox(
                                 width: MediaQuery.of(context).size.width,
                                 child: Stack(
                                   children: [
                                     Padding(
                                       padding: const EdgeInsets.only(right: 60.0),
                                       child: Column(
                                         crossAxisAlignment: CrossAxisAlignment.center,
                                         children:  [
                                           Text(
                                             "الهدف المطلوب",
                                             style: TextStyle(
                                                 fontSize: 15,
                                                 color: AppColors.CustomGrey
                                             ),
                                           ),
                                           const SizedBox(
                                             height: 10,
                                           ),
                                           Text(
                                             "${this.list["req"]}",
                                             style: TextStyle(
                                                 fontSize: 18,color: AppColors.CustomGreen
                                             ),
                                           )
                                         ],
                                       ),
                                     ),
                                     const VerticalDivider(
                                       color: Colors.red,
                                       thickness: 10,
                                       width: 20,
                                     ),
                                     Positioned(
                                       left: 1,
                                       right: 150,
                                       child: Column(
                                         mainAxisAlignment: MainAxisAlignment.center,
                                         children: [
                                           Text(
                                             "مجموع التبرعات",
                                             style: TextStyle(
                                                 fontSize: 15,
                                                 color: AppColors.CustomGrey
                                             ),
                                           ),
                                           const SizedBox(
                                             height: 10,
                                           ),
                                           Text(
                                             "${this.list["total"]}",
                                             style: TextStyle(
                                                 fontSize: 18,color: AppColors.CustomGreen
                                             ),
                                           ),

                                         ],
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                               Padding(
                                 padding: const EdgeInsets.all(20.0),
                                 child: LinearPercentIndicator(
                                       percent: (list["total"]/list["req"]),
                                       linearGradient: AppColors.CustomLinearGradient,
                                       barRadius: const Radius.circular(10),
                                        lineHeight: 20,
                                        animation: true,
                                        isRTL: true,
                                        center: Text(
                                          (list["total"]/list["req"]*100).toStringAsFixed(2)+" % ",
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white
                                          ),
                                        ),
                                 )
                               ),

                             ],
                           ),

                         ),
                 ),
                     const SizedBox(
                       height: 20,
                     ),
                     SizedBox(
                       height: 350,
                       child: Card(
                         shape: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(15),
                             borderSide: const BorderSide(color: Colors.transparent)
                         ),
                         clipBehavior: Clip.hardEdge,
                         elevation: 5,
                         shadowColor: AppColors.CustomGrey,
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Padding(
                               padding: const EdgeInsets.symmetric(
                                   horizontal: 20.0, vertical: 10),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.symmetric(
                                         horizontal: 8.0),
                                     child: InkWell(
                                       onTap: () {

                                       },
                                       child: Container(
                                         height: 80,
                                         width: 80,
                                         decoration: BoxDecoration(
                                             borderRadius:
                                             BorderRadius.circular(10),
                                             border: Border.all(
                                                 color: AppColors.CustomLightBlue
                                             ),
                                             boxShadow: [
                                               BoxShadow(
                                                   blurRadius: 5,
                                                   color: Colors.black
                                                       .withOpacity(0.16),
                                                   blurStyle: BlurStyle.outer)
                                             ]),
                                         child: Column(
                                           crossAxisAlignment:
                                           CrossAxisAlignment.center,
                                           mainAxisAlignment:
                                           MainAxisAlignment.center,
                                           children: [
                                             Text(
                                               "50",
                                               style: TextStyle(
                                                   fontSize: 20,
                                                   color: AppColors.CustomGrey
                                               ),
                                             ),
                                             Text(
                                               "د.ل",
                                               style: TextStyle(
                                                   color: AppColors.CustomGrey
                                               ),
                                             )
                                           ],
                                         ),
                                       ),
                                     ),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.symmetric(
                                         horizontal: 8.0),
                                     child: InkWell(
                                       onTap: () {

                                       },
                                       child: Container(
                                         height: 80,
                                         width: 80,
                                         decoration: BoxDecoration(
                                             borderRadius:
                                             BorderRadius.circular(10),
                                             border: Border.all(
                                                 color: AppColors.CustomLightBlue
                                             ),
                                             boxShadow: [
                                               BoxShadow(
                                                   blurRadius: 5,
                                                   color: HexColor("#000000")
                                                       .withOpacity(0.16),
                                                   blurStyle: BlurStyle.outer)
                                             ]),
                                         child: Column(
                                           crossAxisAlignment:
                                           CrossAxisAlignment.center,
                                           mainAxisAlignment:
                                           MainAxisAlignment.center,
                                           children: [
                                             Text(
                                               "100",
                                               style: TextStyle(
                                                   fontSize: 20,
                                                   color: AppColors.CustomGrey
                                               ),
                                             ),
                                             Text(
                                               "د.ل",
                                               style: TextStyle(
                                                   color: AppColors.CustomGrey
                                               ),
                                             )
                                           ],
                                         ),
                                       ),
                                     ),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.symmetric(
                                         horizontal: 8.0),
                                     child: InkWell(
                                       onTap: () {

                                       },
                                       child: Container(
                                         height: 80,
                                         width: 80,
                                         decoration: BoxDecoration(
                                             borderRadius:
                                             BorderRadius.circular(10),
                                             border: Border.all(
                                                 color: AppColors.CustomLightBlue
                                             ),
                                             boxShadow: [
                                               BoxShadow(
                                                   blurRadius: 5,
                                                   color: Colors.black
                                                       .withOpacity(0.16),
                                                   blurStyle: BlurStyle.outer)
                                             ]),
                                         child: Column(
                                           crossAxisAlignment:
                                           CrossAxisAlignment.center,
                                           mainAxisAlignment:
                                           MainAxisAlignment.center,
                                           children: [
                                             Text(
                                               "200",
                                               style: TextStyle(
                                                   fontSize: 20,
                                                   color: AppColors.CustomGrey),
                                             ),
                                             Text(
                                               "د.ل",
                                               style: TextStyle(
                                                   color: AppColors.CustomGrey),
                                             )
                                           ],
                                         ),
                                       ),
                                     ),
                                   )
                                 ],
                               ),
                             ),
                             DefaultTextField(
                               label: "المبلغ",
                               prefixicon: Icons.payment,
                               textcontroller: TextEditingController(),
                               function: (value) {
                                 return null;
                               },
                             ),
                             Padding(
                               padding: const EdgeInsets.all(10.0),
                               child: DefaultButton(
                                   Function: () {},
                                   ButtonText: "تبرع لأن",
                                   minWidth: 150,
                                   hexColor: "#45C4B0"
                               ),
                             )
                           ],
                         ),
                       ),
                     ),
               ],
             )
           ),
         ),
      ),
    );
  }
}
