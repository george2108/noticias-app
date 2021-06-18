import 'package:flutter/material.dart';
import 'package:noticiasapp/src/services/news_service.dart';
import 'package:noticiasapp/src/widgets/list_news.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatefulWidget {
  @override
  _Tab1PageState createState() => _Tab1PageState();
}

// para mantener el estado del scroll y no perderlo al cambiar de tab, añadir despues del
// with AutomaticKeepAliveClientMixin
class _Tab1PageState extends State<Tab1Page>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return Scaffold(
      body: newsService.headlines.length == 0
          ? Center(child: CircularProgressIndicator())
          : ListNews(newsService.headlines),
    );
  }

  @override
  // implementar condicion para destruir el estado del scroll
  bool get wantKeepAlive => true;
}
