import 'package:designapp/Layout/layoutScreen.dart';
import 'package:designapp/Shared/Components.dart';
import 'package:designapp/Shared/Style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ZakatScreen extends StatefulWidget {
  const ZakatScreen({Key? key}) : super(key: key);

  @override
  State<ZakatScreen> createState() => _ZakatScreenState();
}



class _ZakatScreenState extends State<ZakatScreen> {
  bool isMoney=true;
  bool isSilver=false;
  bool isGold=false;
  @override
  Widget build(BuildContext context) {

    var formKey= GlobalKey<FormState>();
    var formKey2= GlobalKey<FormState>();
    var formKey3= GlobalKey<FormState>();

    TextEditingController moneyField=TextEditingController();

    TextEditingController priceofGold=TextEditingController();
    TextEditingController goldWeight=TextEditingController();
    TextEditingController type=TextEditingController();

    TextEditingController priceOfSilver=TextEditingController();
    TextEditingController silverWeight=TextEditingController();

    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: defaultAppBar(
                title: "الزكاة",
                context: context
            ),
            body:  DefaultTabController(
              length: 1,
              child: Column(
                children: [
                  //TabBar
                  Container(
                    color: Colors.white,
                    width: double.infinity,
                    child: TabBar(
                        overlayColor: MaterialStateColor.resolveWith(
                                (states) => Colors.white),
                        isScrollable: false,
                        labelStyle: GoogleFonts.cairo(fontSize: 13),
                        labelColor: AppColors.CustomBlue,
                        labelPadding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 4),
                        indicatorColor: AppColors.CustomBlue,
                        indicatorWeight: 1,
                        indicatorPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                        unselectedLabelColor: AppColors.CustomGrey,
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        tabs: const [
                          Tab(
                            text: 'حاسبة الزكاة',
                          ),
                    //      Tab(
                      //      text: 'حجز موعد مع خبير',
                      //    ),
                        ]),
                  ),

                  // TabBar Body
                  Expanded(
                    child: TabBarView(children: [
                      //Default list of items
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SingleChildScrollView(
                          child: Column(

                            children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius:  BorderRadius.circular(16),
                                      color: AppColors.CustomBlue.withOpacity(0.15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      children: [
                                        // gold
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                "الذهب",
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: AppColors.CustomGrey
                                              ),
                                            ),
                                            Switch(
                                                value: isGold,
                                                activeColor: AppColors.CustomWhite,
                                                inactiveThumbColor: AppColors.CustomGreen,
                                                inactiveTrackColor: AppColors.CustomWhite,
                                                activeTrackColor: AppColors.CustomGreen,
                                                onChanged: (value){
                                                  setState(() {
                                                    isMoney=false;
                                                    isSilver=false;
                                                    isGold=value;
                                                  });
                                                }
                                            ),

                                          ],
                                        ),
                                        //Silver
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "الفضة",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: AppColors.CustomGrey
                                              ),
                                            ),
                                            Switch(
                                                value: isSilver,
                                                activeColor: AppColors.CustomWhite,
                                                inactiveThumbColor: AppColors.CustomGreen,
                                                inactiveTrackColor: AppColors.CustomWhite,
                                                activeTrackColor: AppColors.CustomGreen,
                                                onChanged: (value){
                                                  setState(() {
                                                    isMoney=false;
                                                    isSilver=value;
                                                    isGold=false;
                                                  });
                                                }
                                            ),

                                          ],
                                        ),
                                        //Money
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "المال",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: AppColors.CustomGrey
                                              ),
                                            ),
                                            Switch(
                                                  value: isMoney,
                                                  activeColor: AppColors.CustomWhite,
                                                  inactiveThumbColor: AppColors.CustomGreen,
                                                  inactiveTrackColor: AppColors.CustomWhite,
                                                  activeTrackColor: AppColors.CustomGreen,
                                                  onChanged: (value){
                                                    setState(() {
                                                      isMoney=value;
                                                      isGold=false;
                                                      isSilver=false;
                                                    });
                                                  }
                                              ),
                                          ],
                                        ),

                                      ],
                                    ),
                                  ),
                                ),

                                //Money Widget
                                Visibility(
                                  maintainAnimation: true,
                                  maintainState: true,
                                  visible: isMoney,
                                  child: AnimatedOpacity(
                                      duration: const Duration(milliseconds: 700),
                                      curve: Curves.fastOutSlowIn,
                                      opacity: isMoney ? 1 : 0,
                                      child: Form(
                                        key: formKey,
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              height: 250,
                                            ),
                                            DefaultTextField2(
                                                label: "المبلغ",
                                                textcontroller: moneyField,
                                                suffixicon: const Padding(
                                                  padding:  EdgeInsets.only(top: 10.0),
                                                  child: Text(
                                                    "د.ل",
                                                    style: TextStyle(
                                                        color: Colors.grey
                                                    ),
                                                  ),
                                                ),
                                                function: (value){
                                                  if(value!.isEmpty)
                                                    {
                                                      return "رجاء ادخال المبلغ مراد حسابه";
                                                    }
                                                  return null;
                                                },
                                                keyboardtype: TextInputType.number,
                                            ),
                                            const SizedBox(height: 10,)

                                          ],
                                        ),
                                      ),
                                  )

                                ),

                                //silver Widget
                                Visibility(
                                visible: isSilver,
                                maintainState: true,
                                maintainAnimation: true,
                                child: AnimatedOpacity(
                                    duration: const Duration(milliseconds: 700),
                                    curve: Curves.linear,
                                    opacity: isSilver ? 1 : 0,
                                    child:Form(
                                      key: formKey2,
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 170,
                                          ),
                                          DefaultTextField2(
                                              paddingTB: 10,
                                              label: "سعر الفضة",
                                              textcontroller: priceOfSilver,
                                              suffixicon: const Padding(
                                                padding:  EdgeInsets.only(top: 10.0),
                                                child: Text(
                                                  "د.ل",
                                                  style: TextStyle(
                                                      color: Colors.grey
                                                  ),
                                                ),
                                              ),
                                              function: (value){
                                                if(value!.isEmpty)
                                                {
                                                  return "رجاء ادخال المبلغ مراد حسابه";
                                                }
                                                return null;
                                              },
                                              keyboardtype: TextInputType.number,
                                          ),
                                          DefaultTextField2(
                                              paddingTB: 15,
                                              label: "الوزن",
                                              textcontroller: silverWeight,
                                              suffixicon:  const Padding(
                                                padding:  EdgeInsets.only(top: 10.0),
                                                child: Text(
                                                  "جرام",
                                                  style: TextStyle(
                                                      color: Colors.grey
                                                  ),
                                                ),
                                              ),
                                              function: (value){
                                                if(value!.isEmpty)
                                                {
                                                  return "رجاء ادخال المبلغ مراد حسابه";
                                                }
                                                return null;
                                              },
                                              keyboardtype: TextInputType.number,
                                          ),
                                          const SizedBox(height: 20,)

                                  ],
                                ),
                                    )
                                ),
                              ),

                                //Gold Widget
                                Visibility(
                                visible: isGold,
                                  maintainState: true,
                                  maintainAnimation: true,
                                  child: AnimatedOpacity(
                                    duration: const Duration(milliseconds: 700),
                                    curve: Curves.fastOutSlowIn,
                                    opacity: isGold ? 1 : 0,
                                    child: Form(
                                      key: formKey3,
                                      child: Column(
                                        children: [
                                      const SizedBox(
                                        height: 80,
                                      ),
                                      DefaultTextField2(
                                          paddingTB: 10,
                                          label: "سعر البيع",
                                          textcontroller: priceofGold,
                                          suffixicon: const Padding(
                                            padding:  EdgeInsets.only(top: 10.0),
                                            child: Text(
                                              "د.ل",
                                              style: TextStyle(
                                                  color: Colors.grey
                                              ),
                                            ),
                                          ),
                                          function: (value){
                                            if(value!.isEmpty)
                                            {
                                              return "رجاء ادخال سعر الذهب الحالي ";
                                            }
                                            return null;
                                          },
                                          keyboardtype: TextInputType.number,
                                      ),
                                      DefaultTextField2(
                                          paddingTB: 10,
                                          label: "الوزن",
                                          textcontroller: goldWeight,
                                          function: (value){
                                            if(value!.isEmpty)
                                            {
                                              return "رجاء ادخال وزن الجمالي للذهب";
                                            }
                                            return null;
                                          },
                                          suffixicon: const Padding(
                                            padding:  EdgeInsets.only(top: 10.0),
                                            child: Text(
                                                "جرام",
                                              style: TextStyle(
                                                color: Colors.grey
                                              ),
                                            ),
                                          ),
                                          keyboardtype: TextInputType.number,
                                      ),
                                      DefaultTextField(
                                           paddingTB: 10,
                                           label: "العيار",
                                           textcontroller: type,
                                          function: (value){
                                            if(value!.isEmpty)
                                            {
                                              return "  المبلغ مراد حسابه عيار الذهب الخاص بك";
                                            }
                                            return null;
                                          },
                                          keyboardtype: TextInputType.number,
                                       ),
                                      const SizedBox(height: 20,)

                                  ],
                                ),
                                    )
                                  ),
                              ),

                                //Space Widget
                                Visibility(
                                    visible: (isMoney==false&& isSilver==false&& isGold==false),
                                    child: const Spacer()
                                ),


                                DefaultButton(
                                  Function: (){
                                    //Money Function Call
                                    if(formKey.currentState!.validate())
                                     {
                                       double zakatvalue= calculateMoneyZakat( double.parse(moneyField.text));
                                       showModalBottomSheet(
                                         shape: const OutlineInputBorder(
                                             borderRadius: BorderRadius.only(
                                                 topRight: Radius.circular(15),
                                                 topLeft: Radius.circular(15)),
                                             borderSide: BorderSide(color: Colors.transparent)),
                                         isScrollControlled: false,
                                         context: context,
                                         builder: (BuildContext context) => SizedBox(
                                           height: 300,
                                           width: double.infinity,
                                           child: Directionality(
                                             textDirection: TextDirection.rtl,
                                             child: SingleChildScrollView(
                                               physics: const BouncingScrollPhysics(),
                                               child: Column(
                                                 children: [
                                                   const Padding(
                                                     padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 15),
                                                     child: Text(
                                                       "قيمة الزكاة",
                                                       style: TextStyle(fontSize: 17),
                                                     ),
                                                   ),
                                                   Padding(
                                                     padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 30),
                                                     child: Text(
                                                       "$zakatvalue",
                                                       style:  TextStyle(
                                                           fontSize: 35,
                                                           color: AppColors.CustomGreen
                                                       ),
                                                     ),
                                                   ),

                                                   const Text("ابحث عن الحالات التي ترغب ان تذهب له زكاتك"),
                                                   const SizedBox(
                                                     height: 20,
                                                   ),
                                                   DefaultButton(
                                                     Function: () {
                                                       NavgatetoPage(
                                                           context: context,
                                                           page: const LayoutScreen()
                                                       );
                                                     },
                                                     ButtonText: "المتابع للدفع",
                                                   )
                                                 ],
                                               ),
                                             ),
                                           ),
                                         ),
                                       );
                                    }
                                    // Silver Function Call
                                    if(formKey2.currentState!.validate())
                                     {
                                      double zakatvalue=calculateSilverZakat(double.parse(priceOfSilver.text), double.parse(silverWeight.text));
                                      showModalBottomSheet(
                                        shape: const OutlineInputBorder(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(15),
                                                topLeft: Radius.circular(15)),
                                            borderSide: BorderSide(color: Colors.transparent)),
                                        isScrollControlled: false,
                                        context: context,
                                        builder: (BuildContext context) => SizedBox(
                                          height: 300,
                                          width: double.infinity,
                                          child: Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: SingleChildScrollView(
                                              physics: const BouncingScrollPhysics(),
                                              child: Column(
                                                children: [
                                                  const Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 15),
                                                    child: Text(
                                                      "قيمة الزكاة",
                                                      style: TextStyle(fontSize: 17),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 30),
                                                    child: Text(
                                                      "$zakatvalue",
                                                      style:  TextStyle(
                                                          fontSize: 35,
                                                          color: AppColors.CustomGreen
                                                      ),
                                                    ),
                                                  ),

                                                  const Text("ابحث عن الحالات التي ترغب ان تذهب له زكاتك"),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  DefaultButton(
                                                    Function: () {
                                                      NavgatetoPage(
                                                          context: context,
                                                          page: const LayoutScreen()
                                                      );
                                                    },
                                                    ButtonText: "المتابع للدفع",
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    // Silver Function Call
                                    if(formKey3.currentState!.validate())
                                     {
                                       double zakatvalue= calculateGoldZakat(double.parse(priceofGold.text), double.parse(goldWeight.text));
                                       showModalBottomSheet(
                                         shape: const OutlineInputBorder(
                                             borderRadius: BorderRadius.only(
                                                 topRight: Radius.circular(15),
                                                 topLeft: Radius.circular(15)),
                                             borderSide: BorderSide(color: Colors.transparent)),
                                         isScrollControlled: false,
                                         context: context,
                                         builder: (BuildContext context) => SizedBox(
                                           height: 300,
                                           width: double.infinity,
                                           child: Directionality(
                                             textDirection: TextDirection.rtl,
                                             child: SingleChildScrollView(
                                               physics: const BouncingScrollPhysics(),
                                               child: Column(
                                                 children: [
                                                   const Padding(
                                                     padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 15),
                                                     child: Text(
                                                       "قيمة الزكاة",
                                                       style: TextStyle(fontSize: 17),
                                                     ),
                                                   ),
                                                   Padding(
                                                     padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 30),
                                                     child: Text(
                                                       "$zakatvalue",
                                                       style:  TextStyle(
                                                           fontSize: 35,
                                                           color: AppColors.CustomGreen
                                                       ),
                                                     ),
                                                   ),

                                                   const Text("ابحث عن الحالات التي ترغب ان تذهب له زكاتك"),
                                                   const SizedBox(
                                                     height: 20,
                                                   ),
                                                   DefaultButton(
                                                     Function: () {
                                                       NavgatetoPage(
                                                           context: context,
                                                           page: const LayoutScreen()
                                                       );
                                                     },
                                                     ButtonText: "المتابع للدفع",
                                                   )
                                                 ],
                                               ),
                                             ),
                                           ),
                                         ),
                                       );
                                    }
                                  

                                  },
                                  ButtonText: "احسب"
                              )
                            ],
                          ),
                        ),
                      ),
                      const Text("regester"),
                    ]),
                  ),

                ],
              ),
            )
        )
    );
  }

  double calculateGoldZakat(double priceOfGold,double goldweight)
  {
    double value=  priceOfGold*goldweight;
    return calculateMoneyZakat(value);
  }
  double calculateSilverZakat(double priceOfSilver,double silverweight)
  {
    double value=  priceOfSilver*silverweight;
    return calculateMoneyZakat(value);
  }
  double calculateMoneyZakat(double value)
  {
    return value/ 40;
  }
}
