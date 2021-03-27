import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ImageSelector extends StatefulWidget {
  final Function(String) onImageSelected;

  const ImageSelector({Key key, this.onImageSelected}) : super(key: key);

  @override
  _ImageSelectorState createState() => _ImageSelectorState();
}

class _ImageSelectorState extends State<ImageSelector> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecteur d\'image'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1.5),
        itemCount: images.length,
        itemBuilder: (context, index) {
          String image = images[index];
          return InkWell(
              onTap: () {
                selectedIndex = index;
                setState(() {});
              },
              child: buildStack(context, image, index));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedIndex > -1) {
            Navigator.pop(context);
            widget.onImageSelected(images[selectedIndex]);
          } else {
            Fluttertoast.showToast(
                msg: 'Veuillez sélectionner une image',
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        },
        child: Icon(Icons.done),
        backgroundColor: Theme.of(context).accentColor,
      ),
    );
  }

  Widget buildStack(BuildContext context, String image, int index) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Padding(
          padding: EdgeInsets.all(selectedIndex == index ? 8.0 : 0.0),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
        if (selectedIndex == index)
          Positioned(
              top: 8.0,
              left: 8.0,
              child: CircleAvatar(
                radius: 15.0,
                child: Icon(Icons.check),
                backgroundColor: Theme.of(context).accentColor,
              ))
      ],
    );
  }
}

List<String> images = [
  'assets/images/pexels-photo-628776.jpeg',
  'assets/images/pexels-photo-821365.jpeg',
  'assets/images/pexels-photo-853006.jpeg',
  'assets/images/pexels-photo-1092730.jpeg',
  'assets/images/pexels-photo-1351238.jpeg',
  'assets/images/pexels-photo-1410236.jpeg',
  'assets/images/pexels-photo-1583884.jpeg',
  'assets/images/pexels-photo-1640777.jpeg',
  'assets/images/pexels-photo-3026805.jpeg',
  'assets/images/pexels-photo-3186654.jpeg',
  'assets/images/pexels-photo-3535383.jpeg',
  'assets/images/pexels-photo-3756523.jpeg',
  'assets/images/pexels-photo-3758053.jpeg',
];
