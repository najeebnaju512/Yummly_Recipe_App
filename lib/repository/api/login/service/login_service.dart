import 'package:recipe_app/repository/helper/api_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../app_config/app_config.dart';

class LoginService{
   
  static Future<dynamic> postLogin(Map<String, String> data) async{
       SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(AppConfig.loginData);
    try{
      var encodedData=
      await ApiHelper.postData(endPoint: "user/login/", body: data,headers: {"Authorization": "Bearer $token"});
     // var message=encodedData["msg"];
      if(encodedData["status"]==1) {
        return encodedData;
      }else{
        return encodedData;
      }
    }catch(e){
      print(e);
    }
  }
}