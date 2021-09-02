import 'package:ensa/pages/feed_page.dart';
import 'package:ensa/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [FeedPage()];
  final List<PreferredSizeWidget?> _appBars = [null];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _pages[_currentIndex],
      appBar: _appBars[_currentIndex],
      floatingActionButton: Container(
        width: 70.0,
        height: 70.0,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            foregroundColor: Colors.white,
            child: Icon(Ionicons.add),
            onPressed: () {},
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        shape: CircularNotchedRectangle(),
        notchMargin: 9.0,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyBottomBarItem(
                      icon: Ionicons.home_outline,
                      index: 0,
                      onPressed: _onBottomBarItemPressed,
                      currentIndex: _currentIndex,
                    ),
                    MyBottomBarItem(
                      icon: Ionicons.search_outline,
                      index: 1,
                      onPressed: _onBottomBarItemPressed,
                      currentIndex: _currentIndex,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 100.0,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyBottomBarItem(
                      icon: Ionicons.chatbubble_outline,
                      index: 2,
                      onPressed: _onBottomBarItemPressed,
                      currentIndex: _currentIndex,
                    ),
                    MyBottomBarItem(
                      icon: Ionicons.person_outline,
                      index: 3,
                      onPressed: _onBottomBarItemPressed,
                      currentIndex: _currentIndex,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onBottomBarItemPressed(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class MyBottomBarItem extends StatelessWidget {
  const MyBottomBarItem(
      {Key? key,
      required this.icon,
      required this.index,
      required this.onPressed,
      required this.currentIndex})
      : super(key: key);

  final IconData icon;
  final void Function(int) onPressed;
  final int index;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final bool _isActive = index == currentIndex;

    return IconButton(
      color: _isActive ? Theme.of(context).primaryColor : kTextSecondary,
      onPressed: () {
        onPressed(index);
      },
      icon: FittedBox(
        child: Icon(
          icon,
          size: 28.0,
        ),
      ),
    );
  }
}
