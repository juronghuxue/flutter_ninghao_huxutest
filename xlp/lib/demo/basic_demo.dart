import 'package:flutter/material.dart';

class BasicDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      // color:Colors.grey[100],
      decoration: BoxDecoration(
        image:DecorationImage(
          image:NetworkImage('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1588174677747&di=171ebd8787e2447d74d0f36132796df3&imgtype=0&src=http%3A%2F%2Fa2.att.hudong.com%2F36%2F48%2F19300001357258133412489354717.jpg'),
          alignment: Alignment.topCenter,
          // repeat: ImageRepeat.repeatY,
          fit:BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.indigoAccent[400].withOpacity(0.5),
            BlendMode.hardLight,
          )
        ),
      ),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child:Icon(Icons.pool,size:32.0,color:Colors.white),
            
            padding:EdgeInsets.all(16.0),
            margin:EdgeInsets.all(8.0),
            width:90.0,
            height:90.0,
            decoration: BoxDecoration(
              color:Color.fromRGBO(3,54,255,1.0),
              border:Border.all(
                color:Colors.indigoAccent[100],
                width:3.0,
                style:BorderStyle.solid,
              ),
              // borderRadius:BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  offset:Offset(0.0, 16.0),
                  color:Color.fromRGBO(16, 20, 188, 1.0),
                  blurRadius: 25.0,
                  spreadRadius: -9.0
                )
              ],
              shape:BoxShape.circle,
              // gradient: RadialGradient(
              //   colors:[
              //     Color.fromRGBO(7,102,255,1.0),
              //     Color.fromRGBO(3,28,128,1.0),
              //   ]
              // ),
              gradient: LinearGradient(
                colors:[
                  Color.fromRGBO(7,102,255,1.0),
                  Color.fromRGBO(3,28,128,1.0),
                ],
                begin: Alignment.topCenter,
                end:AlignmentDirectional.bottomCenter,
              )
            ),
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