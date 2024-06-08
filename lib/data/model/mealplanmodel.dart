class MealPlanModel {
  String? mealplanId;
  String? mealplanName;
  String? mealplanDesc;
  String? mealplanHotelid;
  String? mealplanStatus;

  MealPlanModel(
      {this.mealplanId,
      this.mealplanName,
      this.mealplanDesc,
      this.mealplanHotelid,
      this.mealplanStatus});

  MealPlanModel.fromJson(Map<String, dynamic> json) {
    mealplanId = json['mealplan_id'];
    mealplanName = json['mealplan_name'];
    mealplanDesc = json['mealplan_desc'];
    mealplanHotelid = json['mealplan_hotelid'];
    mealplanStatus = json['mealplan_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mealplan_id'] = this.mealplanId;
    data['mealplan_name'] = this.mealplanName;
    data['mealplan_desc'] = this.mealplanDesc;
    data['mealplan_hotelid'] = this.mealplanHotelid;
    data['mealplan_status'] = this.mealplanStatus;
    return data;
  }
}
