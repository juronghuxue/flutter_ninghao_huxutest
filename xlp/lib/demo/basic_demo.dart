import 'package:flutter/material.dart';

class BasicDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color:Colors.grey[100],
      child:Row(
        children: <Widget>[
          Container(
            child:Icon(Icons.pool,size:32.0,color:Colors.white),
            color:Color.fromRGBO(3, 54, 255, 1.0),
            padding:EdgeInsets.all(16.0),
            margin:EdgeInsets.all(8.0),
            width:90.0,
            height:90.0
          )
        ],
      ),
    );
  }
}
class RichTextDemo extends StatelessWidget{
  final TextStyle _textStyle = TextStyle(
    fontSize:16.0,
  );

  final String _author = '李白';
  final String _title = '将进酒';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RichText(
      text:TextSpan(
        text:'nihao',
        style:TextStyle(
          color:Colors.deepOrangeAccent,
          fontSize:34.0,
          fontStyle:FontStyle.italic,
          fontWeight: FontWeight.w100,
        ),
        children: [
          TextSpan(
            text:'.net',
            style:TextStyle(
              fontSize: 17.0,
              color:Colors.grey,
            )
          )
        ]
      )
      
    );
  }
}