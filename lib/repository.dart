import 'dart:convert';

import 'package:crudapi/model.dart';
import 'package:http/http.dart' as http;

class Repository {
  final _baseUrl = 'https://6284db50a48bd3c40b76cb3a.mockapi.io/';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl + '/blog'));

      if (response.statusCode == 200) {
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<Blog> blog = it.map((e) => Blog.fromJson(e)).toList();
        return blog;
      }
    } catch (e) {
      print(e.toString());
    }
  }

   Future postData(String title, String content) async {
    try {
      final response = await http.post(Uri.parse(_baseUrl + '/blog'), body: {
        'title': title,
        'content': content,
      });
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }


  Future putData(int id, String title, String content) async {
    try {
      final response = await http.put(
          Uri.parse(_baseUrl + '/blog/' + id.toString()),
          body: {'title': title, 'content': content});
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future deleteData(String id) async {
    try {
      final response = await http.delete(Uri.parse(_baseUrl + '/blog/' + id));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}