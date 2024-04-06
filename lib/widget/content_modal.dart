
class UnBoradingContent {
  String image;
  String title;
  String description;

  UnBoradingContent({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<UnBoradingContent> contents = [
  UnBoradingContent(
      image: "images/screen1.png",
      title: "Select form our Best Menu",
      description: "Pick you food from our menu"),
  UnBoradingContent(
      image: "images/screen2.png",
      title: "Easy and Onlne Payment",
      description: "You can pay cash on delivery order with us"),
  UnBoradingContent(
      image: "images/screen3.png",
      title: "Quick Delivery at your Doorstep",
      description: "Pick you food from our menu"),
];
