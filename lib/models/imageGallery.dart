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
