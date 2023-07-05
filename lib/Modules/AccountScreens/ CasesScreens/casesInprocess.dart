import 'package:designapp/Services/CubitServices/DataCubitServices/SectionsCubit/sections_cubit.dart';
import 'package:designapp/Shared/Components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CasesInProcessScreen extends StatefulWidget {
  const CasesInProcessScreen({Key? key}) : super(key: key);

  @override
  State<CasesInProcessScreen> createState() => _CasesInProcessScreenState();
}
List<Map<String, dynamic>> inprogress=[];
class _CasesInProcessScreenState extends State<CasesInProcessScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<SectionsCubit>(context).getInprogress();
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: defaultAppBar(title: "الحالات قيد المراجعة",context: context ),
        body: BlocBuilder<SectionsCubit, SectionsState>(
  builder: (context, state) {
    if(state is CasesLoaded && (state).inprogress.length >0){
      inprogress = (state).inprogress;

    return ListView.separated(
            itemBuilder: (context,index)=>differentcaseCard(
                image: 'Assets/images/SliderImages/muslims-reading-from-quran.jpg',
                itemTitle: "${inprogress[index]["title"]}",
                leftnumber: "${inprogress[index]["req"]}",
                bottomtitle: 'الحالة قيد المراجعة',
                bottomCardColor: "#2B87F0",
                textAlignment: Alignment.center
            ),
            separatorBuilder: (context,index)=>const SizedBox(height: 10,),
            itemCount: inprogress.length
        );
    }
    else{
      return Center(child: Text("لا توجد حالات قيد المراجعة حاليا"));
    }
  },
),
      ),
    );
  }
}
