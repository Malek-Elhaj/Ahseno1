import 'package:designapp/Shared/Components.dart';
import 'package:designapp/Shared/Style.dart';
import 'package:flutter/material.dart';

class CreateCaseScreen extends StatefulWidget {
  const CreateCaseScreen({Key? key}) : super(key: key);

  @override
  State<CreateCaseScreen> createState() => _CreateCaseScreenState();
}
String selectedImage="";
bool iconvisiblity=true;
class _CreateCaseScreenState extends State<CreateCaseScreen> {
  @override
  Widget build(BuildContext context) {

    var formKey=GlobalKey<FormState>();
    
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
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: formKey,
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
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: AppColors.CustomGrey.withOpacity(0.3),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(selectedImage)
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
                      DefaultTextField(
                          label: "عنوان الحالة",
                          textcontroller: TextEditingController(),
                          function: (value){
                            return null;


                          }
                      ),
                      DefaultTextField(
                          label: "المكان",
                          textcontroller: TextEditingController(),
                          function: (value){
                            return null;
                          }
                      ),
                      DefaultTextField(
                          label: "عدد المستفيدين",
                          textcontroller: TextEditingController(),
                          function: (value){
                            return null;


                          }
                      ),
                      DefaultTextField(
                      label: "المبلغ المراد الوصول له",
                      textcontroller: TextEditingController(),
                      function: (value){
                        return null;


                      }
                  ),
                      DefaultTextField(
                          label: "تفاضيل",
                          textcontroller: TextEditingController(),
                          function: (value){
                            return null;


                          }
                      ),
                      DefaultButton(
                          Function: (){},
                          ButtonText: "أضافة الحالة"
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
