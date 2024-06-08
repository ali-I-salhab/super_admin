class StopsaleModel {
  String? stopsaleId;
  String? stopsaleHotelid;
  String? stopsaleStart;
  String? stopsaleEnd;
  String? stopsaleRoomid;
  String? roomName;
  String? roomLogo;

  StopsaleModel(
      {this.stopsaleId,
      this.stopsaleHotelid,
      this.stopsaleStart,
      this.stopsaleEnd,
      this.stopsaleRoomid,
      this.roomName,
      this.roomLogo});

  StopsaleModel.fromJson(Map<String, dynamic> json) {
    stopsaleId = json['stopsale_id'];
    stopsaleHotelid = json['stopsale_hotelid'];
    stopsaleStart = json['stopsale_start'];
    stopsaleEnd = json['stopsale_end'];
    stopsaleRoomid = json['stopsale_roomid'];
    roomName = json['room_name'];
    roomLogo = json['room_logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stopsale_id'] = this.stopsaleId;
    data['stopsale_hotelid'] = this.stopsaleHotelid;
    data['stopsale_start'] = this.stopsaleStart;
    data['stopsale_end'] = this.stopsaleEnd;
    data['stopsale_roomid'] = this.stopsaleRoomid;
    data['room_name'] = this.roomName;
    data['room_logo'] = this.roomLogo;
    return data;
  }
}
