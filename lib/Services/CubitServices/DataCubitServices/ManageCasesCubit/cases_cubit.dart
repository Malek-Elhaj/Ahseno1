import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:designapp/Shared/CacheHelper.dart';
import 'package:meta/meta.dart';

part 'cases_state.dart';

class CasesCubit extends Cubit<CasesState> {
  CasesCubit() : super(CasesInitial());

  List<Map<String, dynamic>> requestes=[];

  Future getRequestes() async{
    requestes.clear();
    Map<String, dynamic> data;
    await FirebaseFirestore.instance.collection("cases").where("status",isEqualTo:"0").where("section",isEqualTo:CacheHelper.getData(key: "desc")).get().then((event) {
      for (var doc in event.docs) {
        data = doc.data();
        data["id"]=doc.id;
        requestes.add(data);
        print(" ${data}");
      }
      emit(ManageCases(requestes));
    });
    return requestes;
  }

}
