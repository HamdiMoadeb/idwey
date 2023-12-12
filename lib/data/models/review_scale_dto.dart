class ReviewScale {
  final String? title;
  final int? stars;

  ReviewScale({
    this.title,
    this.stars,
  });

  factory ReviewScale.fromJson(Map<String, dynamic> json) => ReviewScale(
        title: json["title"],
        stars: json["stars"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "stars": stars,
      };
}
