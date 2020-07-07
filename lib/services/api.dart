import 'dart:async';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:quizi_quiz/models/category.dart';
import 'package:quizi_quiz/models/question.dart';


class API  {
   CategoryModel category;
   API({this.category});
   Future<List<CategoryModel>> getCategories() async {
    const categoriesURL = 'https://opentdb.com/api_category.php';
    final response = await http.get(categoriesURL);

    if (response.statusCode == 200) {
      final jsonResponse = convert.jsonDecode(response.body);
      final result = (jsonResponse['trivia_categories'] as List)
          .map((category) => CategoryModel.fromJson(category));
      List<CategoryModel> categories;
      categories = [];
      categories
        ..addAll(result)
        ..add(CategoryModel(id: 0, name: 'Any category'));
      //state.rebuild();
      return categories;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      //return false;
    }
  }

  
}

