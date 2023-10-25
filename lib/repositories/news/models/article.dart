class Article {
   Article({
    required this.id,
    required this.title,
    required this.publicationDate,
    required this.imageUrl,
     required this.readed,
    this.description,
  });

  final String id;
  final String title;
  final DateTime publicationDate;
  final String imageUrl;
  late  bool readed;
  final String? description;
}
