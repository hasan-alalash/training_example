// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:cart_example/data/items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/item.dart';
import '../providers/cart_provider.dart';
import 'cart.dart';

class MyCatalog extends StatelessWidget {
  const MyCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    /// ToDo build list view of _MyListItem items
    return Scaffold(
      appBar: _MyAppBar(),
      body: ListView.builder(
        padding: EdgeInsets.all(20),
          itemCount: items.length,
          itemBuilder:(context,index){
            return _MyListItem(items[index]);
          }
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  final Item item;
  const _AddButton({required this.item});

  @override
  Widget build(BuildContext context) {
    /// TODO listen to cart provider


    return Consumer<CartProvider>(
  builder: (context, provider, child) {
  return TextButton(
      onPressed: () {
        provider.addItem(item);
      },
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.pressed)) {
            return Theme.of(context).primaryColor;
          }
          return null; // Defer to the widget's default.
        }),
      ),
      child: provider.isInCart(item)
          ? const Icon(Icons.check, semanticLabel: 'ADDED')
          : const Text('ADD'),
    );
  },
);
  }
}

class _MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Catalog', style: Theme.of(context).textTheme.displayLarge),
      actions: [
        Consumer<CartProvider>(
          child: IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              /// TODO open cart screen
              Navigator.push(context, MaterialPageRoute(builder: (navigatorContext){
                ;
                return MyCart(
                );
              }));
            },
          ),
          builder: (context,provider,child){
            return Badge(
              label: Text("${provider.cart.length}"),
              alignment: AlignmentDirectional.topStart,
              isLabelVisible: provider.cart.isNotEmpty,
              child: child,
            );
          },
        ),

      ],
    );
  }

  @override
  Size get preferredSize =>const Size.fromHeight(kToolbarHeight);
}

class _MyListItem extends StatelessWidget {
  final Item item;

  const _MyListItem(this.item);

  @override
  Widget build(BuildContext context) {
    /// TODO listen to catalog list

    var textTheme = Theme.of(context).textTheme.titleLarge;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 48,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                color: item.color,
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Text(item.name, style: textTheme),
            ),
            const SizedBox(width: 24),
            _AddButton(item: item),
          ],
        ),
      ),
    );
  }
}