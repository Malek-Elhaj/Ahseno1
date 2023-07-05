part of 'blood_cubit.dart';

@immutable
abstract class BloodState {}

class BloodInitial extends BloodState {}

class BloodLooded extends BloodState{
  List<Map<String, dynamic>> blood,lastBlood;
  BloodLooded(this.blood,this.lastBlood);
}

class myBloodLooded extends BloodState{
  List<Map<String, dynamic>> myBlood;
  myBloodLooded(this.myBlood);
}
