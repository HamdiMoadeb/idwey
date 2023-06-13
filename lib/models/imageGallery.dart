class Images {
  dynamic large;
  dynamic thumb;
  Images(
    this.large,
    this.thumb,
  );

  factory Images.fromJson(Map<String?, dynamic> data) {
    return Images(
      data['large'] == false ? "" : data['large'],
      data['thumb'] == false ? "" : data['thumb'],
    );
  }

  Map<String, dynamic> toJson() => {
        "large": large,
        "thumb": thumb,
      };
}

class Gallery {
  final dynamic large;
  final dynamic thumb;

  Gallery({
    this.large,
    this.thumb,
  });

  factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
        large: json["large"] == false ? "" : json["large"],
        thumb: json["thumb"] == false ? "" : json["thumb"],
      );

  Map<String, dynamic> toJson() => {
        "large": large,
        "thumb": thumb,
      };
}
