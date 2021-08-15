import 'package:lab8/model/users.dart';
import 'package:dio/dio.dart';

class UsersService {
  var baseurl = "https://jsonplaceholder.typicode.com/";
  var usersurl = "users";

  Future<List<User>> getUsers() async {
    List<User> users = [];
    Response res = await Dio().get('$baseurl$usersurl');
    var data = res.data;
    data.forEach((element) {
      User user = User.fromJson(element);
      users.add(user);
    });
    return users;
  }
}
