import 'package:flutter/material.dart';
import 'package:mda_atelier_flutter/menu_item_card.dart';
import 'package:mda_atelier_flutter/models/menu_item.dart';

class DetailMenuItem extends StatelessWidget {
  final MenuItem item;

  const DetailMenuItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                  blurRadius: 10.0,
                  color: Colors.transparent,
                  offset: Offset(5, 5))
            ]),
        child: Column(
          children: [
            buildImages(context, item),
            buildContextDetailMenuItem(context, item)
          ],
        ),
      ),
    );
  }
}

Widget buildContextDetailMenuItem(BuildContext context, MenuItem menuItem) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
    child: Column(
      children: [
        Text(
          menuItem.title,
          style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20.0),
        Text(
          menuItem.description,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300),
        ),
        SizedBox(height: 20.0),
        RawChip(
          label: Text('${menuItem.price} F',
              style: TextStyle(fontSize: 18.0, color: Colors.white)),
          backgroundColor: Colors.deepOrange,
        ),
        SizedBox(height: 20.0),
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                shape: StadiumBorder(), elevation: 0.0),
            child: Text('Ajouter au panier'))
      ],
    ),
  );
}
