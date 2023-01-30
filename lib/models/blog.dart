class Blog {
  int? id;
  String? title;
  String? content;
  String? image_id;
  String? created_at;
  String? cat_name;

  Blog(
    this.id,
    this.title,
    this.content,
    this.image_id,
    this.created_at,
    this.cat_name,
  );

  factory Blog.fromJson(Map<String?, dynamic> data) {
    return Blog(
      data['id'] as int,
      data['title'] == null ? "" : data['title'] as String,
      data['content'] == null ? "" : data['content'] as String,
      data['image_id'] == null ? "" : data['image_id'] as String,
      data['created_at'] == null ? "" : data['created_at'] as String,
      data['cat_name'] == null ? "" : data['cat_name'] as String,
    );
  }
}
