class PaymentModel {
  String? paymentId;
  String? paymentHotelid;
  String? paymentName;
  String? paymentGuestgroup;
  String? paymentCompany;
  String? paymentMarchentuser;
  String? paymentToken;
  String? paymentApi;

  PaymentModel(
      {this.paymentId,
      this.paymentHotelid,
      this.paymentName,
      this.paymentGuestgroup,
      this.paymentCompany,
      this.paymentMarchentuser,
      this.paymentToken,
      this.paymentApi});

  PaymentModel.fromJson(Map<String, dynamic> json) {
    paymentId = json['payment_id'];
    paymentHotelid = json['payment_hotelid'];
    paymentName = json['payment_name'];
    paymentGuestgroup = json['payment_guestgroup'];
    paymentCompany = json['payment_company'];
    paymentMarchentuser = json['payment_marchentuser'];
    paymentToken = json['payment_token'];
    paymentApi = json['payment_api'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['payment_id'] = this.paymentId;
    data['payment_hotelid'] = this.paymentHotelid;
    data['payment_name'] = this.paymentName;
    data['payment_guestgroup'] = this.paymentGuestgroup;
    data['payment_company'] = this.paymentCompany;
    data['payment_marchentuser'] = this.paymentMarchentuser;
    data['payment_token'] = this.paymentToken;
    data['payment_api'] = this.paymentApi;
    return data;
  }
}
