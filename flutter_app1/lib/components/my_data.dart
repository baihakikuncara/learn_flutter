class MyData {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final bool favorite;

  MyData(this.id, this.name, this.description, this.imageUrl, this.favorite);

  factory MyData.fromJson(Map<String, dynamic> json) {
    return MyData(
        json['id'] ?? '[empty]',
        json['name'] ?? '[empty]',
        json['description'] ?? '[empty]',
        json['imageUrl'] ?? '[empty]',
        json['favorite'] ?? '[empty]');
  }

  @override
  String toString() {
    return 'MyData{id:$id, name:$name, favorite:$favorite}';
  }
}
