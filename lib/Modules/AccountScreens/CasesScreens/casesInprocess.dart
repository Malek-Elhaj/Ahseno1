import 'package:designapp/Shared/Components.dart';
import 'package:flutter/material.dart';

class CasesInProcessScreen extends StatelessWidget {
  const CasesInProcessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: defaultAppBar(title: "الحالات قيد المراجعة",context: context),
        body: ListView.separated(
            itemBuilder: (context,index)=>differentcaseCard(
                image: 'Assets/images/SliderImages/muslims-reading-from-quran.jpg',
                itemTitle: 'صيانة مسجد',
                leftnumber: '192,292',
                bottomtitle: 'الحالة لزالت قيد المراجعة',
                bottomCardColor: "#2B87F0",
                textAlignment: Alignment.center
            ),
            separatorBuilder: (context,index)=>const SizedBox(height: 10,),
            itemCount: 10
        ),
      ),
    );
  }
}
