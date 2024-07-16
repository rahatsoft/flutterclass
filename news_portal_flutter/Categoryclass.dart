class Categoryclass {
  final int? blog_id;
  final String writer;
  final String title;
  final String description;
  final String publ_date;
  final String image;
  final String category;

  Categoryclass({
    this.blog_id,
    required this.writer,
    required this.title,
    required this.description,
    required this.publ_date,
    required this.image,
    required this.category,
  });

  factory Categoryclass.fromJson(Map<String, dynamic> json) {
    return Categoryclass(
      blog_id: json['blog_id'],
      writer: json['writer'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      publ_date: json['publ_date'] ?? '',
      image: json['image'] ?? '',
      category: json['category'] ?? '',
    );
  }
}