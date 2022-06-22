class categoriesmodel{
  int? id;
  String? image;
  String? name;

  categoriesmodel({
    this.id,
    this.image,
    this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'image': this.image,
      'name': this.name,

    };
  }

  factory categoriesmodel.fromMap(Map<String, dynamic> map) {
    return categoriesmodel(
      id: map['id'] as int,
      image: map['image'] as String,
      name: map['name'] as String,
    );
  }
}