import 'package:flutter/material.dart';
import 'package:noticiasapp/src/models/category_model.dart';
import 'package:noticiasapp/src/services/news_service.dart';
import 'package:noticiasapp/src/widgets/list_news.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _newsService = Provider.of<NewsService>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 80.0,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: _newsService.categories.length,
                itemBuilder: (BuildContext context, int index) {
                  final c = _newsService.categories[index].name;
                  final cName = '${c[0].toUpperCase()}${c.substring(1)}';
                  return Container(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          _IconButtonCustom(_newsService.categories[index]),
                          SizedBox(height: 5),
                          Text(cName),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(child: ListNews(_newsService.articlesByCategory)),
          ],
        ),
      ),
    );
  }
}

class _IconButtonCustom extends StatelessWidget {
  final CategoryModel category;

  const _IconButtonCustom(this.category);

  @override
  Widget build(BuildContext context) {
    final _newsService = Provider.of<NewsService>(context);

    return GestureDetector(
      onTap: () {
        final newsService = Provider.of<NewsService>(context, listen: false);
        newsService.selectedCategory = category.name;
      },
      child: Container(
        width: 40.0,
        height: 40.0,
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(
          category.icon,
          color: _newsService.selectedCategory == category.name
              ? Colors.red
              : Colors.black54,
        ),
      ),
    );
  }
}
