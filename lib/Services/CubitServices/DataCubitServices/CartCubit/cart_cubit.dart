import 'package:bloc/bloc.dart';
import 'package:designapp/Services/models/CartCaseModel/CartCase.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';
class CartCubit extends Cubit<List<Map<String, dynamic>>> {
  CartCubit() : super([]);

  void addItem(Map<String, dynamic> item) {
    List<Map<String, dynamic>> items = state;
    bool itemExists = false;
    for (var i = 0; i < items.length; i++) {
      if (items[i]['id'] == item['id']) {
        itemExists = true;
        break;
      }
    }
    if (!itemExists) {
      items.add(item);
    }
    emit(items);
  }
  void editItemAmount(String itemId, int newAmount) {
    List<Map<String, dynamic>> items = state;
    for (var i = 0; i < items.length; i++) {
      if (items[i]['id'] == itemId) {
        items[i]['amount'] = newAmount;
        break;
      }
    }
    emit(items);
  }
  void removeItem(String itemId) {
    List<Map<String, dynamic>> items = state;

    for (int i = 0; i < items.length; i++) {
      if (items[i]['id'] == itemId) {
        items.removeAt(i);
        break;
      }
    }
    emit(items);
  }
  void deleteAllItems() {
    List<Map<String, dynamic>> items = state;
    items.clear(); // Deletes all the items from the list
    emit(items);
  }
}