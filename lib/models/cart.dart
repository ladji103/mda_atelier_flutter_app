import 'package:mda_atelier_flutter/models/menu_item.dart';

class Cart {
  MenuItem item;
  int countItem;

  Cart(this.item, this.countItem);
}

List<Cart> carts = [];
