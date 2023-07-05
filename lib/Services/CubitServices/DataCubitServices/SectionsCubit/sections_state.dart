part of 'sections_cubit.dart';

@immutable
abstract class SectionsState {}

class SectionsInitial extends SectionsState {}

class SectionsLoaded extends SectionsState{
  List<Map<String, dynamic>> first,second,last;
  SectionsLoaded(this.first,this.second,this.last);
}
class MyCasesLoaded extends SectionsState{
  List<Map<String, dynamic>> myCases;
  MyCasesLoaded(this.myCases);
}
class RequestsLoaded extends SectionsState{
  List<Map<String, dynamic>> requests;
  RequestsLoaded(this.requests);
}

class CasesLoaded extends SectionsState{
  List<Map<String, dynamic>> inprogress,rejected;
  CasesLoaded(this.inprogress,this.rejected);
}