class AppConfig {
  //base url is set
  static String baseurl = "http://10.11.0.89:8000/api/";

  static String mediaurl = "http://10.11.0.89:8000";

  //key to store data from api function in LoginController in json format used in AppUtils to get accesskey &userid
  static const String loginData = 'logInData';

  //key to check whether the user is already registered  or not and navigate to login page on every other startup since registering.
  static const String status = "status";
}
