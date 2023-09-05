import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final bool favorite;

  DetailScreen(
      this.id, this.name, this.description, this.imageUrl, this.favorite,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 500,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/logo.png'),
                    ),
                  ),
                ),
              ),
              Text(name),
              Text(description)
            ],
          ),
        ),
      ),
    );
  }
}
