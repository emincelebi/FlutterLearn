import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/custom_widget_learn.dart';
import 'package:flutter_full_learn/101/stack_learn.dart';

class TabLearn extends StatefulWidget {
  const TabLearn({super.key});

  @override
  State<TabLearn> createState() => _TabLearnState();
}

class _TabLearnState extends State<TabLearn> with TickerProviderStateMixin {
  late final TabController _tabController;
  final double _notchedValue = 10;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _MyTabViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _MyTabViews.values.length,
        child: Scaffold(
          extendBody: true,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _tabController.animateTo(_MyTabViews.home.index);
            },
          ),
          bottomNavigationBar: BottomAppBar(
            notchMargin: _notchedValue,
            child: _myTabView(),
          ),
          appBar: AppBar(),
          body: _tabBarView(),
        ));
  }

  TabBar _myTabView() {
    return TabBar(
        //isScrollable: true
        padding: EdgeInsets.zero,
        onTap: (value) {},
        controller: _tabController,
        tabs: _MyTabViews.values
            .map((e) => Tab(
                  text: e.name,
                ))
            .toList());
  }

  TabBarView _tabBarView() {
    return TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: const [StackLearn(), CustomWidgetLearn(), CustomWidgetLearn(), CustomWidgetLearn()]);
  }
}

enum _MyTabViews { home, settings, favorite, profile }
