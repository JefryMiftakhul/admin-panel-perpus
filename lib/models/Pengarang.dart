class Pengarang {
  final String id;
  final String name;
  final String tanggal_lahir;
  

  Pengarang({this.id, this.name, this.tanggal_lahir});

  factory Pengarang.fromJson(Map<String, dynamic> json) {
    return Pengarang(
      id: json['pengarang_id'],
      name: json['name'],
      tanggal_lahir: json['tanggal_lahir'],
    );
  }

  Map<String, dynamic> toJson() => {
    //'id': id,
    'name': name,
    'tanggal_lahir': tanggal_lahir,
  };
}