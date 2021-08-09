import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/Login.dart';
import '/networkapi.dart';
import 'package:shared_preferences/shared_preferences.dart';


class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    //String url = "https://soal.holywings.com/api/user/authenticate";
    final response = await http.post(Uri.parse('$LOGINAUTH'),body: requestModel.toJson());
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 400 || response.statusCode == 401) {
      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
