class MenuItem {
  String title;
  String description;
  int price;
  String primaryImage;
  String secondaryImage;

  MenuItem(String title, String description, int price, String primaryImage,
      String secondaryImage) {
    this.title = title;
    this.description = description;
    this.price = price;
    this.primaryImage = primaryImage;
    this.secondaryImage = secondaryImage;
  }
}

List<MenuItem> menu = [];
