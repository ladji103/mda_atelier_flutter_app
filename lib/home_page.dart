import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:mda_atelier_flutter/create_menu_item_page.dart';
import 'package:mda_atelier_flutter/menu_item_card.dart';
import 'package:mda_atelier_flutter/models/menu_item.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  onMenuItemAdded() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.grey,
            child: InkWell(
              onTap: () {
                print('OK');
              },
              child: Badge(
                badgeContent: Text('0', style: TextStyle(color: Colors.white, fontSize: 10.0),),
                badgeColor: Colors.red,
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ),
              )
            ),
          )
        ],
      ),
      drawer: MyDrawer(
        onMenuItemAdded: onMenuItemAdded,
      ),
      body: Center(
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
          itemCount: menu.length,
          itemBuilder: (context, index) {
            MenuItem item = menu[index];
            return MenuItemCard(
              menuItem: item,
            );
          },
          separatorBuilder: (_, __) => SizedBox(
            height: 25.0,
          ),
        ),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  final Function onMenuItemAdded;

  const MyDrawer({Key key, this.onMenuItemAdded}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/app-image.jpeg'),
                    fit: BoxFit.cover)),
            accountName: Text(
              'Abdoulaye TRAORE',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.orange),
            ),
            accountEmail: Text(
              'traoreabdoulaye242@gmail.com',
              style: TextStyle(backgroundColor: Colors.orange),
            ),
            currentAccountPicture: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/profile.jpeg'),
              // Icon(
              //   Icons.account_circle,
              //   size: 70,
              // ),
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Icon(Icons.add, color: Colors.black),
                ),
                title: Text('Ajouter un plat'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.orange,
                ),
                onTap: () {
                  Navigator.pop(context);
                  navigateTo(
                      context,
                      CreateMenuItemPage(
                        onMenuItemAdded: onMenuItemAdded,
                      ));
                },
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Icon(Icons.shopping_bag_outlined, color: Colors.black),
                ),
                title: Text('Les commandes clients'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.orange,
                ),
                onTap: () {
                  Navigator.pop(context);
                  navigateTo(context, CreateMenuItemPage());
                },
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Icon(Icons.shopping_basket, color: Colors.black),
                ),
                title: Text('Mes commandes'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.orange,
                ),
                onTap: () {
                  Navigator.pop(context);
                  navigateTo(context, CreateMenuItemPage());
                },
              ),
            ],
          ))
        ],
      ),
    );
  }
}

navigateTo(BuildContext context, Widget page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return page;
  }));
}
