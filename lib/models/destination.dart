class Destination {
  int? id;
  String? name;
  String? image_id;
  int? nb_hotels;
  int? nb_events;
  int? nb_activities;
  int? nb_experiences;

  Destination(
    this.id,
    this.name,
    this.image_id,
    this.nb_hotels,
    this.nb_events,
    this.nb_activities,
    this.nb_experiences,
  );

  factory Destination.fromJson(Map<String?, dynamic> data) {
    return Destination(
      data['id'] as int,
      data['name'] == null ? "" : data['name'] as String,
      data['image_id'] == null ? "" : data['image_id'] as String,
      data['nb_hotels'] == null ? 0 : data['nb_hotels'] as int,
      data['nb_events'] == null ? 0 : data['nb_events'] as int,
      data['nb_activités'] == null ? 0 : data['nb_activités'] as int,
      data['nb_experiences'] == null ? 0 : data['nb_experiences'] as int,
    );
  }
}
