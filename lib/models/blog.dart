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

class ArticleDetail {
  int? id;
  String? title;
  String? slug;
  String? content;
  String? image_url;
  String? created_at;
  String? cat_name;

  ArticleDetail(
    this.id,
    this.title,
    this.slug,
    this.content,
    this.image_url,
    this.created_at,
    this.cat_name,
  );

  factory ArticleDetail.fromJson(Map<String?, dynamic> data) {
    var row = data['row'];
    return ArticleDetail(
      row['id'] as int,
      row['title'] == null ? "" : row['title'] as String,
      row['slug'] == null ? "" : row['slug'] as String,
      row['content'] == null ? "" : row['content'] as String,
      data['image_url'] == null ? "" : data['image_url'] as String,
      row['created_at'] == null ? "" : row['created_at'] as String,
      row['cat_name'] == null ? "" : row['cat_name'] as String,
    );
  }
}
