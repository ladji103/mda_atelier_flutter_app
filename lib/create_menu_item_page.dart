import 'package:flutter/material.dart';
import 'package:mda_atelier_flutter/home_page.dart';
import 'package:mda_atelier_flutter/image_selector.dart';
import 'package:mda_atelier_flutter/models/menu_item.dart';

class CreateMenuItemPage extends StatefulWidget {
  final Function onMenuItemAdded;

  const CreateMenuItemPage({Key key, this.onMenuItemAdded}) : super(key: key);

  @override
  _CreateMenuItemPageState createState() => _CreateMenuItemPageState();
}

class _CreateMenuItemPageState extends State<CreateMenuItemPage> {
  String primaryImage;
  String secondaryImage;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  createMenuItem(BuildContext context) {
    bool isValid = formKey.currentState.validate();
    print(isValid);
    if (!isValid) return;

    String title = titleController.text;
    String description = descriptionController.text;
    int price = int.parse(priceController.text);

    menu.add(
        new MenuItem(title, description, price, primaryImage, secondaryImage));
    Navigator.pop(context);

    widget.onMenuItemAdded();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter un plat'),
      ),
      body: Form(
          key: formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
            children: [
              Text(
                'Titre',
                style: TextStyle(fontSize: 25.5),
              ),
              SizedBox(
                height: 5.0,
              ),
              TextFormField(
                controller: titleController,
                validator: (value) {
                  if (value.isEmpty) return 'Veuillez saisir le titre du plat';
                  return null;
                },
                decoration: InputDecoration(
                    hintText: 'Titre',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                'Description',
                style: TextStyle(fontSize: 25.5),
              ),
              SizedBox(
                height: 5.0,
              ),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty)
                    return 'Veuillez saisir la description du plat';
                  return null;
                },
                controller: descriptionController,
                decoration: InputDecoration(
                    hintText: 'Description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
                minLines: 5,
                maxLines: 10,
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                'Prix',
                style: TextStyle(fontSize: 25.5),
              ),
              SizedBox(
                height: 5.0,
              ),
              TextFormField(
                controller: priceController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty)
                    return 'Veuillez renseigner le prix du plat';
                  try {
                    int.parse(value);
                  } catch (e) {
                    return 'Veuillez renseigner un prix correct';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    hintText: 'Prix',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
              ),
              SizedBox(
                height: 30.0,
              ),
              ElevatedButton.icon(
                label: Text('Image Principale'),
                icon: Icon(Icons.camera_alt_outlined),
                onPressed: () {
                  navigateTo(context,
                      ImageSelector(onImageSelected: primaryImageSelected));
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(
                                color: Theme.of(context).primaryColor)))),
              ),
              if (primaryImage != null) Image.asset(primaryImage),
              SizedBox(
                height: 30.0,
              ),
              ElevatedButton.icon(
                  label: Text('Image Secondaire'),
                  icon: Icon(Icons.camera_alt_outlined),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.orange)))),
                  onPressed: () {
                    navigateTo(
                        context,
                        ImageSelector(
                          onImageSelected: secondaryImageSelected,
                        ));
                  }),
              if (secondaryImage != null) Image.asset(secondaryImage),
              SizedBox(
                height: 30.0,
              ),
              ElevatedButton(
                  child: Text(
                    'Créer'.toUpperCase(),
                    style: TextStyle(fontSize: 20.0),
                  ),
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).accentColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(
                                  color: Theme.of(context).accentColor)))),
                  onPressed: () {
                    createMenuItem(context);
                  })
            ],
          )),
    );
  }

  primaryImageSelected(String image) {
    setState(() {
      primaryImage = image;
    });
  }

  secondaryImageSelected(String image) {
    setState(() {
      secondaryImage = image;
    });
  }
}
