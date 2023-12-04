import 'package:shopingpriject/models/product_model.dart';
import 'package:shopingpriject/models/user_items.dart';
import 'package:shopingpriject/models/user_model.dart';

List<Product> listProucts = [];
List<Product> orderProuct = [];
List<User> userList = [];
List<UserItems> itemlist = [];

late User currentUser;
double globalPrice = 0;

void calculateGlobalPrice() {
  globalPrice = 0;
  for (var element in orderProuct) {
    globalPrice += element.count! * double.parse(element.price);
  }
  print(globalPrice);
}
