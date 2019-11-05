class Category {
  final String category;
  final String imageUrl;

  Category({
    this.category,
    this.imageUrl,
  });
  factory Category.fromJson(Map<String, dynamic> json) {
    return new Category(        
        category: json['category'],
        imageUrl: 'https://resources.ninghao.org/images/candy-shop.jpg');
  }
}

// final List<Category> categories = [
//   Category(
//     category: 'FLUTTER',
//     imageUrl: 'https://resources.ninghao.org/images/candy-shop.jpg',
//   ),
//   Category(
//     category: 'GOLANG',
//     imageUrl: 'https://resources.ninghao.org/images/childhood-in-a-picture.jpg',
//   ),
//   Category(
//     category: 'PHP',
//     imageUrl: 'https://resources.ninghao.org/images/contained.jpg',
//   ),
//   Category(
//     category: 'MYSQL',
//     imageUrl: 'https://resources.ninghao.org/images/dragon.jpg',
//   ),
//   Category(
//     category: 'SSH',
//     imageUrl: 'https://resources.ninghao.org/images/free_hugs.jpg',
//   ),
//   Category(
//     category: '树莓派',
//     imageUrl: 'https://resources.ninghao.org/images/gravity-falls.png',
//   ),
// ];
