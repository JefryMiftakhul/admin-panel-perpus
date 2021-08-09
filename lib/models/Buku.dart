class Buku {
  final String id;
  final String judul;
  final String keyword;
  final String harga;
  final String lokasi;
  final String pinjam;
  final String tahun_terbit;

  Buku({this.id, this.judul, this.keyword, this.harga, this.lokasi, this.pinjam, this.tahun_terbit});

  factory Buku.fromJson(Map<String, dynamic> json) {
    return Buku(
      id: json['id_buku'],
      judul: json['judul'],
      keyword: json['keyword'],
      harga: json['harga'],
      lokasi: json['lokasi'],
      pinjam: json['pinjam'],
      tahun_terbit: json['tahun_terbit'],
    );
  }

  Map<String, dynamic> toJson() => {
    //'id': id,
      'judul': judul,
      'keyword': keyword,
      'harga': harga,
      'lokasi': lokasi,
      'pinjam': pinjam,
      'tahun_terbit': tahun_terbit,
  };
}