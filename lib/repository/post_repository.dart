
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:example_bloc/model/post_model.dart';

class PostRepository{
  Future<List<PostModel>> fetchPost() async{
    try{
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
      if(response.statusCode ==200){
        final body = json.decode(response.body) as List;
        return body.map((e){
          return PostModel(
            id:e['id'] as int,
            postId: e['postId'] as int,
            email: e['email'] as String,
            body:e['body'] as String,
          );
        }).toList();
      }
    }on SocketException{
      throw Exception('error while fetching data');
    }on TimeoutException{
      throw Exception('error while fetching data');
    }
    throw Exception('erro while fetching data ');
  }
}