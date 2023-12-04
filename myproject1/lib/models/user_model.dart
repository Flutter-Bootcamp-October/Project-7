import 'package:shopingpriject/data/global.dart';
import 'package:shopingpriject/models/product_model.dart';
import 'package:shopingpriject/models/user_items.dart';

class User {
  String? userid;
  String? name;
  String? email;
  String? password;
  String? phone;
  String? address;
  String? city;
  String? state;

  String? pincode;
  List<Product> basket = [];


  User({
    this.name,
    this.email,
    this.password,
    this.phone,
    this.address,
    this.city,
    this.state,
    this.pincode,
    this.userid,
  });

  factory User.fromJson(Map json) => User(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        phone: json["phone"],
        address: json["address"],
        city: json["city"],
        state: json["state"],
        pincode: json["pincode"],
        userid: json["userid"],
      );
      void additem(String item,String userId){
  itemlist.add(UserItems(items: item,userId:userId ));


}
}
