class Blog {
  final String title;
  final String category;
  final String posttime;
  final String description;
  final String content;
  final String imageUrl;
  Blog({
    this.title,
    this.category,
    this.posttime,
    this.description,
    this.content,
    this.imageUrl,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    return new Blog(
        title: json['title'],
        category: json['category'],
        posttime: json['date'],
        description: json['description'],
        content: json['content'],
        imageUrl: 'https://resources.ninghao.org/images/candy-shop.jpg');
  }
}