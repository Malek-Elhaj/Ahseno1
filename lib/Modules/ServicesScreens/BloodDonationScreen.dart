import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:designapp/Services/CubitServices/DataCubitServices/BloodCubit/blood_cubit.dart';
import 'package:designapp/Shared/Components.dart';
import 'package:designapp/Shared/Style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class BloodDonationScreen extends StatefulWidget {
  const BloodDonationScreen({Key? key}) : super(key: key);

  @override
  State<BloodDonationScreen> createState() => _BloodDonationScreenState();
}

class _BloodDonationScreenState extends State<BloodDonationScreen> {
  List<Map<String, dynamic>> blood=[];

  @override
  void initState() {
    BlocProvider.of<BloodCubit>(context).getAllBlood();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: defaultAppBar(
            title: "تبرع بالدم",
            context: context
        ),
        body:  DefaultTabController(
          length: 1,
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: TabBar(
                    overlayColor: MaterialStateColor.resolveWith(
                            (states) => Colors.white),
                    isScrollable: false,
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
                        text: 'محتاجين الدم',
                      ),
                    ]
                ),
              ),
              Expanded(
                child: TabBarView(children: [
                  //Default list of items
                    ConditionalBuilder(
                      condition: true,
                      builder: (BuildContext context){
                        return BlocBuilder<BloodCubit,BloodState>(
                          builder:(context,state){
                            if(state is BloodLooded){
                              blood = (state).blood;
                              return bloodDonationCard(list: blood);
                            }else
                              {
                                return Center(child: CircularProgressIndicator());
                              }
                          }
                        );
                      },
                      fallback: (BuildContext context)=>  Center(
                        child: CircularProgressIndicator(
                          color: AppColors.CustomGreen,
                        ),
                      )
                  ),
                   //  Center(
                   //     child: CircularProgressIndicator(
                   //       color: AppColors.CustomGreen,
                   //     )
                   // ),
                ]),
              ),
            ],
          ),
        )
    ));
  }
}
