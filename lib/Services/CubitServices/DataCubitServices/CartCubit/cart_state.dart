part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}
// class ItemAdded extends CartState {
//   final List<Map<String, dynamic>> items;
//   ItemAdded(this.items);
// }
// class AllItems extends CartState {
//   List<Map<String, dynamic>> items;
//   AllItems(this.items);
// }
