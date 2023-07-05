import 'package:designapp/Shared/Style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TeachingScreen extends StatefulWidget {
  const TeachingScreen({Key? key}) : super(key: key);

  @override
  State<TeachingScreen> createState() => _TeachingScreenState();
}
bool isVisible=false;
class _TeachingScreenState extends State<TeachingScreen> {
  @override
  Widget build(BuildContext context) {

    List<String> questionTitles=[
      "هل منصة إحسينو موثوفة ؟",
      "ماهي أهداف المنصة ؟",
      "ما الفائدة من انشاء حساب ؟",
      "ماهي خيارات الدفع المتاحة ؟",
      "هل يشترط للتسجيل بأن يكون رقم الجوال ليبي ؟",
      "وصلتني رسالة أو اتصال وطلب مني تزويدهم بمعلومات شخصية أو خاصة ؟",
      "أرغب بأن لا تظهر بياناتي الشخصية ويظهر تبرعي كفاعل خير",
      "هل أستطيع دفع زكاتي عبر المنصة ؟"
    ];
    List<String> videoTitle=[
      "كيفية استخدام التبرع السريع ؟",
      "كيفية تعبية معلومات الدفع بشكل صحيح ؟",
      "كيفية أنشاء حالة للتبرع او مشروع خيري ؟",
      "كيفية حساب الزكاة الخاصة بك ؟",
    ];

    List<String> anwsers=[
      "إحسان منصة رسمية تم تأسيسها بناء على الأمر السامي، وتضم لجنة اشرافية مكونة من إحدى عشر جهة رسمية، تشمل: وزارة الداخلية، وزارة المالية، وزارة الصحة، البنك المركزي السعودي، وزارة التعليم، وزارة الموارد البشرية والتنمية الاجتماعية، وزارة العدل، وزارة الشؤون البلدية والقروية والإسكان، رئاسة أمن الدولة، الهيئة السعودية للبيانات والذكاء الاصطناعي (سدايا)، هيئة الحكومة الرقمية .",
      "منصة إحسان تهدف إلى تمكين القطاع غير الربحي والتنموي، وتعزيز قيم الانتماء الوطني والمسؤولية الاجتماعية لدى أفراد المجتمع ومؤسساته، والموثوقية والشفافية والسهولة في تقديم التبرعات، وتكريم المتميزين في العطاء الخيري والتنموي .",
      "التسجيل بمنصة إحسان يُمّكن المستخدم من الاطلاع على بيانات التبرعات السابقة، وتقارير التبرعات، بالإضافة إلى عدد من المزايا والخصائص الأخرى .",
      ".تتوفر خيارات دفع متعددة منها سداد و موبي كاش",
      "منصة إحسان حاليًا تقبل التسجيل برقم جوال سعودي فقط .",
      "لا تطلب منصة إحسان أي معلومات خاصة، نأمل منكم أخذ الحيطة والحذر .",
      "عبر منصة إحسان يمكن التبرع دون معرفة البيانات الشخصية، وذلك من خلال خاصية التبرع السريع أو التبرع المباشر دون تسجيل .",
      "يمكنك و ذلك عن طريق البحث عن حالة للتبرع له بمبلغ الخاصة بزكاتك"


    ];




    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "مركز التعليم",
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
        body: DefaultTabController(
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
                        text: 'اسئلة شائعة',
                      ),
                      Tab(
                        text: 'فيديوات تعليمة',
                      ),
                    ]
                ),
              ),
              Expanded(
                child: TabBarView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemCount: questionTitles.length,
                        itemBuilder: (context,index){
                          return Card(
                            elevation: 2,
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: AppColors.CustomGrey)
                            ),
                            shadowColor: AppColors.CustomGrey,

                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(
                                    questionTitles[index],
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.CustomGrey
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                                  trailing: Icon(
                                    Icons.info_outline,
                                    color: AppColors.CustomBlue,
                                    size: 30,
                                  ),
                                  onTap: (){
                                    switch(index){
                                      case 0: answer(anwsers[index]);
                                              break;

                                      case 1: answer(anwsers[index]);
                                              break;

                                      case 2 :answer(anwsers[index]);
                                              break;

                                      case 3: answer(anwsers[index]);
                                              break;

                                      case 4: answer(anwsers[index]);
                                              break;

                                      case 5 :answer(anwsers[index]);
                                              break;

                                      case 6: answer(anwsers[index]);
                                              break;

                                      case 7 :answer(anwsers[index]);
                                              break;
                                    }
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 10,);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemCount: videoTitle.length,
                      itemBuilder: (context,index){
                        return Card(
                          elevation: 2,
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: AppColors.CustomGrey)
                          ),
                          shadowColor: AppColors.CustomGrey,

                          child: Column(
                            children: [
                              ListTile(
                                title: Text(
                                  videoTitle[index],
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.CustomGrey
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                                trailing: Icon(
                                  Icons.play_circle_outline,
                                  color: AppColors.CustomBlue,
                                  size: 30,
                                ),
                                onTap: (){
                                  switch(index){
                                    case 0: answer(anwsers[index]);
                                    break;

                                    case 1: answer(anwsers[index]);
                                    break;

                                    case 2 :answer(anwsers[index]);
                                    break;

                                    case 3: answer(anwsers[index]);
                                    break;

                                    case 4: answer(anwsers[index]);
                                    break;

                                    case 5 :answer(anwsers[index]);
                                    break;

                                    case 6: answer(anwsers[index]);
                                    break;

                                    case 7 :answer(anwsers[index]);
                                    break;
                                  }
                                },
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: 10,);
                      },
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future answer(String answer){
    return showModalBottomSheet(
        shape: const  OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16)),
         ),
        context: context,
        builder: (context)=> Container(
          height: 200,
          width: double.infinity,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  answer,
                  style: TextStyle(
                      color: AppColors.CustomGrey
                  ),
                ),
              ),
            ),
          ),
        )
    );
  }
}
