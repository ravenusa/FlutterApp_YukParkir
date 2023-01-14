class GoodsModel {
  final String id;
  final String name;
  final String image;
  final int price;

  GoodsModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
  });

  factory GoodsModel.fromJson(Map<String, dynamic> json) {
    return GoodsModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      price: json['price'],
    );
  }
}

List<GoodsModel> listOfGoods = [
  GoodsModel(
      id: '1', name: 'Bolpen', image: 'assets/image/ballpoint.jpg', price: 5000),
  GoodsModel(
      id: '2', name: 'Buku Tulis', image: 'assets/image/book.png', price: 5500),
  GoodsModel(
      id: '3', name: 'Penggaris', image: 'assets/image/ruller.png', price: 7000),
  GoodsModel(
      id: '4', name: 'Snack', image: 'assets/image/snack.png', price: 5000),
  GoodsModel(
      id: '5', name: 'Es Krim', image: 'assets/image/ice.jpg', price: 100000),
  GoodsModel(
      id: '6', name: 'Bolpen Bagus', image: 'assets/image/ballpoint.jpg', price: 5300),
  GoodsModel(
      id: '7', name: 'Pensil', image: 'assets/image/pencil.png', price: 8000),
  GoodsModel(
      id: '8', name: 'Pensil Bagus', image: 'assets/image/pencil2.png', price: 9000),
  GoodsModel(
      id: '9', name: 'Penghapus', image: 'assets/image/eraser.png', price: 6500),
];
