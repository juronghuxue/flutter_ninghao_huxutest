import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
          child:ListView(
            padding:EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('wanghao',style:TextStyle(fontWeight:FontWeight.bold)),
                accountEmail: Text('wanghao@nonghao.net'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage('https://resources.ninghao.org/images/wanghao.jpg'),
                ),
                decoration: BoxDecoration(
                  color:Colors.yellow[400],
                  image:DecorationImage(
                    image:NetworkImage('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1588090090141&di=872986fa89fe1309b6c6a76881a3a618&imgtype=0&src=http%3A%2F%2Ffile01.16sucai.com%2Fd%2Ffile%2F2013%2F0617%2F20130617104626550.jpg'),
                    fit:BoxFit.cover,
                    colorFilter:ColorFilter.mode(
                      Colors.yellow[400].withOpacity(0.6),
                      BlendMode.hardLight
                    )
                  )
                ),
              ),
              ListTile(
                title:Text('Messages:',textAlign:TextAlign.right),
                trailing: Icon(Icons.message,color:Colors.black12,size:22.0),
                onTap: () =>Navigator.pop(context),
              ),
              ListTile(
                title:Text('Favorite:',textAlign:TextAlign.right),
                trailing: Icon(Icons.favorite,color:Colors.black12,size:22.0),
                onTap: () =>Navigator.pop(context),
              ),
              ListTile(
                title:Text('Settings:',textAlign:TextAlign.right),
                trailing: Icon(Icons.settings,color:Colors.black12,size:22.0),
                onTap: () =>Navigator.pop(context),
              ),
            ],
          ),
        );
  }
}