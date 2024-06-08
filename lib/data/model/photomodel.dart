class PhotoModel {
  String? photoId;
  String? photoHotelid;
  String? photoName;

  PhotoModel({this.photoId, this.photoHotelid, this.photoName});

  PhotoModel.fromJson(Map<String, dynamic> json) {
    photoId = json['photo_id'];
    photoHotelid = json['photo_hotelid'];
    photoName = json['photo_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['photo_id'] = this.photoId;
    data['photo_hotelid'] = this.photoHotelid;
    data['photo_name'] = this.photoName;
    return data;
  }
}
