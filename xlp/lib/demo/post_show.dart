import 'package:flutter/material.dart';
import '../model/post.dart';

class PostShow extends StatelessWidget{
  final Post post1;
  PostShow({
    @required this.post1
  });

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title:Text('${post1.title}'),
        elevation: 0.0,
      ),
    );
  }
}









