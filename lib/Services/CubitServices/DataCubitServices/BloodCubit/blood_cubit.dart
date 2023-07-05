import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:designapp/Shared/CacheHelper.dart';
import 'package:meta/meta.dart';



part 'blood_state.dart';

class BloodCubit extends Cubit<BloodState> {

  List<Map<String, dynamic>> blood=[],lastBlood=[],myBlood=[];

  BloodCubit() : super(BloodInitial());

  Future getAllBlood() async{
    blood.clear();
    await FirebaseFirestore.instance.collection("blood").orderBy('date', descending: true).get().then((event) {
      for (var doc in event.docs) {
        blood.add(doc.data());
        // print(" ${doc.data()}");
        print(" ${blood[0]}");
      }
      emit(BloodLooded(blood,lastBlood));
      // return _blood;
    });
    return blood;
  }
  Future getLastBlood()async{
    // .limit(limit)
    lastBlood.clear();
    await FirebaseFirestore.instance.collection("blood").orderBy('date', descending: true).limit(5).get().then((event) {
      for (var doc in event.docs) {
        lastBlood.add(doc.data());
      }
      emit(BloodLooded(blood,lastBlood));

    });
    return lastBlood;

  }
  Future getMyBlood() async{
    myBlood.clear();
    Map<String, dynamic> data;
    await FirebaseFirestore.instance.collection("blood").where("uId" ,isEqualTo:CacheHelper.getData(key: "uId")).get().then((event) {

      for (var doc in event.docs) {
        data = doc.data();
        data["id"]=doc.id;
        myBlood.add(data);
      }
      emit(myBloodLooded(myBlood));
    });
    return myBlood;
  }
}
