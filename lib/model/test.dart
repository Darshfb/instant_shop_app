// // To parse this JSON data, do
// //
// //     final product = productFromJson(jsonString);
//
// import 'dart:convert';
//
// Product productFromJson(String str) => Product.fromJson(json.decode(str));
//
// String productToJson(Product data) => json.encode(data.toJson());
//
// class Product {
//
//
//   bool status;
//   dynamic message;
//   Data data;
//
//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//     status: json["status"],
//     message: json["message"],
//     data: Data.fromJson(json["data"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "message": message,
//     "data": data.toJson(),
//   };
//
//   Product({
//     required this.status,
//     required this.message,
//     required this.data,
//   });
// }
//
// class Data {
//
//
//   List<CartItem> cartItems;
//   int subTotal;
//   int total;
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//     cartItems: List<CartItem>.from(json["cart_items"].map((x) => CartItem.fromJson(x))),
//     subTotal: json["sub_total"],
//     total: json["total"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "cart_items": List<dynamic>.from(cartItems.map((x) => x.toJson())),
//     "sub_total": subTotal,
//     "total": total,
//   };
//
//   Data({
//     required this.cartItems,
//     required this.subTotal,
//     required this.total,
//   });
// }
//
// class CartItem {
//
//
//   int id;
//   int quantity;
//   ProductClass product;
//   CartItem({
//     required this.id,
//     required this.quantity,
//     required this.product,
//   });
//
//   factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
//     id: json["id"],
//     quantity: json["quantity"],
//     product: ProductClass.fromJson(json["product"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "quantity": quantity,
//     "product": product.toJson(),
//   };
//
//
// }
//
// class ProductClass {
//
//
//   int id;
//   int price;
//   int oldPrice;
//   int discount;
//   String image;
//   String name;
//   String description;
//   List<String> images;
//   bool inFavorites;
//   bool inCart;
//   ProductClass({
//     required this.id,
//     required this.price,
//     required this.oldPrice,
//     required this.discount,
//     required this.image,
//     required this.name,
//     required this.description,
//     required this.images,
//     required this.inFavorites,
//     required this.inCart,
//   });
//
//   factory ProductClass.fromJson(Map<String, dynamic> json) => ProductClass(
//     id: json["id"],
//     price: json["price"],
//     oldPrice: json["old_price"],
//     discount: json["discount"],
//     image: json["image"],
//     name: json["name"],
//     description: json["description"],
//     images: List<String>.from(json["images"].map((x) => x)),
//     inFavorites: json["in_favorites"],
//     inCart: json["in_cart"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "price": price,
//     "old_price": oldPrice,
//     "discount": discount,
//     "image": image,
//     "name": name,
//     "description": description,
//     "images": List<dynamic>.from(images.map((x) => x)),
//     "in_favorites": inFavorites,
//     "in_cart": inCart,
//   };
//
//
// }
import 'dart:convert';

carttt productFromJson(String str) => carttt.fromjson(json.decode(str));

String productToJson(carttt data) => json.encode(data.tojson());
class carttt{
  dynamic  id;
  dynamic quantity;
  testproduckt? product;

  carttt({
    this.id,
    this.quantity,
    this.product
  });

  Map<String, dynamic> tojson() {
    return {
      'id':this.id,
      'quantity': this.quantity,
      'product': this.product,
    };
  }

  factory carttt.fromjson(Map<String, dynamic> json) {
    return carttt(
      id: json['id'],
      quantity: json['quantity'] ,
      product: json['product'] != null ? testproduckt.fromjson(json['product']): null,
    );
  }
}
class testproduckt{
  dynamic id;
  dynamic name;
  dynamic image;
  dynamic description;
  dynamic old_price;
  dynamic price;
  dynamic in_favorites;
  dynamic in_cart;

  testproduckt({
    this.id,
    this.name,
    this.image,
    this.description,
    this.old_price,
    this.price,
    this.in_cart,
    this.in_favorites
  });

  Map<String, dynamic> tojson() {
    return {
      'id': this.id,
      'name': this.name,
      'image': this.image,
      'description': this.description,
      'old_price': this.old_price,
      'price': this.price,
      'in_favorites': this.in_favorites,
      'in_cart': this.in_cart,
    };
  }

  factory testproduckt.fromjson(Map<String, dynamic> json) {
    return testproduckt(
      id: json['id'],
      name: json['name'] ,
      image: json['image'] ,
      description: json['description'],
      old_price: json['old_price'] ,
      price: json['price'] ,
      in_favorites: json['in_favorites'] ,
      in_cart: json['in_cart'] ,
    );
  }
}