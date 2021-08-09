class Member {
  final String id;
  final String name;
  final String tanggal_lahir;
  final String alamat;

  Member({this.id, this.name, this.tanggal_lahir, this.alamat});

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      id: json['member_id'],
      name: json['name'],
      tanggal_lahir: json['tanggal_lahir'],
      alamat: json['alamat'],
    );
  }

  Map<String, dynamic> toJson() => {
    //'id': id,
    'name': name,
    'tanggal_lahir': tanggal_lahir,
    'alamat': alamat,
  };
}