class HotelModel {
  String? hotelId;
  String? hotelName;
  String? hotelNameAr;
  String? hotelDesc;
  String? hotelDescAr;
  String? hotelLogo;
  String? hotelLong;
  String? hotelLat;
  String? hotelDoc;
  String? hotelLocation;
  String? hotelRating;
  String? hotelUserid;
  String? hotelIconscode;

  HotelModel(
      {this.hotelId,
      this.hotelName,
      this.hotelNameAr,
      this.hotelDesc,
      this.hotelDescAr,
      this.hotelLogo,
      this.hotelLong,
      this.hotelLat,
      this.hotelDoc,
      this.hotelLocation,
      this.hotelRating,
      this.hotelUserid,
      this.hotelIconscode});

  HotelModel.fromJson(Map<String, dynamic> json) {
    hotelId = json['hotel_id'];
    hotelIconscode = json['hotel_icons'];
    hotelName = json['hotel_name'];
    hotelNameAr = json['hotel_name_ar'];
    hotelDesc = json['hotel_desc'];
    hotelDescAr = json['hotel_desc_ar'];
    hotelLogo = json['hotel_logo'];
    hotelLong = json['hotel_long'];
    hotelLat = json['hotel_lat'];
    hotelDoc = json['hotel_doc'];
    hotelLocation = json['hotel_location'];
    hotelRating = json['hotel_rating'];
    hotelUserid = json['hotel_userid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hotel_id'] = this.hotelId;
    data['hotel_name'] = this.hotelName;
    data['hotel_name_ar'] = this.hotelNameAr;
    data['hotel_desc'] = this.hotelDesc;
    data['hotel_desc_ar'] = this.hotelDescAr;
    data['hotel_logo'] = this.hotelLogo;
    data['hotel_long'] = this.hotelLong;
    data['hotel_lat'] = this.hotelLat;
    data['hotel_doc'] = this.hotelDoc;
    data['hotel_location'] = this.hotelLocation;
    data['hotel_rating'] = this.hotelRating;
    data['hotel_userid'] = this.hotelUserid;
    data['hotel_icons'] = this.hotelIconscode;
    return data;
  }
}
