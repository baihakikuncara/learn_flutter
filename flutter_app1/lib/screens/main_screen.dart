import 'package:flutter/material.dart';
import 'package:flutter_app1/components/grid_tile_widget.dart';
import 'package:flutter_app1/components/list_tile_widget.dart';
import 'package:flutter_app1/components/my_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum PageType {
  home,
  favorite,
}

enum PageView {
  list,
  grid,
}

final pageViewModeProvider = StateProvider<PageView>((ref) => PageView.list);

final dummyData = [
  for (int i = 0; i < 100; i++)
    MyData.fromJson({
      'id': '$i',
      'name': 'name00$i',
      'description': 'descriptionaaaaaaaaaaaaaaaaaaaaaaaaaaaa$i',
      'imageUrl': 'imageUrl$i',
      'favorite': i % 3 == 0,
    })
];

class MainScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            DropdownButton(
              items: const [
                DropdownMenuItem(
                  value: PageView.grid,
                  child: Icon(Icons.grid_view),
                ),
                DropdownMenuItem(
                  value: PageView.list,
                  child: Icon(Icons.list),
                )
              ],
              onChanged: (value) {
                ref.read(pageViewModeProvider.notifier).state = value!;
              },
              value: ref.watch(pageViewModeProvider),
            )
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
              ),
              Tab(
                icon: Icon(Icons.favorite),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            MainWidget(PageType.home),
            MainWidget(PageType.favorite),
          ],
        ),
      ),
    );
  }
}

class MainWidget extends ConsumerWidget {
  final PageType type;

  MainWidget(this.type, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List data = [];
    switch (type) {
      case PageType.home:
        data = dummyData;
        break;
      case PageType.favorite:
        data = dummyData.where((element) => element.favorite).toList();
        break;
    }

    var viewMode = ref.watch(pageViewModeProvider);
    switch (viewMode) {
      case PageView.grid:
        return LayoutBuilder(builder: (context, constraints) {
          return GridView.count(
            crossAxisCount: (constraints.maxWidth / 200).floor(),
            childAspectRatio: 0.9,
            children: data.map((e) => GridTileWidget.fromData(e)).toList(),
          );
        });

      case PageView.list:
        return ListView(
          children: data.map((e) => ListTileWidget.fromJson(e)).toList(),
        );
    }
  }
}
