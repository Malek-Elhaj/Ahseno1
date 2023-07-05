import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:designapp/Modules/sectionsScreens/describtionScreen.dart';
import 'package:designapp/Services/CubitServices/DataCubitServices/ManageCasesCubit/cases_cubit.dart';
import 'package:designapp/Shared/CacheHelper.dart';
import 'package:designapp/Shared/Components.dart';
import 'package:designapp/Shared/Style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewCasesScreen extends StatefulWidget {
  const NewCasesScreen({Key? key}) : super(key: key);

  @override
  State<NewCasesScreen> createState() => _NewCasesScreenState();
}

class _NewCasesScreenState extends State<NewCasesScreen> {
  List<Map<String, dynamic>> request=[];
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<CasesCubit>(context).getRequestes();
  }
  @override
  Widget build(BuildContext context) {
    var rejectionController=TextEditingController();

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

    var formKey=GlobalKey<FormState>();


    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: defaultAppBar(title: "طلبات الحالات الجديدة",context: context),
        body: BlocBuilder<CasesCubit, CasesState>(
          builder: (context, state) {
    if(state is ManageCases && (state).requestes.length > 0) {
      request.clear();
      request = (state).requestes;
      return ListView.separated(
          itemBuilder: (context, index) =>
              defaultCardItem(
                  image: "Assets/images/SliderImages/muslims-reading-from-quran.jpg",
                  itemTitle: "${request[index]["title"]}",
                  leftnumber: (request[index]["req"]-request[index]["total"]).toString()+" د.ل ",
                  textButton1: "قبول الحالة",
                  textButton2: "رفض الحالة",
                  buttonColor: "#45C4B0",
                  buttonColor2: "#ff5c33",
                  percent: 0.3,
                  percentvalue: (request[index]["total"]/request[index]["req"]*100).toStringAsFixed(2),
                  percentcolor: "#45C4B0",
                  function: () async{
                    if (true) {
                      final data = {
                        "title": request[index]["title"],
                        "mostafid": request[index]["mostafid"],
                        "description": request[index]["description"],
                        "location": request[index]["location"],
                        "req": (request[index]["req"])!.toDouble(),
                        "date":request[index]["date"],
                        "section": request[index]["section"],
                        "total":request[index]["total"],
                        "uId":request[index]["uId"],
                      };
                      await FirebaseFirestore.instance.collection(request[index]["section"]).add(data);
                      await FirebaseFirestore.instance.collection("cases").doc(request[index]["id"]).delete();
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(snackBarDone);
                      setState(() {
                        //BlocProvider.of<CasesCubit>(context).getRequestes();
                        initState();
                      });
                    } else {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(snackBarFailed);
                    }
                  },
                  function2: () {
                    var data = request[index];
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) =>
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 20.0),
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        bottom: MediaQuery
                                            .of(context)
                                            .viewInsets
                                            .bottom
                                    ),
                                    width: double.infinity,
                                    child: Form(
                                      key: formKey,
                                      child: Column(
                                        children: [
                                          const SizedBox(height: 15,),
                                          Text(
                                            "نموذج الرفض",
                                            style: TextStyle(
                                                color: AppColors.CustomGrey,
                                                fontSize: 18
                                            ),
                                          ),
                                          DefaultTextField(
                                              label: "سبب الرفض",
                                              textcontroller: rejectionController,
                                              function: (value) {
                                                if (value!.isEmpty) {
                                                  return "رجاء ادخال سبب الرفض";
                                                }
                                              }
                                          ),
                                          const SizedBox(height: 10,),
                                          DefaultButton(
                                              Function: () async{
                                                await FirebaseFirestore.instance.collection("cases").doc(data["id"]).set(
                                                    {
                                                      "title": data["title"],
                                                      "description": data["description"],
                                                      "req": data["req"],
                                                      "mostafid": data["mostafid"],
                                                      "location": data["location"],
                                                      "date":data["date"],
                                                      "status":1,
                                                      "reason":rejectionController.text,
                                                      "total":data["total"],
                                                      "uId":data["uId"]
                                                    });
                                                if (formKey.currentState!
                                                    .validate()) {
                                                  Navigator.pop(context);
                                                  ScaffoldMessenger.of(context)
                                                    ..hideCurrentSnackBar()
                                                    ..showSnackBar(
                                                        snackBarDone);
                                                }
                                                else {
                                                  Navigator.pop(context);
                                                  ScaffoldMessenger.of(context)
                                                    ..hideCurrentSnackBar()
                                                    ..showSnackBar(
                                                        snackBarFailed);
                                                }
                                              },
                                              ButtonText: "انهاء العملية"
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        shape: const OutlineInputBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(16)),
                            borderSide: BorderSide(color: Colors.transparent)
                        )
                    );
                  },
                  ontab: () {
                    //NavgatetoPage(context: context, page: const DescribtionScreen());
                  },
                  onlongpress: () {

                  }
              ),
          separatorBuilder: (context, index) => const SizedBox(height: 10,),
          itemCount: request.length


      );
    }
    else {
      return Center(child:Text("لا توجد طلبات في الوقت الحالي"));
    }
  },
),
      ),
    );
  }
}
