
import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  String title;
  String subtitle;
  IconData icon;

  CardItem({@required this.title, this.subtitle, this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: icon!=null?Icon(icon):null,
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}
