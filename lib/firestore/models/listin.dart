class Listin {
  String idListin;
  String idUser;
  String name;

  Listin({required this.idListin, required this.name, required this.idUser});

  Listin.fromMap(Map<String, dynamic> map)
      : idListin = map["idListin"],
        idUser = map['idUser'],
        name = map["name"];

  Map<String, dynamic> toMap() {
    return {"idListin": idListin, "name": name, 'idUser': idUser};
  }
}
