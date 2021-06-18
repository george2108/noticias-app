import 'package:flutter/material.dart';
import 'package:noticiasapp/src/pages/tab_1_page.dart';
import 'package:noticiasapp/src/pages/tab_2_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NavigationModel(),
      child: Scaffold(
        body: _Tabs(),
        bottomNavigationBar: _Navegation(),
      ),
    );
  }
}

class _Navegation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _navigationModel = Provider.of<_NavigationModel>(context);
    return BottomNavigationBar(
      showSelectedLabels: true,
      showUnselectedLabels: false,
      currentIndex: _navigationModel.currentPage,
      onTap: (i) => _navigationModel.currentPage = i,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'hola',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.public),
          label: 'hola',
        ),
      ],
    );
  }
}

class _Tabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _navigationModel = Provider.of<_NavigationModel>(context);

    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: _navigationModel.pageController,
      children: [
        Tab1Page(),
        Tab2Page(),
      ],
    );
  }
}

class _NavigationModel with ChangeNotifier {
  int _currentPage = 0;
  PageController _pageController = new PageController();

  int get currentPage => this._currentPage;

  set currentPage(int page) {
    this._currentPage = page;
    _pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 250),
      curve: Curves.easeOut,
    );
    notifyListeners();
  }

  PageController get pageController => this._pageController;
}
