import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mda_atelier_flutter/detail_menu_item.dart';
import 'package:mda_atelier_flutter/home_page.dart';
import 'package:mda_atelier_flutter/models/menu_item.dart';

class MenuItemCard extends StatelessWidget {
  final MenuItem menuItem;

  const MenuItemCard({Key key, this.menuItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTo(
            context,
            DetailMenuItem(
              item: menuItem,
            ));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10.0,
                  offset: Offset(5, 5))
            ]),
        child: Column(
          children: [
            buildImages(context, menuItem),
            buildContext(context, menuItem)
          ],
        ),
      ),
    );
  }
}

Widget buildImages(BuildContext context, MenuItem menuItem) {
  return Stack(
    children: [
      Column(
        children: [
          Container(
            height: 200.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(menuItem.primaryImage))),
          ),
          SizedBox(
            height: 50.0,
          )
        ],
      ),
      Positioned(
        bottom: 0.0,
        right: 0.0,
        left: 0.0,
        child: Container(
          height: 120.0,
          width: 120.0,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(menuItem.secondaryImage))),
        ),
      )
    ],
  );
}

Widget buildContext(BuildContext context, MenuItem menuItem) {
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
        SizedBox(height: 40.0),
        Row(
          children: [
            RawChip(
              label: Text('${menuItem.price} F',
                  style: TextStyle(fontSize: 18.0, color: Colors.white)),
              backgroundColor: Colors.deepOrange,
            ),
            Spacer(),
            Material(
              type: MaterialType.transparency,
              child: Ink(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).primaryColor, width: 4.0),
                    color: Theme.of(context).primaryColor,
                    shape: BoxShape.circle),
                child: InkWell(
                  borderRadius: BorderRadius.circular(1000.0),
                  onTap: () {},
                  child: Icon(
                    Icons.add_shopping_cart,
                    size: 30.0,
                    // color: Colors.,
                  ),
                ),
              ),
            ),
            // Spacer(),
            // ElevatedButton(
            //     onPressed: () {},
            //     style: ElevatedButton.styleFrom(
            //         shape: StadiumBorder(), elevation: 0.0),
            //     child: Text('Ajouter au panier'))
          ],
        )
      ],
    ),
  );
}
