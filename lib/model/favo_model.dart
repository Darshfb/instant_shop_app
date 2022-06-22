class favomodel{
  dynamic  id;
  testproduckt1? product;

  favomodel({
    this.id,
    this.product
  });

  Map<String, dynamic> toMap() {
    return {
      'id':this.id,
      'product': this.product,
    };
  }

  factory favomodel.fromMap(Map<String, dynamic> map) {
    return favomodel(
      id: map['id'],
      product: map['product'] != null ? testproduckt1.fromMap(map['product']): null,
    );
  }
}
class testproduckt1{
  dynamic id;
  dynamic name;
  dynamic image;
  dynamic description;
  dynamic old_price;
  dynamic price;
  dynamic in_favorites;
  dynamic in_cart;

  testproduckt1({
    this.id,
    this.name,
    this.image,
    this.description,
    this.old_price,
    this.price,

  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'image': this.image,
      'description': this.description,
      'old_price': this.old_price,
      'price': this.price,

    };
  }

  factory testproduckt1.fromMap(Map<String, dynamic> map) {
    return testproduckt1(
      id: map['id'],
      name: map['name'] ,
      image: map['image'] ,
      description: map['description'],
      old_price: map['old_price'] ,
      price: map['price'] ,

    );
  }
}