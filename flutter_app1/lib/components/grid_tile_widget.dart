import 'package:flutter/material.dart';
import 'package:flutter_app1/components/my_data.dart';
import 'package:flutter_app1/screens/detail_screen.dart';

class GridTileWidget extends StatelessWidget {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final bool favorite;

  const GridTileWidget(
      this.id, this.name, this.description, this.imageUrl, this.favorite,
      {super.key});

  factory GridTileWidget.fromData(MyData data) {
    return GridTileWidget(
        data.id, data.name, data.description, data.imageUrl, data.favorite);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  DetailScreen(id, name, description, imageUrl, favorite)),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(4),
        width: 150,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/logo.png'),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            description,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      color: Theme.of(context).colorScheme.primary,
                      onPressed: () {},
                      icon: Icon(
                          favorite ? Icons.favorite : Icons.favorite_outline),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
