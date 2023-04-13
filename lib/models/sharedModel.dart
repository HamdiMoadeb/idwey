class Terms {
  int? id;
  String? name;
  bool checked;

  Terms({this.id, this.name, this.checked = false});

  factory Terms.fromJson(Map<String?, dynamic> data) {
    return Terms(id: data['id'], name: data['name']);
  }
}
