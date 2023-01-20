class Host {
  int? id;
  String? title;
  int? perp_max_persons;
  int? is_featured;
  int? location_id;
  String? price;
  String? address;
  String? impactsocial;
  String? IMAGE_URL;
  String? term_name;
  List<Room> roomsList;
  HostLocation location;

  Host(
    this.id,
    this.title,
    this.address,
    this.IMAGE_URL,
    this.impactsocial,
    this.is_featured,
    this.location_id,
    this.perp_max_persons,
    this.price,
    this.term_name,
    this.roomsList,
    this.location,
  );

  factory Host.fromJson(Map<String?, dynamic> data) {
    var listRooms = data['rooms'] as List;
    List<Room> roomsList = listRooms.map((i) => Room.fromJson(i)).toList();

    var loc = data['location'];
    HostLocation locationObj =
        (loc != null) ? HostLocation.fromJson(loc) : HostLocation(0, "NA");

    return Host(
      data['id'] as int,
      data['title'] == null ? "" : data['title'] as String,
      data['address'] == null ? "" : data['address'] as String,
      data['IMAGE_URL'] == null ? "" : data['IMAGE_URL'] as String,
      data['impactsocial'] == null ? "" : data['impactsocial'] as String,
      data['is_featured'] == null ? -1 : data['is_featured'] as int,
      data['location_id'] == null ? -1 : data['location_id'] as int,
      data['perp_max_persons'] == null ? -1 : data['perp_max_persons'] as int,
      data['price'] == null ? "" : data['price'] as String,
      data['term_name'] == null ? "" : data['term_name'] as String,
      roomsList,
      locationObj,
    );
  }
}

class Room {
  int? id;
  String? title;
  String? price;
  int? number;

  Room(this.id, this.title, this.price, this.number);

  factory Room.fromJson(Map<String?, dynamic> data) {
    return Room(
      data['id'] as int,
      data['title'] == null ? "" : data['title'] as String,
      data['price'] == null ? "" : data['price'] as String,
      data['number'] == null ? -1 : data['number'] as int,
    );
  }
}

class HostLocation {
  int? id;
  String? title;

  HostLocation(this.id, this.title);

  factory HostLocation.fromJson(Map<String?, dynamic> data) {
    return HostLocation(
      data['id'] as int,
      data['name'] == null ? "" : data['name'] as String,
    );
  }
}
