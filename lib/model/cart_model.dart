class totalmodel{
  dynamic total;
  totalmodel({
    required this.total,
  });
  Map<String, dynamic> toMap() {
    return {
      'total': this.total,
    };
  }

  factory totalmodel.fromMap(Map<String, dynamic> map) {
    return totalmodel(
      total: map['total'] as dynamic,
    );
  }


}
class cartiteme{
  dynamic  id;
  dynamic quantity;
  testproduckt? product;

  cartiteme({
    this.id,
    this.quantity,
    this.product
  });

  Map<String, dynamic> toMap() {
    return {
      'id':this.id,
      'quantity': this.quantity,
      'product': this.product,
    };
  }

  factory cartiteme.fromMap(Map<String, dynamic> map) {
    return cartiteme(
      id: map['id'],
      quantity: map['quantity'] ,
      product: map['product'] != null ? testproduckt.fromMap(map['product']): null,
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

  Map<String, dynamic> toMap() {
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

  factory testproduckt.fromMap(Map<String, dynamic> map) {
    return testproduckt(
      id: map['id'],
      name: map['name'] ,
      image: map['image'] ,
      description: map['description'],
      old_price: map['old_price'] ,
      price: map['price'] ,
      in_favorites: map['in_favorites'] ,
      in_cart: map['in_cart'] ,
    );
  }
}