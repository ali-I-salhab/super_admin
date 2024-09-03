class HotelModel {
  int? id;
  String? user;
  String? namear;
  String? nameen;
  String? phone;
  String? review;
  String? website;
  String? email;
  String? plusCode;
  String? password;
  List<Photos>? photos;
  String? closeTime;
  String? instagram;
  String? facebook;
  String? linkedIn;
  String? twitter;
  String? salesEmail;
  String? salesPhone;
  String? availabilityandrateprovider;
  int? b2b;
  int? b2c;
  String? reservationEmail;
  String? reservationPhone;
  String? accountingEmail;
  String? accountingPhone;
  String? logo;
  String? category;
  int? hoteStars;
  String? country;
  String? city;
  String? location;
  String? postcode;
  double? lat;
  double? long;
  String? descar;
  String? descen;
  String? policyen;
  String? policyar;
  String? icons;
  List<ContractAttachment>? contractAttachment;
  String? userName;

  HotelModel(
      {this.id,
      this.user,
      this.namear,
      this.nameen,
      this.phone,
      this.review,
      this.website,
      this.email,
      this.plusCode,
      this.password,
      this.photos,
      this.closeTime,
      this.instagram,
      this.facebook,
      this.linkedIn,
      this.twitter,
      this.salesEmail,
      this.salesPhone,
      this.availabilityandrateprovider,
      this.b2b,
      this.b2c,
      this.reservationEmail,
      this.reservationPhone,
      this.accountingEmail,
      this.accountingPhone,
      this.logo,
      this.category,
      this.hoteStars,
      this.country,
      this.city,
      this.location,
      this.postcode,
      this.lat,
      this.long,
      this.descar,
      this.descen,
      this.policyen,
      this.policyar,
      this.icons,
      this.contractAttachment,
      this.userName});

  HotelModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    namear = json['namear'];
    nameen = json['nameen'];
    phone = json['phone'];
    review = json['review'];
    website = json['website'];
    email = json['email'];
    plusCode = json['PlusCode'];
    password = json['password'];
    if (json['photos'] != null) {
      photos = <Photos>[];
      json['photos'].forEach((v) {
        photos!.add(new Photos.fromJson(v));
      });
    }
    closeTime = json['close_time'];
    instagram = json['Instagram'];
    facebook = json['facebook'];
    linkedIn = json['Linked_in'];
    twitter = json['twitter'];
    salesEmail = json['sales_email'];
    salesPhone = json['sales_phone'];
    availabilityandrateprovider = json['availabilityandrateprovider'];
    b2b = json['b2b'];
    b2c = json['b2c'];
    reservationEmail = json['reservation_email'];
    reservationPhone = json['reservation_phone'];
    accountingEmail = json['accounting_email'];
    accountingPhone = json['accounting_phone'];
    logo = json['logo'];
    category = json['Category'];
    hoteStars = json['HoteStars'];
    country = json['country'];
    city = json['city'];
    location = json['location'];
    postcode = json['postcode'];
    lat = json['lat'];
    long = json['long'];
    descar = json['descar'];
    descen = json['descen'];
    policyen = json['policyen'];
    policyar = json['policyar'];
    icons = json['icons'];
    if (json['contractAttachment'] != null) {
      contractAttachment = <ContractAttachment>[];
      json['contractAttachment'].forEach((v) {
        contractAttachment!.add(new ContractAttachment.fromJson(v));
      });
    }
    userName = json['user_name'];
  }
  Map<String, dynamic> toJsonwithoutfiles() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user'] = this.user;
    data['namear'] = this.namear;
    data['nameen'] = this.nameen;
    data['phone'] = this.phone;
    data['review'] = this.review;
    data['website'] = this.website;
    data['email'] = this.email;
    data['PlusCode'] = this.plusCode;
    data['password'] = this.password;

    data['close_time'] = this.closeTime;
    data['Instagram'] = this.instagram;
    data['facebook'] = this.facebook;
    data['Linked_in'] = this.linkedIn;
    data['twitter'] = this.twitter;
    data['sales_email'] = this.salesEmail;
    data['sales_phone'] = this.salesPhone;
    data['availabilityandrateprovider'] = this.availabilityandrateprovider;
    data['b2b'] = this.b2b;
    data['b2c'] = this.b2c;
    data['reservation_email'] = this.reservationEmail;
    data['reservation_phone'] = this.reservationPhone;
    data['accounting_email'] = this.accountingEmail;
    data['accounting_phone'] = this.accountingPhone;
    // data['logo'] = this.logo;
    data['Category'] = this.category;
    data['HoteStars'] = this.hoteStars;
    data['country'] = this.country;
    data['city'] = this.city;
    data['location'] = this.location;
    data['postcode'] = this.postcode;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['descar'] = this.descar;
    data['descen'] = this.descen;
    data['policyen'] = this.policyen;
    data['policyar'] = this.policyar;
    data['icons'] = this.icons;

    data['user_name'] = this.userName;
    return data;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user'] = this.user;
    data['namear'] = this.namear;
    data['nameen'] = this.nameen;
    data['phone'] = this.phone;
    data['review'] = this.review;
    data['website'] = this.website;
    data['email'] = this.email;
    data['PlusCode'] = this.plusCode;
    data['password'] = this.password;
    if (this.photos != null) {
      data['photos'] = this.photos!.map((v) => v.toJson()).toList();
    }
    data['close_time'] = this.closeTime;
    data['Instagram'] = this.instagram;
    data['facebook'] = this.facebook;
    data['Linked_in'] = this.linkedIn;
    data['twitter'] = this.twitter;
    data['sales_email'] = this.salesEmail;
    data['sales_phone'] = this.salesPhone;
    data['availabilityandrateprovider'] = this.availabilityandrateprovider;
    data['b2b'] = this.b2b;
    data['b2c'] = this.b2c;
    data['reservation_email'] = this.reservationEmail;
    data['reservation_phone'] = this.reservationPhone;
    data['accounting_email'] = this.accountingEmail;
    data['accounting_phone'] = this.accountingPhone;
    data['logo'] = this.logo;
    data['Category'] = this.category;
    data['HoteStars'] = this.hoteStars;
    data['country'] = this.country;
    data['city'] = this.city;
    data['location'] = this.location;
    data['postcode'] = this.postcode;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['descar'] = this.descar;
    data['descen'] = this.descen;
    data['policyen'] = this.policyen;
    data['policyar'] = this.policyar;
    data['icons'] = this.icons;
    if (this.contractAttachment != null) {
      data['contractAttachment'] =
          this.contractAttachment!.map((v) => v.toJson()).toList();
    }
    data['user_name'] = this.userName;
    return data;
  }
}

class Photos {
  int? id;
  String? phototype;
  String? photo;
  String? hotel;

  Photos({this.id, this.phototype, this.photo, this.hotel});

  Photos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phototype = json['phototype'];
    photo = json['photo'];
    hotel = json['hotel'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phototype'] = this.phototype;
    data['photo'] = this.photo;
    data['hotel'] = this.hotel;
    return data;
  }
}

class ContractAttachment {
  int? id;
  String? file;

  ContractAttachment({this.id, this.file});

  ContractAttachment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    file = json['file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['file'] = this.file;
    return data;
  }
}
