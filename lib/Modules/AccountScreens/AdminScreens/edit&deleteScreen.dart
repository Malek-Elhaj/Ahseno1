import 'package:designapp/Services/CubitServices/DataCubitServices/SectionsCubit/sections_cubit.dart';
import 'package:designapp/Shared/Components.dart';
import 'package:designapp/Shared/Style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditCasesScreen extends StatefulWidget {

  EditCasesScreen({super.key});

  @override
  State<EditCasesScreen> createState() => _EditCasesScreenState();
}
List<Map<String, dynamic>> requests = [];
class _EditCasesScreenState extends State<EditCasesScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<SectionsCubit>(context).getRequests();
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: defaultAppBar(title: "طلبات الحذف والتعديل",context: context),
        body: BlocBuilder<SectionsCubit, SectionsState>(
        builder: (context, state) {
    if(state is RequestsLoaded && state.requests.length>0) {
      requests.clear();
      requests += state.requests;
      return ListView.separated(
          itemBuilder: (context, index) =>
              differentcaseCard(
                image: 'Assets/images/SliderImages/muslims-reading-from-quran.jpg',
                itemTitle: "${requests[index]["title"]}",
                leftnumber: "${requests[index]["req"]}",
                bottomCardColor: "#45C4B0",
                ontab: () {
                  showModalBottomSheet(
                      shape: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16)),
                      ),
                      context: context,
                      builder: (context) =>
                          SizedBox(
                            height: 200,
                            width: double.infinity,
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "${requests[index]["reason"]}",
                                    style: TextStyle(
                                        color: AppColors.CustomGrey
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                  );
                },
                bottomtitle: "${requests[index]["reason"]}",
              ),
          separatorBuilder: (context, index) => const SizedBox(height: 10,),
          itemCount: requests.length
      );
    }
    else{
      return Center(child: Text("لا توجد طلبات تعديل"));
    }
  },
),
      ),
    );
  }
}
