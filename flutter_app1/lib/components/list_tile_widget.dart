import 'package:flutter/material.dart';
import 'package:flutter_app1/components/my_data.dart';

class ListTileWidget extends StatelessWidget {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final bool favorite;

  const ListTileWidget(
      this.id, this.name, this.description, this.imageUrl, this.favorite,
      {super.key});

  factory ListTileWidget.fromJson(MyData data) {
    return ListTileWidget(
        data.id, data.name, data.description, data.imageUrl, data.favorite);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/logo.png'),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(8),
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
          ),
          IconButton(
            color: Theme.of(context).colorScheme.primary,
            onPressed: () {},
            icon:
                favorite ? Icon(Icons.favorite) : Icon(Icons.favorite_outline),
          ),
        ],
      ),
    );
  }
}
