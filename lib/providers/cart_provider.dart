import 'package:flutter/material.dart';

import '../models/item.dart';

class CartProvider extends ChangeNotifier{
  List<Item> cart=[];
  void addItem(Item item){
    //check if item is already in cart
    if(!isInCart(item)){
      cart.add(item);
      notifyListeners();
    }
  }

  void removeItem(Item item){
    cart.remove(item);
    notifyListeners();
  }

  bool isInCart(Item item){
    return cart.contains(item);
  }

  double getTotalPrice(){
    double total=0;
    for(Item item in cart){
      total+=item.price;
    }
    return total;
  }
}