
class ordermodel{
  int? id;
  String? status;
  String? date;
  var total;

  ordermodel({
    this.id,
    this.status,
    this.date,
    required this.total,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'status': this.status,
      'date': this.date,
      'total': this.total,
    };
  }

  factory ordermodel.fromMap(Map<String, dynamic> map) {
    return ordermodel(
      id: map['id'],
      status: map['status'] ,
      date: map['date'] ,
      total: map['total'] ,
    );
  }
}