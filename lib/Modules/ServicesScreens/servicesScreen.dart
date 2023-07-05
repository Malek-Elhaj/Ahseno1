import 'package:designapp/Modules/ServicesScreens/BloodDonationScreen.dart';
import 'package:designapp/Modules/ServicesScreens/GoodShopScreen.dart';
import 'package:designapp/Modules/ServicesScreens/SMSDontaionsScreen.dart';
import 'package:designapp/Modules/ServicesScreens/ZakatScreen.dart';
import 'package:designapp/Modules/ShopCart/shopCartScreen.dart';
import 'package:designapp/Shared/Components.dart';
import 'package:designapp/Shared/Style.dart';
import 'package:flutter/material.dart';



class ServicesScreen extends StatelessWidget {

  final List<String> iTems = [
    "تبرع بالدم",
    "حساب الزكاة",
   // "تبرع بالرسائل",
   // "المتجر الخير",
    //"مركز الاخبار",
    // تبرعات رمضان و تبرعات العيد و الاضاحي
  ];

  final List<String> itemDescribtion=[
    "يمكنك التبرع بالدم و المساهمه في انقاد حياة شخص",
    "برنامج يتيح لك حساب الزكاة بأنواعها المختلفة",
    "خدمة للتبرع عبر الرسائل النصية " ,
    "اشتري منتج من منتجات الخير ",
    "تعرف على اخبار يمكنها مساعدتك"
  ];

  ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: defaultAppBar(
          title: "برامجنا",
          leadingicon: null,
          icon: Icons.shopping_cart_outlined,
          buttonfunction: (){
            NavgatetoPage(context: context, page: ShopCartScreen());
          }
      ),
      body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
                     child: SizedBox(
                       height: 90,
                       child: Card(
                         elevation: 5,
                         child: ListTile(
                             title: Text(iTems[index]),
                             subtitle: Text(
                               itemDescribtion[index],
                               style: TextStyle(
                                   fontSize: 10,
                                   color: AppColors.CustomGrey
                               ),
                             ),
                             trailing: Icon(
                               Icons.arrow_forward_ios_outlined,
                               size: 25,
                               color: AppColors.CustomBlue,
                             ),
                             onTap:() {
                                        switch (index) {
                                        case 0:
                                        NavgatetoPage(context: context, page: const BloodDonationScreen());
                                        break;
                                        case 1:
                                        NavgatetoPage(context: context, page: const ZakatScreen());
                                        break;
                                        case 2:
                                        NavgatetoPage(context: context, page: const SMSDontaionsScreen());
                                        break;
                                        case 3:
                                        NavgatetoPage(context: context, page: GoodShopScreen());
                                        break;
                                        case 4:
                                               break;

                                        }}
                         ),
                       ),
                     )
            /*ListTile(
                     title: Text(iTems[index]),
                     shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: Colors.black)),
                      minVerticalPadding: 20,
                      trailing: Icon(
                        Icons.arrow_circle_left_outlined,
                        color: AppColors.CustomBlue,
                        size: 35,
                      ),
                      onTap: () {
                        switch (index) {
                          case 0:
                                NavgatetoPage(context: context, page: BloodDonationScreen());
                                break;
                          case 1:
                                NavgatetoPage(context: context, page: ZakatScreen());
                                break;
                          case 2:
                            NavgatetoPage(context: context, page: SMSDontaionsScreen());
                            break;
                          case 3:
                            NavgatetoPage(context: context, page: GoodShopScreen());
                            break;
                          case 4:
                            break;

                        }
                      },
                ),*/
              ),
          itemCount: iTems.length
      ),
    );
  }
}
