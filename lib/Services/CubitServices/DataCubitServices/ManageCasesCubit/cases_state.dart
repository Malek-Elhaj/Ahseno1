part of 'cases_cubit.dart';

@immutable
abstract class CasesState {}

class CasesInitial extends CasesState {}
class ManageCases extends CasesState{
  List<Map<String, dynamic>> requestes;
  ManageCases(this.requestes);
}