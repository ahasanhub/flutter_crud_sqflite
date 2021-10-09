import 'model.dart';

class ProductModel extends Model {
  static String table = 'products';
  final int? id;
  final String productName;
  final int categoryId;
  final String productDesc;
  final double price;
  final String productPic;

  ProductModel({
    this.id,
    required this.productName,
    required this.categoryId,
    required this.productDesc,
    required this.price,
    required this.productPic,
  });

  static ProductModel fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map["id"],
      productName: map['productName'].toString(),
      categoryId: map['categoryId'],
      productDesc: map['productDesc'],
      price: map['price'],
      productPic: map['productPic'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'productName': productName,
      'categoryId': categoryId,
      'productDesc': productDesc,
      'price': price,
      'productPic': productPic
    };

    if (id != null) {
      map['id'] = id;
    }
    return map;
  }
}

class CategoryModel extends Model {
  static String table = 'product_categories';

  String categoryName;
  int categoryId;

  CategoryModel({
    required this.categoryId,
    required this.categoryName,
  });

  static CategoryModel fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      categoryId: map["id"],
      categoryName: map['categoryName'],
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'categoryName': categoryName,
    };

    if (id != null) {
      map['id'] = id;
    }
    return map;
  }
}
