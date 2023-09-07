import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:yellochat_interview/model/sample_data_model.dart';
import 'package:yellochat_interview/utils/dailoge.dart';
import 'package:yellochat_interview/utils/urls.dart';

enum Cleaners {one,two,three}
class DataProvider extends ChangeNotifier{

  Cleaners _select = Cleaners.one;
  Cleaners get select => _select;
  set select(Cleaners value){
    _select = value;
    notifyListeners();
  }

  int? _selectedIndex ;
  int? get selectedIndex => _selectedIndex;
  set selectedIndex(int? value){
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    _selectedIndex = value;
    notifyListeners();});
  }

  bool? _isLoading = false;
  bool? get isLoading => _isLoading;
  set isLoading(bool? value){
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    _isLoading = value;
    notifyListeners();
    });
  }

   List<Itemss> one =[];
  double total = 0 ;
  int cleanerCount = 1;
  String cleanerHour =""; 



  Color selectColora = Colors.white;
  Color selectColorb = Colors.white;
  Color selectColorc = Colors.white;
  Color selectBordera = Colors.white;
  Color selectBorderb = Colors.white;
  Color selectBorderc = Colors.white;


  SampleDataModel? dataModel;

  Future<void>getData({
    required BuildContext context
  })async{
    try{
      isLoading = true;
    var response = await get(sampleDataURL);
    log(response.body);
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    if(response.statusCode == 200 && data['status'] == 'success'){
      dataModel = SampleDataModel.fromJson(data);
    
    }else{
    showSnackBarMessage(context: context, msg: "API Error");
    }
   isLoading = false;
    }catch(e){
      debugPrint(e.toString());
    }
    isLoading = false;
     notifyListeners();
  }
}