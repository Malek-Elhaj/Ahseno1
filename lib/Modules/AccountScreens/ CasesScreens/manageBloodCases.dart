import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:designapp/Services/CubitServices/DataCubitServices/BloodCubit/blood_cubit.dart';
import 'package:designapp/Shared/CacheHelper.dart';
import 'package:designapp/Shared/Components.dart';
import 'package:designapp/Shared/Style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ManageBloodCases extends StatefulWidget {
  const ManageBloodCases({Key? key}) : super(key: key);

  @override
  State<ManageBloodCases> createState() => _ManageBloodCasesState();
}

class _ManageBloodCasesState extends State<ManageBloodCases> {
  List<Map<String, dynamic>> blood=[];
  @override
  void initState() {
    BlocProvider.of<BloodCubit>(context).getMyBlood();
  print(BlocProvider.of<BloodCubit>(context).myBlood);
  print(CacheHelper.getData(key: "uId"));
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: defaultAppBar(
            title: "الحالات المضافة",
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
                        text: 'طلبات التبرع بالدم المضافة',
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
                            //blood.clear();
                            if(state is myBloodLooded && state.myBlood.length > 0){
                              blood.clear();
                              blood = (state).myBlood;
                              return myBloodCard(list: blood);
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
