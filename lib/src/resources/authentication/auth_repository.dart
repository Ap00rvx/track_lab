import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tracklab/utils/urls.dart';

class AuthRepository {
  final dio = Dio();
  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await dio
          .post(AppUrls.BASE_URL + AppUrls.USER + AppUrls.LOGIN, data: {
        'email': email,
        'password': password,
      });
      print(response.data);
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('token', response.data['token']);
      
      return response.data as Map<String, dynamic>;
    } catch (e) {
      print(e);
      return {
        'error': true,
        'message': 'An error occurred. Please try again later',
      };
    }
  }
}
