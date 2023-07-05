import 'package:designapp/Shared/Components.dart';
import 'package:designapp/Shared/Style.dart';
import 'package:flutter/material.dart';

class RejectedCasesScreen extends StatelessWidget {
  const RejectedCasesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: defaultAppBar(title: "الحالات المفروضة",context: context),
        body: ListView.separated(
            itemBuilder: (context,index)=>differentcaseCard(
                image: 'Assets/images/SliderImages/muslims-reading-from-quran.jpg',
                itemTitle: 'صيانة مسجد',
                leftnumber: '192,292',
                 ontab: () {
                   showModalBottomSheet(
                       shape: const  OutlineInputBorder(
                         borderSide: BorderSide(color: Colors.transparent),
                         borderRadius: BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16)),
                       ),
                       context: context,
                       builder: (context)=> SizedBox(
                         height: 200,
                         width: double.infinity,
                         child: Directionality(
                           textDirection: TextDirection.rtl,
                           child: Center(
                             child: Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Text(
                                 "سبب رفض الحالة الخاصة بك لانه المسجد غير مسجل في اوقافسبب رفض الحالة الخاصة بك لانه المسجد غير مسجل في اوقافسبب رفض الحالة الخاصة بك لانه المسجد غير مسجل في اوقافسبب رفض الحالة الخاصة بك لانه المسجد غير مسجل في اوقاف",
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
              bottomtitle: 'سبب رفض الحالة الخاصة بك لانه المسجد غير مسجل في اوقاف',
            ),
            separatorBuilder: (context,index)=>const SizedBox(height: 10,),
            itemCount: 10
        ),
      ),
    );
  }
}
