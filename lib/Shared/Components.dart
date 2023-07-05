import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:designapp/Modules/ShopCart/shopCartScreen.dart';
import 'package:designapp/Services/CubitServices/DataCubitServices/BloodCubit/blood_cubit.dart';
import 'package:designapp/Shared/Cubit/cubit.dart';
import 'package:designapp/Shared/Style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

Widget DefaultButton(
    {double minWidth = 327,
    double height = 48,
    required VoidCallback Function,
    required String ButtonText,
    double radius = 5,
    Color borderColor = Colors.transparent,
    String hexColor = '#13678A',
    Color fontcolor= Colors.white,
    double fontsize= 14
    }
    ) {
  return MaterialButton(
    shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(color: borderColor)),
    minWidth: minWidth,
    height: height,
    color: HexColor(hexColor!),
    onPressed: Function,
    child: Text(
      ButtonText,
      style: GoogleFonts.cairo(
          color: fontcolor,
          fontSize: fontsize
      ),
    ),
  );
}

Widget DefaultTextField({
  required String label,
  required TextEditingController textcontroller,
  required FormFieldValidator<String> function,
  IconData? prefixicon,
  IconData? suffixicon,
  VoidCallback? suffixiconFunction,
  double? raduis = 10,
  String hexcolor = "#BCE0FD",
  TextInputType? keyboardtype,
  bool isvisible = false,
  double paddingLR = 20,
  double paddingTB = 20,
  bool isExpaned=false,
  int? maxline=1,
  String? initialvalue
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: paddingLR, vertical: paddingTB),
    child: TextFormField(
      decoration: InputDecoration(
        label: Text(
          label,
          style: GoogleFonts.cairo(color: Colors.grey),
        ),
        prefixIcon: Icon(prefixicon),
        suffixIcon: IconButton(
          onPressed: suffixiconFunction,
          icon: Icon(suffixicon),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(raduis!),
            borderSide: BorderSide(color: HexColor(hexcolor))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: HexColor(hexcolor))),
      ),
      keyboardType: keyboardtype,
      initialValue: initialvalue,
      controller: textcontroller,

      expands: isExpaned,
      validator: function,
      maxLines: maxline,
      obscureText: isvisible,
    ),
  );
}

Widget DefaultTextField2({
  required String label,
  required TextEditingController textcontroller,
  required FormFieldValidator<String> function,
  Widget? prefixicon,
   Widget? suffixicon,
  double? raduis = 10,
  String hexcolor = "#BCE0FD",
  TextInputType? keyboardtype,
  bool isvisible = false,
  double paddingLR = 20,
  double paddingTB = 20,
  bool isExpaned=false,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: paddingLR, vertical: paddingTB),
    child: TextFormField(
        decoration: InputDecoration(
          label: Text(
            label,
            style: GoogleFonts.cairo(color: Colors.grey),
          ),
          prefixIcon: prefixicon,
          suffixIcon: suffixicon,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(raduis!),
              borderSide: BorderSide(color: HexColor(hexcolor))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: HexColor(hexcolor))),
        ),
        expands: isExpaned,
        keyboardType: keyboardtype,
        controller: textcontroller,
        validator: function,
        obscureText: isvisible,

    ),
  );
}

Future NavgatetoPage({required context, required page}) {
  return Navigator.push(
      context, MaterialPageRoute(builder: (BuildContext context) => page));
}

Future NavgateNoGoBack({required context, required page}) {
  return Navigator.pushAndRemoveUntil(
        context,
       MaterialPageRoute(builder: (BuildContext context) => page),
        (route) => false
      );
}

Widget defaultCardItem(
        {
          required String image,
        required String itemTitle,
        required String leftnumber,
        String percentvalue = "0",
        double percent = 0,
        String percentcolor = "#45C4B0",
        String textButton1 = "تبرع الأن",
        String textButton2 = "أضافة للسلة",
        required VoidCallback function,
        required VoidCallback function2,
        String buttonColor = "#13678A",
        String buttonColor2 = "#45C4B0",
        required VoidCallback ontab,
        required VoidCallback onlongpress}
    ) =>
    InkWell(
      onTap: ontab,
      onLongPress: onlongpress,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    blurStyle: BlurStyle.outer,
                    spreadRadius: 1,
                    blurRadius: 1,
                    color: Colors.grey)
              ]),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.only(top: 8.0, right: 8),
                        child: Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          height: 100,
                          width: 110,
                          child: Image(
                              fit: BoxFit.cover, image: AssetImage(image)),
                        )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),

                  //Text of the Items
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            itemTitle,
                            maxLines: 2,
                            style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "المتبقي",
                            style: TextStyle(fontSize: 10),
                          ),
                          Text(leftnumber)
                        ],
                      ),
                    ),
                  ),

                  //Circle of percent
                  const SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    child: CircularPercentIndicator(
                      radius: 35.0,
                      lineWidth: 1.5,
                      percent: percent,
                      center: Text(percentvalue + "%"),
                      progressColor: HexColor(percentcolor),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 10,
              ),
              //Buttons of payment & Add To Cart
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      DefaultButton(
                          hexColor: buttonColor,
                          Function: function,
                          ButtonText: textButton1),
                      const SizedBox(
                        height: 10,
                      ),
                      DefaultButton(
                          hexColor: buttonColor2,
                          Function: function2,
                          ButtonText: textButton2),
                    ],
                  )
                ],
              ),

              /*  LinearPercentIndicator(
                                                    width: 100.0,
                                                    lineHeight: 10.0,
                                                    percent: 1,
                                                    fillColor: Colors.grey,
                                                    curve: Curves.linear,
                                                    progressColor: Colors.blue,

                                                  )*/
            ],
          ),
        ),
      ),
    );

Widget defaultShopCardItem({
  required String image,
  required String itemTitle,
  required String leftnumber,
  String percentvalue = "0",
  double percent = 0,
  String percentcolor = "#45C4B0",
  String textButton = "الغاء من السلة",
  required VoidCallback function,
  String buttonColor = "#E74E4E",
}) =>
    Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  blurStyle: BlurStyle.outer,
                  spreadRadius: 1,
                  blurRadius: 1,
                  color: Colors.grey)
            ]),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(top: 8.0, right: 8),
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        height: 100,
                        width: 110,
                        child:
                            Image(fit: BoxFit.cover, image: AssetImage(image)),
                      )),
                ),
                const SizedBox(
                  width: 10,
                ),

                //Text of the Items
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          itemTitle,
                          maxLines: 2,
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "المتبقي",
                          style: TextStyle(fontSize: 10),
                        ),
                        Text(leftnumber)
                      ],
                    ),
                  ),
                ),

                //Circle of percent
                const SizedBox(
                  width: 40,
                ),
                Expanded(
                  child: CircularPercentIndicator(
                    radius: 35.0,
                    lineWidth: 1.5,
                    percent: percent,
                    center: Text(percentvalue + "%"),
                    progressColor: HexColor(percentcolor),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 10,
            ),
            //Buttons of payment & Add To Cart
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    DefaultButton(
                        hexColor: buttonColor,
                        Function: function,
                        ButtonText: textButton),
                  ],
                )
              ],
            ),

            /*  LinearPercentIndicator(
                                                 width: 100.0,
                                                 lineHeight: 10.0,
                                                 percent: 1,
                                                 fillColor: Colors.grey,
                                                 curve: Curves.linear,
                                                 progressColor: Colors.blue,

                                               )*/
          ],
        ),
      ),
    );

Future DefaultPaymentBottomSheet(context) {
  Cubit_Class c=Cubit_Class.get(context);
  TextEditingController paymentController=TextEditingController();
  return  showModalBottomSheet(
    shape: const OutlineInputBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15)),
        borderSide: BorderSide(color: Colors.transparent)),
    isScrollControlled: false,
    context: context,
    builder: (BuildContext context) => Container(
      height: 450,
      width: double.infinity,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "تبرع سريع",
                  style: TextStyle(fontSize: 17),
                ),
              ),
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
                          if (c.isclicked == false) {
                            paymentController.text =
                                c.PressedPayment(
                                    "Paymentcontanier1");
                          }
                          c.isclicked = false;
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(10),
                              border: Border.all(
                                  color: HexColor("#BCE0FD")),
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
                                "50",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: HexColor("#707070")),
                              ),
                              Text(
                                "د.ل",
                                style: TextStyle(
                                    color: HexColor("#707070")),
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
                          if (c.isclicked == false) {
                            paymentController.text =
                                c.PressedPayment(
                                    "Paymentcontanier2");
                          }
                          c.isclicked = false;
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(10),
                              border: Border.all(
                                  color: HexColor("#BCE0FD")),
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
                                    color: HexColor("#707070")),
                              ),
                              Text(
                                "د.ل",
                                style: TextStyle(
                                    color: HexColor("#707070")),
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
                          if (c.isclicked == false) {
                            paymentController.text =
                                c.PressedPayment(
                                    "Paymentcontanier3");
                          }
                          c.isclicked = false;
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(10),
                              border: Border.all(
                                  color: HexColor("#BCE0FD")),
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
                                "200",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: HexColor("#707070")),
                              ),
                              Text(
                                "د.ل",
                                style: TextStyle(
                                    color: HexColor("#707070")),
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
                textcontroller: paymentController,
                function: (value) {
                  return null;
                },
              ),
              const Text("سيذهب تبرعب للحالات الأشد احتياجا"),
              const SizedBox(
                height: 20,
              ),
              DefaultButton(
                Function: () {},
                ButtonText: "تبرع لأن",
              )
            ],
          ),
        ),
      ),
    ),
  );
}

/*Container(
                                                      height: 300,
                                                      padding: EdgeInsets.only(
                                                          bottom: MediaQuery.of(context).viewInsets.bottom
                                                      ),
                                                      width: MediaQuery.of(context).size.width,
                                                      child: Column(
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.all(20.0),
                                                            child: Text(
                                                                "أدخل رمز التحقق",
                                                              style: TextStyle(
                                                                fontSize: 17,
                                                                color: AppColors.CustomGrey
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(height: 10,),
                                                          DefaultTextField(
                                                              label: "رمز التحقق",
                                                              textcontroller: code,
                                                              function: (value){
                                                                if(value!.isEmpty)
                                                                  {
                                                                    return "يجد ادخال رمز التحقق";
                                                                  }else{
                                                                  if(value.length<6)
                                                                    {
                                                                      return "رجاء تاكد من رمز التحقق";
                                                                    }
                                                                }
                                                              }
                                                          ),
                                                          SizedBox(height: 40,),
                                                          DefaultButton(
                                                              Function: (){

                                                              },
                                                              ButtonText: "أنشاء الحساب"
                                                          )
                                                        ],
                                                      ),
                                                    ),*/

Widget bloodDonationCard ({Axis Scroll = Axis.vertical,List<Map<String, dynamic>>? list}){
  Future<void> _lan(String path)
  async {
    final Uri url=Uri(scheme: "tel",path: path);
    if(!await launchUrl(
        url,
        mode: LaunchMode.externalApplication
    )) {
      throw "Error in launching";
    }
  }

  return  ListView.separated(
      scrollDirection: Scroll,
      itemBuilder: (context,index)=> Container(
          height: 250,
          width: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.CustomGrey,
                            blurRadius: 4,
                            blurStyle: BlurStyle.outer
                        )
                      ]
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 30,
                        clipBehavior: Clip.hardEdge,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16)),
                          color: Colors.redAccent,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text(
                               "الفصيلة :    ${list![index]['type']}",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 18
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top:14.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: AppColors.CustomGrey,
                                    size: 18,
                                  ),
                                  Text(
                                    "${list![index]['location']}",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.CustomGrey,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height:8,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    const SizedBox(height: 5,),
                                    Text(
                                      " ",
                                      style: TextStyle(
                                          fontSize: 11,
                                          color: AppColors.CustomGrey
                                      ),
                                    ),
                                    Text(
                                      " ",
                                      style: TextStyle(
                                          color: AppColors.CustomGreen
                                      ),
                                    )
                                  ],
                                ),
                                DefaultButton(
                                    Function: ()  {
                                      _lan(list![index]['phone']);
                                    },
                                    ButtonText: "اتصل بنا",
                                    minWidth: 100

                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
      ),
      separatorBuilder: (context,index)=> const SizedBox(width: 10,),
      itemCount: list!.length
  );
}
Widget myBloodCard ({Axis Scroll = Axis.vertical,List<Map<String, dynamic>>? list}){
  return  ListView.separated(
      scrollDirection: Scroll,
      itemBuilder: (context,index)=> Container(
          height: 250,
          width: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.CustomGrey,
                            blurRadius: 4,
                            blurStyle: BlurStyle.outer
                        )
                      ]
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 30,
                        clipBehavior: Clip.hardEdge,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16)),
                          color: Colors.redAccent,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "الفصيلة :    ${list![index]['type']}",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 18
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top:14.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: AppColors.CustomGrey,
                                    size: 18,
                                  ),
                                  Text(
                                    "${list![index]['location']}",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.CustomGrey,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height:8,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    const SizedBox(height: 5,),
                                    Text(
                                      " ",
                                      style: TextStyle(
                                          fontSize: 11,
                                          color: AppColors.CustomGrey
                                      ),
                                    ),
                                    Text(
                                      " ",
                                      style: TextStyle(
                                          color: AppColors.CustomGreen
                                      ),
                                    )
                                  ],
                                ),
                                DefaultButton(
                                    Function: ()  async{
                                     await FirebaseFirestore.instance.collection("blood").doc(list[index]["id"]).delete();
                                     //BlocProvider.of<BloodCubit>(context).getMyBlood();
                                    },
                                    ButtonText: "حذف",
                                    minWidth: 70
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
      ),
      separatorBuilder: (context,index)=> const SizedBox(width: 10,),
      itemCount: list!.length
  );
}
PreferredSizeWidget defaultAppBar(
      {
        required String title,
        IconData? icon,
        VoidCallback? buttonfunction,
        IconData? leadingicon=Icons.arrow_back,
        String leftIconColor="#FFFFFF",
        context
      }
    ){
  return AppBar(
      title:  Text(
        title,
        style: const TextStyle(
            fontSize: 17
        ),
      ),
      actions: [
        IconButton(
            onPressed: buttonfunction,
            icon: Icon(
                icon,
                color: HexColor(leftIconColor),
            ))
      ],
      leading: IconButton(
        onPressed:(){
          Navigator.pop(context);
        },
        icon: Icon(leadingicon),
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: AppColors.CustomLinearGradient
        ),
      ),
    );
}

PreferredSizeWidget defaultAppBar2({
  IconData? icon,
  String iconColor ="#45C4B0",
  double sizeIcon= 24,
  VoidCallback? buttonfunction
})
{
  return AppBar(
        backgroundColor: Colors.white,
        title: const Image(
              height: 40,
              width: 40,
              image: AssetImage("Assets/images/wellness-logo.png"),
        ),
        actions: [
                Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: IconButton(
                      onPressed: buttonfunction,
                      icon: Icon(
                      icon,
                      color: HexColor(iconColor),
                      size: sizeIcon,
                      )
                      ),
                ),
        ],
  );
}


Widget differentcaseCard(
    {
      required String image,
      required String itemTitle,
      required String leftnumber,
      String percentvalue = "0",
      double percent = 0,
      String percentcolor = "#45C4B0",
      VoidCallback? ontab,
      required String bottomtitle,
      String bottomCardColor = "#EF4E44",
      String textColor= "F6F6F6",
      Alignment textAlignment=Alignment.topRight
    }
    ) =>
    InkWell(
      onTap: ontab,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: 218,
          width: double.infinity,
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
              boxShadow:  [
                BoxShadow(
                    blurStyle: BlurStyle.outer,
                    spreadRadius: 1,
                    blurRadius: 1,
                    color: Colors.grey)
              ]
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.only(top: 8.0, right: 8),
                        child: Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          height: 100,
                          width: 110,
                          child: Image(
                              fit: BoxFit.cover, image: AssetImage(image)),
                        )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),

                  //Text of the Items
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            itemTitle,
                            maxLines: 2,
                            style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "المتبقي",
                            style: TextStyle(fontSize: 10),
                          ),
                          Text(leftnumber)
                        ],
                      ),
                    ),
                  ),

                  //Circle of percent
                  const SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    child: CircularPercentIndicator(
                      radius: 35.0,
                      lineWidth: 1.5,
                      percent: percent,
                      center: Text("$percentvalue%"),
                      progressColor: HexColor(percentcolor),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                 height: 80,
                 width: double.infinity,
                 clipBehavior: Clip.hardEdge,
                 alignment: textAlignment,
                 decoration:  BoxDecoration(
                     borderRadius: const BorderRadius.vertical(bottom:Radius.circular(35) ),
                     color: HexColor(bottomCardColor),
                 ),
                 child: Padding(
                   padding: const EdgeInsets.all(10.0),
                   child: Text(
                     bottomtitle,
                     style: TextStyle(
                       color: HexColor(textColor),
                       overflow: TextOverflow.ellipsis
                     ),
                     maxLines: 2,
                   ),
                 ),
               )
            ],
          ),
        ),
      ),
    );


void showSuccessToast(String message,context){
  return MotionToast.success(
      title: const Text('تمت العملية بنجاح'),
      description: Text(message),
      layoutOrientation: ToastOrientation.rtl,
  ).show(context);
}

void showFailedToast(String message,context){
  return MotionToast.error(
      title: const Text('حدث خظأ'),
      description: Text(message),
      layoutOrientation: ToastOrientation.rtl,
  ).show(context);
}

void showInfoToast(String message,context){
  return MotionToast.info(
    title: const Text('تحدير'),
    description: Text(message),
    layoutOrientation: ToastOrientation.rtl,
  ).show(context);
}
