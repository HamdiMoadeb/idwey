class IdweyForces {
  String? title;
  String? desc;
  List<Forces> list_item;

  IdweyForces(this.title, this.desc, this.list_item);

  factory IdweyForces.fromJson(Map<String?, dynamic> data) {
    var listItem = data['list_item'] as List;
    List<Forces> list_item = listItem.map((i) => Forces.fromJson(i)).toList();

    return IdweyForces(data['title'] == null ? "" : data['title'] as String,
        data['slug'] == null ? "" : data['slug'] as String, list_item);
  }
}

class Forces {
  String? name;
  String? desc;
  String? icon_url;

  Forces(this.name, this.desc, this.icon_url);

  factory Forces.fromJson(Map<String?, dynamic> data) {
    return Forces(
      data['name'] == null ? "" : data['name'] as String,
      data['desc'] == null ? "" : data['desc'] as String,
      data['icon_url'] == null ? "" : data['icon_url'] as String,
    );
  }
}
