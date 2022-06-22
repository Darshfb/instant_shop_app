class AdressModel
{
  int? id;
  String? name;
  String? city;
  String? region;
  String? notes;

  AdressModel({
    this.id,
    this.name,
    this.city,
    this.region,
    this.notes,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'city': this.city,
      'region': this.region,
      'notes': this.notes,
    };
  }

  factory AdressModel.fromMap(Map<String, dynamic> map) {
    return AdressModel(
      id: map['id'] as int,
      name: map['name'] as String,
      city: map['city'] as String,
      region: map['region'] as String,
      notes: map['notes'] as String,
    );
  }
}