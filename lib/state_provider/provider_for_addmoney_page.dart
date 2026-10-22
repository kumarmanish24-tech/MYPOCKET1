import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Addmoney with ChangeNotifier{

  String _money = "0.00";
  String get moneyvalue => _money;

  void increse (String newvalue){
    _money = newvalue;
    notifyListeners();
  }




}

class Receivedmoneyfrommethod with ChangeNotifier{

  String _title = "Not selected";
  String get title_name => _title;

  void select_title(newtitle){

    _title = newtitle;
    notifyListeners();


  }

}

class ReceivedmoneyViamethod with ChangeNotifier{

  String _title = "Not selected";
  String get title_name => _title;

  void select_title(newtitle){

    _title = newtitle;
    notifyListeners();


  }

}


class TimeModel with ChangeNotifier {
  TimeOfDay? _selectedTime;


  TimeOfDay? get selectedTime => _selectedTime;


  void setTime(TimeOfDay newTime) {
    _selectedTime = newTime;
    notifyListeners();
  }
}