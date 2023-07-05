import 'package:designapp/Shared/Style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class SMSDontaionsScreen extends StatelessWidget {
  const SMSDontaionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final List<String> iTemsMontly = [
      "0.5",
      "1",
      "5",
      "7",
      "12",
    ];
    final List<String> iTemsOnce=[
      "10",
      "20",
      "40",
      "60",
      "100",
    ];

    Future<void> lan()
    async {
      final Uri url=Uri(scheme: "sms",path: "5005");
      if(!await launchUrl(
          url,
          mode: LaunchMode.externalApplication
      )) {
        throw "Error in launching";
      }
    }

    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text(
                "تبرع برسالة",
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
            body:  DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    width: double.infinity,
                    child: TabBar(
                        overlayColor: MaterialStateColor.resolveWith(
                                (states) => Colors.white),
                        isScrollable: true,
                        labelStyle: GoogleFonts.cairo(fontSize: 13),
                        labelColor: AppColors.CustomBlue,
                        labelPadding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        indicatorColor: AppColors.CustomBlue,
                        indicatorWeight: 1,
                        indicatorPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                        unselectedLabelColor: AppColors.CustomGrey,
                        padding: const EdgeInsets.symmetric(horizontal: 100),
                        tabs: const [
                          Tab(
                            text: 'تبرع بشكل شهري',
                          ),
                          Tab(
                            text: 'تبرع مرة واحدة',
                          ),
                        ]
                    ),
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
                                      height: 45,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        borderRadius:  const BorderRadius.only(topRight: Radius.circular(16),topLeft: Radius.circular(16)),
                                        color: AppColors.CustomBlue,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "ارسل رقم ${iTemsMontly[index]} للتبرع ب",
                                          style: TextStyle(
                                            color: AppColors.CustomWhite,
                                            fontSize: 15
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children:  [
                                              Text(
                                                  iTemsMontly[index],
                                                style: TextStyle(
                                                  color: AppColors.CustomGreen,
                                                  fontSize: 30
                                                ),
                                              ),
                                              Text(
                                                  "دينار يوميا لمدة شهر",
                                                style: TextStyle(
                                                  color: AppColors.CustomGrey,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(top: 55),
                                              child: Icon(
                                                  Icons.try_sms_star_outlined,
                                                size: 17,
                                                color: AppColors.CustomGreen,
                                              ),
                                            ),
                                            const SizedBox(width: 4,),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 15.0,top: 55),
                                              child: TextButton(
                                                style: TextButton.styleFrom(
                                                    padding: EdgeInsets.zero
                                                ),
                                                onPressed: () {
                                                  lan();
                                                },
                                                child: Text(
                                                  "اشترك الأن",
                                                  style: TextStyle(
                                                      color: AppColors.CustomGreen,
                                                      fontSize: 16
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ),
                          itemCount: iTemsMontly.length
                      ),
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
                                        height: 45,
                                        width: MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          borderRadius:  const BorderRadius.only(topRight: Radius.circular(16),topLeft: Radius.circular(16)),
                                          color: AppColors.CustomBlue,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "ارسل رقم ${iTemsOnce[index]} للتبرع ب",
                                            style: TextStyle(
                                                color: AppColors.CustomWhite,
                                                fontSize: 15
                                            ),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children:  [
                                                Text(
                                                  iTemsOnce[index],
                                                  style: TextStyle(
                                                      color: AppColors.CustomGreen,
                                                      fontSize: 30
                                                  ),
                                                ),
                                                Text(
                                                  "دينار يوميا لمدة شهر",
                                                  style: TextStyle(
                                                    color: AppColors.CustomGrey,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(top: 55),
                                                child: Icon(
                                                  Icons.try_sms_star_outlined,
                                                  size: 17,
                                                  color: AppColors.CustomGreen,
                                                ),
                                              ),
                                              const SizedBox(width: 4,),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 15.0,top: 55),
                                                child: TextButton(
                                                  style: TextButton.styleFrom(
                                                      padding: EdgeInsets.zero
                                                  ),
                                                  onPressed: () {
                                                    lan();
                                                  },
                                                  child: Text(
                                                    "اشترك الأن",
                                                    style: TextStyle(
                                                        color: AppColors.CustomGreen,
                                                        fontSize: 16
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                          ),
                          itemCount: iTemsOnce.length
                      ),
                    ]),
                  ),
                ],
              ),
            )
        ));

  }
}
