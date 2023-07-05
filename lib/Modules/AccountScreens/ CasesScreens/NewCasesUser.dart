import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:designapp/Modules/sectionsScreens/describtionScreen.dart';
import 'package:designapp/Services/CubitServices/DataCubitServices/SectionsCubit/sections_cubit.dart';
import 'package:designapp/Shared/CacheHelper.dart';
import 'package:designapp/Shared/Components.dart';
import 'package:designapp/Shared/Style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewCasesUserScreen extends StatefulWidget {
  const NewCasesUserScreen({Key? key}) : super(key: key);

  @override
  State<NewCasesUserScreen> createState() => _NewCasesUserScreenState();
}

List<Map<String, dynamic>> myCases = [];

class _NewCasesUserScreenState extends State<NewCasesUserScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<SectionsCubit>(context).getMyCases();
  }

  @override
  Widget build(BuildContext context) {
    var rejectionController = TextEditingController();

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


    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: defaultAppBar(title: "الحالات المضافة", context: context),
        body: BlocBuilder<SectionsCubit, SectionsState>(
        builder: (context, state) {
    if(state is MyCasesLoaded && state.myCases.length>0) {
      myCases.clear();
      myCases += state.myCases;
      return ListView.separated(
          itemBuilder: (context, index) =>
              defaultCardItem(
                  image: "Assets/images/SliderImages/muslims-reading-from-quran.jpg",
                  itemTitle: "${myCases[index]["title"]}",
                  leftnumber: "${myCases[index]["req"]}",
                  textButton1: "تقديم طلب تعديل",
                  textButton2: "تقديم طلب حذف",
                  buttonColor: "#13678A",
                  buttonColor2: "#ff5c33",
                  percent: 0.0,
                  percentvalue: "30",
                  percentcolor: "#45C4B0",
                  function: () {

                    showModalBottomSheet(
                        context: context,
                        builder: (context) =>
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: SizedBox(
                                height: 250,
                                width: double.infinity,
                                child: Form(

                                  child: Column(
                                    children: [
                                      const SizedBox(height: 15,),
                                      Text(
                                        "طلب التعديل",
                                        style: TextStyle(
                                            color: AppColors.CustomGrey,
                                            fontSize: 18
                                        ),
                                      ),
                                      DefaultTextField(
                                          label: "أكتب الشي المراد تعديله",
                                          textcontroller: rejectionController,
                                          function: (value) {
                                            if (value!.isEmpty) {
                                              return "رجاء ادخال سبب التعديل";
                                            }
                                          }
                                      ),
                                      const SizedBox(height: 10,),
                                      DefaultButton(
                                          Function: () async{
                                            await FirebaseFirestore.instance.collection("${myCases[index]["section"]}").doc("${myCases[index]["id"]}").update({"request": "1","reason":rejectionController.text}).then((value)=> print("DocumentSnapshot successfully updated!"),
                                                onError: (e) => print("Error updating document $e"));
                                          },
                                          ButtonText: "انهاء العملية"
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        shape: const OutlineInputBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(16)),
                            borderSide: BorderSide(color: Colors
                                .transparent)
                        )
                    );
                  },
                  function2: () {
                    if (true) {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(snackBarDone);
                    } else {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(snackBarFailed);
                    }
                  },
                  ontab: () {
                    // NavgatetoPage(context: context, page: const DescribtionScreen());
                  },
                  onlongpress: () {

                  }
              ),
          separatorBuilder: (context, index) =>
          const SizedBox(height: 10,),
          itemCount: myCases.length
      );
    }
    else{
      return Center(child: Text("لا توجد حالات مضافة"));
    }
          },
        ),
      ),
    );
  }
}
