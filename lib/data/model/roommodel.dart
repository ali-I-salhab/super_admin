class RoomModel {
  String? roomId;
  String? roomName;
  String? roomHotelid;
  String? roomDescAr;
  String? roomDescEn;
  String? roomExtralargbed;
  String? roomSofabed;
  String? roomBunkbed;
  String? roomSinglebed;
  String? roomAdult;
  String? roomChildrenundersix;
  String? roomChildrenundertwelf;
  String? roomInfant;
  String? roomBedonly;
  String? roomHalfboard;
  String? roomBedbrekfast;
  String? roomAllinclusive;
  String? roomGroupguest;
  String? roomRate;
  String? roomAvailbility;
  String? roomIcons;

  String? roomLogo;

  RoomModel(
      {this.roomId,
      this.roomName,
      this.roomHotelid,
      this.roomDescAr,
      this.roomDescEn,
      this.roomExtralargbed,
      this.roomSofabed,
      this.roomBunkbed,
      this.roomSinglebed,
      this.roomAdult,
      this.roomChildrenundersix,
      this.roomChildrenundertwelf,
      this.roomInfant,
      this.roomBedonly,
      this.roomHalfboard,
      this.roomBedbrekfast,
      this.roomAllinclusive,
      this.roomGroupguest,
      this.roomRate,
      this.roomAvailbility,
      this.roomIcons,
      this.roomLogo});

  RoomModel.fromJson(Map<String, dynamic> json) {
    roomId = json['room_id'];
    roomIcons = json['room_icons'];

    roomName = json['room_name'];
    roomHotelid = json['room_hotelid'];
    roomDescAr = json['room_desc_ar'];
    roomDescEn = json['room_desc_en'];
    roomExtralargbed = json['room_extralargbed'];
    roomSofabed = json['room_sofabed'];
    roomBunkbed = json['room_bunkbed'];
    roomSinglebed = json['room_singlebed'];
    roomAdult = json['room_adult'];
    roomChildrenundersix = json['room_childrenundersix'];
    roomChildrenundertwelf = json['room_childrenundertwelf'];
    roomInfant = json['room_infant'];
    roomBedonly = json['room_bedonly'];
    roomHalfboard = json['room_halfboard'];
    roomBedbrekfast = json['room_bedbrekfast'];
    roomAllinclusive = json['room_allinclusive'];
    roomGroupguest = json['room_groupguest'];
    roomRate = json['room_rate'];
    roomAvailbility = json['room_availbility'];
    roomLogo = json['room_logo'];
  }
}
