import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:designapp/Shared/CacheHelper.dart';
import 'package:designapp/Shared/Components.dart';
import 'package:designapp/Shared/Style.dart';
import 'package:flutter/material.dart';

const List<String> list = <String>['قسم المشاريع الخيرية', 'قسم المديونين','قسم المؤونة'];
String val="projects";
class CreateCaseScreen extends StatefulWidget {
  const CreateCaseScreen({Key? key}) : super(key: key);


  @override
  State<CreateCaseScreen> createState() => _CreateCaseScreenState();
}
String selectedImage="";
bool iconvisiblity=true;
class _CreateCaseScreenState extends State<CreateCaseScreen> {

  String dropdownValue = list.first;

  TextEditingController title=TextEditingController();
  TextEditingController location=TextEditingController();
  TextEditingController number=TextEditingController();
  TextEditingController mony=TextEditingController();
  TextEditingController description=TextEditingController();

  Timestamp ts = Timestamp.fromDate(DateTime.now());

  @override
  Widget build(BuildContext context) {

   // var formKey=GlobalKey<FormState>();
   //  print(CacheHelper.getData(key: "uId"));
    List<String> images=[
      "Assets/images/GoodShop/clothes.jpg",
      "Assets/images/SliderImages/muslims-reading-from-quran.jpg",
      "Assets/images/SliderImages/homeless-woman-holding-hands-out-help.jpg",
      "Assets/images/SliderImages/elderly-men-are-exposed-rainwater-dry-weather-global-warming.jpg",
    ];



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
                        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 20),
                        child: Center(
                          child: Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            // clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: AppColors.CustomGrey.withOpacity(0.3),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("Assets/images/GoodShop/clothes.jpg")
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.CustomGrey,
                                  spreadRadius: 0.5,
                                  blurRadius: 10
                                )
                              ]
                            ),

                            child:  Visibility(
                              visible: iconvisiblity,
                              child: Icon(
                                  Icons.add_photo_alternate_outlined,
                                  color: AppColors.CustomWhite,
                                  size: 35,
                              ),
                            ),

                          ),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        width: double.infinity,
                        child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context,index){
                              return   Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: InkWell(
                                  onTap: (){
                                    setState(() {
                                       iconvisiblity=false;
                                       selectedImage=images[index];
                                    });
                                  },
                                  child: Card(
                                    clipBehavior: Clip.hardEdge,
                                    elevation: 3,
                                    shadowColor: AppColors.CustomGrey,
                                    child:  Image(
                                      image: AssetImage(images[index]),
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context,index)=> const SizedBox(width: 10,),
                            itemCount: images.length
                        ),
                      ),
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
                  Row(
                    children: [
                      Padding(padding: EdgeInsetsDirectional.only(start: 35)),
                      Text('القسم'),
                      SizedBox(width: 30,),
                      Container(

                        child: DropdownButton<String>(

                          value: dropdownValue,
                          icon: const Icon(Icons.list_outlined),
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
                            switch(value){
                              case "قسم المؤونة":
                                val = "maona";
                                break;
                              case "قسم المديونين":
                                val = "madion";
                                break;
                              case "قسم المشاريع الخيرية":
                                val = "projects";
                                break;
                            }
                            setState(() {

                              dropdownValue = value!;
                            }
                            );
                          },



                        ),
                      ),
                    ],
                  ),
                      DefaultTextField(
                          label: "عنوان الحالة",
                          textcontroller: title,
                          function: (value){
                            return null;
                          }
                      ),
                      DefaultTextField(
                          label: "المكان",
                          textcontroller: location,
                          function: (value){
                            return null;
                          }
                      ),
                      DefaultTextField(
                          label: "عدد المستفيدين",
                          textcontroller: number,
                          function: (value){
                            return null;


                          }
                      ),
                      DefaultTextField(
                      label: "المبلغ المراد الوصول له",
                      textcontroller: mony,
                      keyboardtype: TextInputType.number,

                      function: (value){
                        return null;


                      }
                  ),
                      DefaultTextField(
                          label: "تفاصيل",
                          textcontroller: description,
                          function: (value){
                            final n = num.tryParse(value!);
                            if(n == null) {
                              return '"$value" is not a valid number';
                            }
                            return null;


                          }
                      ),
                      DefaultButton(

                          Function: ()async{
                            final data = {"title": title.text,
                              "mostafid": number.text,
                              "description": description.text,
                              "location": location.text,
                              "req":num.tryParse(mony.text),
                              "date":ts,
                              "total":0,
                            "section": val,
                            "status":"0",
                              "uId":CacheHelper.getData(key: "uId")};
                            await FirebaseFirestore.instance.collection("cases").add(data);
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
