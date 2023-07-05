import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:designapp/Shared/Components.dart';
import 'package:designapp/Shared/Style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GoodShopScreen extends StatelessWidget {


  static List<String> shopITems=[
    "طباعة و نشر المصاحف",
    "توفير احتياجات مسجد",
    "ثلاجات مياه",
    "توفير ملابس للمحتاجين"
  ];
  static List<String> prices=[
    "50","100","250","100"
  ];
  static List<AssetImage> images=[
    AssetImage("Assets/images/GoodShop/Quran2.jpg"),
    AssetImage("Assets/images/GoodShop/mosque2.jpg"),
    AssetImage("Assets/images/GoodShop/waterimage.jpg"),
    AssetImage("Assets/images/GoodShop/clothes.jpg"),
  ];

  final snackBarFailed = SnackBar(
    /// need to set following properties for best effect of awesome_snackbar_content
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: 'حدث خظأ',
      message:
      'حدث خظا عندة أضافة',

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
      'تمت عملية قبول بنجاح',

      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
      contentType: ContentType.success,
    ),
  );

  @override
  Widget build(BuildContext context) {

    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: defaultAppBar(
                title: "متجر الخير",
                context: context
            ),
            body:  DefaultTabController(
              length: 1,
              child: Column(
                children: [
                  TabBar(
                      overlayColor: MaterialStateColor.resolveWith(
                              (states) => Colors.white
                      ),
                      labelStyle: GoogleFonts.cairo(fontSize: 13),
                      labelColor: AppColors.CustomBlue,
                      labelPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                      indicatorColor: AppColors.CustomBlue,
                      indicatorWeight: 1,
                      indicatorPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                      unselectedLabelColor: AppColors.CustomGrey,
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                      tabs: const [
                        Tab(
                          text: 'منتجات الخير',
                        ),
                      ]
                  ),
                  Expanded(
                    child: TabBarView(children: [
                      //Default list of items
                      ListView.builder(
                          itemBuilder: (context, index) => Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
                              child: SizedBox(
                                height: 200,
                                child: Card(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 65,
                                        width: MediaQuery.of(context).size.width,
                                        decoration:  BoxDecoration(
                                          borderRadius: const BorderRadius.only(topRight: Radius.circular(16),topLeft: Radius.circular(16)),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                              colorFilter:  ColorFilter.mode(Colors.grey.withOpacity(0.8), BlendMode.darken,),
                                                image: images[index],
                                            )
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            shopITems[index],
                                            style: TextStyle(
                                                color: AppColors.CustomWhite,
                                                fontSize: 18
                                            ),
                                          ),
                                        )
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                           Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children:  [
                                                SizedBox(

                                                  child: Text(
                                                      "السعر",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: AppColors.CustomGrey
                                                    ),
                                                  )
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                        prices[index],
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
                                            padding: const EdgeInsets.only(left: 30,top: 22),
                                            child: DefaultButton(
                                                Function: (){
                                                  if(true)
                                                    {
                                                      ScaffoldMessenger.of(context)
                                                        ..hideCurrentSnackBar()
                                                        ..showSnackBar(snackBarDone);
                                                    }else{
                                                    ScaffoldMessenger.of(context)
                                                      ..hideCurrentSnackBar()
                                                      ..showSnackBar(snackBarFailed);
                                                  }

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

                    ]),
                  ),
                ],
              ),
            )
        ));
  }
}
