class AdminModel {

  late String name;
  late String email;
  late String phone;
  late String uId;
  late String desc;

  AdminModel(
      this.name,
      this.email,
      this.phone,
      this.uId,
      this.desc
      );



  AdminModel.fromJson(dynamic json){
    name=json!["name"]!;
    email=json!["email"]!;
    phone=json!["phone"]!;
    uId=json!["uId"]!;
    desc=json!["desc"]!;
  }

  Map<String,dynamic> toMap(){
    return {
      'name':name,
      'email':email,
      'phone':phone,
      'uId':uId,
      'desc':desc

    };
  }


}
