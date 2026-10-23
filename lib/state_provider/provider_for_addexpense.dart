import 'package:flutter/cupertino.dart';

class addexpense with ChangeNotifier{

  String _money = "0.00";
  String get moneyvalue => _money;

  void increse (String newvalue){
    _money = newvalue;
    notifyListeners();
  }

}
class addshopename with ChangeNotifier{

  String _name = "None";
  String get shopname => _name;

  void shopenameadd (String newvalue){
    _name = newvalue;
    notifyListeners();
  }

}

class selectcategory with ChangeNotifier{

  String _category = "select";
  String get selecttedcategory => _category;

  void select_category(newcategory){

    _category = newcategory;
    notifyListeners();

  }


}

class selectsub_category with ChangeNotifier{

  String _sub_category = "select";
  String get selecttedsubcategory => _sub_category;

  void select_subcategory(newsubcategory){

    _sub_category = newsubcategory;
    notifyListeners();

  }


}

class select_paymentmethod with ChangeNotifier{

  String _payment = "select";
  String get selecttepaymentdcategory => _payment;

  void select_paymentcategory(newpaymentcategory){

    _payment = newpaymentcategory;
    notifyListeners();

  }



}
