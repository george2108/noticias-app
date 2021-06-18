import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:http/http.dart' as http;
import 'package:noticiasapp/src/models/category_model.dart';

import 'package:noticiasapp/src/models/new_models.dart';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];
  List<Article> articlesByCategory = [];

  String _selectedCategory = 'business';

  List<CategoryModel> categories = [
    CategoryModel(FontAwesomeIcons.building, 'business'),
    CategoryModel(FontAwesomeIcons.gamepad, 'entertainment'),
    CategoryModel(FontAwesomeIcons.addressCard, 'general'),
    CategoryModel(FontAwesomeIcons.headSideVirus, 'health'),
    CategoryModel(FontAwesomeIcons.vials, 'science'),
    CategoryModel(FontAwesomeIcons.volleyballBall, 'sports'),
    CategoryModel(FontAwesomeIcons.memory, 'technology'),
  ];

  NewsService() {
    this.getTopHeadlines();
    print('hola');
  }

  set selectedCategory(String category) {
    this._selectedCategory = category;
    getArticlesByCategory(category);
    notifyListeners();
  }

  get selectedCategory => this._selectedCategory;

  getTopHeadlines() async {
    final url =
        'https://newsapi.org/v2/top-headlines?country=mx&apiKey=ec229f613f3545199083a2cc7f1df2cf';
    final response = await http.get(Uri.parse(url));
    final newsResponse = newsResponseModelFromJson(response.body);
    this.headlines.addAll(newsResponse.articles);
    notifyListeners();
  }

  getArticlesByCategory(String category) async {
    this.articlesByCategory = [];
    final url =
        'https://newsapi.org/v2/top-headlines?country=mx&apiKey=ec229f613f3545199083a2cc7f1df2cf&category=$category';
    final response = await http.get(Uri.parse(url));
    final newsResponse = newsResponseModelFromJson(response.body);
    this.articlesByCategory.addAll(newsResponse.articles);
    notifyListeners();
  }
}
