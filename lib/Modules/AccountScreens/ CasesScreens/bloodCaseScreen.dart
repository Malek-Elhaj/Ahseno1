import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:designapp/Shared/CacheHelper.dart';
import 'package:designapp/Shared/Components.dart';
import 'package:designapp/Shared/Style.dart';
import 'package:flutter/material.dart';

const List<String> list = <String>[
  "A+",
  "A-",
  "B+",
  "B-",
  "AB+",
  "AB-",
  "O+",
  "O-",
];
class bloodCaseScreen extends StatefulWidget {
  const bloodCaseScreen({Key? key}) : super(key: key);


  @override
  State<bloodCaseScreen> createState() => _bloodCaseScreenState();
}
bool iconvisiblity=true;
class _bloodCaseScreenState extends State<bloodCaseScreen> {

  String dropdownValue = list.first;

  TextEditingController title=TextEditingController();
  TextEditingController location=TextEditingController();
  TextEditingController number=TextEditingController();

  Timestamp ts = Timestamp.fromDate(DateTime.now());

  @override
  Widget build(BuildContext context) {

   // var formKey=GlobalKey<FormState>();
   //  print(CacheHelper.getData(key: "uId"));




    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: defaultAppBar(title: "أنشاء حالة تبرع",context: context),
        body: SingleChildScrollView(
          // physics: const BouncingScrollPhysics(),
          child: Form(
            //key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20,bottom: 10,right: 10),
                        child: Row(
                          children: [
                            Text(
                                "نموذج أنشاء حالة",
                              style: TextStyle(
                                color: AppColors.CustomGreen,
                                fontSize: 15
                              ),
                            ),
                          ],
                        ),
                      ),
                  Container(

                    child: DropdownButton<String>(

                      value: dropdownValue,
                      icon: const Icon(Icons.bloodtype_outlined,color: Colors.red),
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),

                      items: list.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,style: TextStyle(
                            fontWeight: FontWeight.bold,

                          )),
                        );
                      }).toList(),

                      onChanged: (String? value) {
                        setState(() {

                          dropdownValue = value!;
                        }
                        );
                      },



                    ),
                  ),
                      DefaultTextField(
                          label: "المكان",
                          textcontroller: location,
                          function: (value){
                            return null;
                          }
                      ),
                      DefaultTextField(
                          label: "رقم الهاتف",
                          textcontroller: number,
                          function: (value){
                            return null;
                          }
                      ),

                      DefaultButton(
                          Function: ()async{
                            final data = {
                              "type": dropdownValue.toString(),
                              "phone": number.text,
                              "location": location.text,
                              "date": DateTime.now(),
                              "uId":CacheHelper.getData(key: "uId")};
                            await FirebaseFirestore.instance.collection("blood").add(data);
                          },
                          ButtonText: "إضافة الحالة"
                      )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
