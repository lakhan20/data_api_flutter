import 'package:flutter/material.dart';

import 'model/data.dart';

class NewsListView extends StatelessWidget {
  final List<Data> data;

  const NewsListView({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DataDetailScreen(data: data[index]),
              ),
            );
          },
          child: Card(
            elevation: 5,
            color: Colors.indigo[100],
            child: Column(
              children: [
                Image.network(data[index].avatar),
                Text(data[index].first_name),
                Text("${data[index].last_name}",
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class DataDetailScreen extends StatelessWidget {
  final Data data;

  const DataDetailScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${data.id}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${data.id}"),
            Image.network(data.avatar),
            Text(data.email),
            Text(data.first_name),
            Text("${data.last_name}"),

          ],
        ),
      ),
    );
  }
}