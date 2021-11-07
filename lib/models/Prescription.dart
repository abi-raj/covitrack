class Pres {
  late String afternoon;
  late String evening;
  late String id;
  late String morning;

  Pres(
      {required this.afternoon,
      required this.evening,
      required this.id,
      required this.morning});

  Pres.fromJson(Map<String, dynamic> json) {
    afternoon = json['afternoon'];
    evening = json['evening'];
    id = json['id'];
    morning = json['morning'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['afternoon'] = this.afternoon;
    data['evening'] = this.evening;
    data['id'] = this.id;
    data['morning'] = this.morning;
    return data;
  }
}
