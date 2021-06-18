import 'package:flutter/material.dart';
import 'package:noticiasapp/src/models/new_models.dart';
import 'package:noticiasapp/src/theme/theme.dart';

class ListNews extends StatelessWidget {
  final List<Article> news;

  const ListNews(this.news);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.news.length,
      itemBuilder: (BuildContext context, int index) {
        return _New(
          newSingle: this.news[index],
          index: index,
        );
      },
    );
  }
}

class _New extends StatelessWidget {
  final Article newSingle;
  final int index;

  const _New({
    @required this.newSingle,
    @required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          margin: EdgeInsets.only(bottom: 10.0),
          child: Row(
            children: [
              Text(
                '${index + 1}. ',
                style: TextStyle(color: customDarkTheme.accentColor),
              ),
              Text(
                '${newSingle.source.name}. ',
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            newSingle.title,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(height: 10.0),
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          ),
          child: Container(
            child: newSingle.urlToImage != null
                ? FadeInImage(
                    placeholder: AssetImage('assets/giphy.gif'),
                    image: NetworkImage(newSingle.urlToImage),
                  )
                : Image(
                    image: AssetImage('assets/no-image.png'),
                  ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child:
              Text(newSingle.description != null ? newSingle.description : ''),
        ),
        Container(
          padding: EdgeInsets.only(right: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                color: Colors.yellow,
                iconSize: 25.0,
                icon: Icon(Icons.star_border),
                onPressed: () {},
              ),
              IconButton(
                color: Colors.green,
                iconSize: 25.0,
                icon: Icon(Icons.share),
                onPressed: () {},
              ),
              IconButton(
                color: Colors.blueAccent,
                iconSize: 25.0,
                icon: Icon(Icons.more),
                onPressed: () {},
              ),
            ],
          ),
        ),
        SizedBox(height: 20.0),
        Divider(),
      ],
    );
  }
}
