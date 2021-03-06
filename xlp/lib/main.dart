
import 'package:flutter/material.dart';
import 'package:xlp/demo/state_management_demo.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './demo/listview_demo.dart';
import './demo/hello_demo.dart';
import './demo/drawer_demo.dart';
import './demo/bottom_navigation_bar_demo.dart';
import './demo/basic_demo.dart';
import './demo/layout_demo.dart';
import './demo/view_demo.dart';
import './demo/sliver_demo.dart';
import './demo/navigator_demo.dart';
import './demo/form_demo.dart';
import './demo/material_components.dart';
import './demo/state_management_demo.dart';
import './demo/stream/stream_demo.dart';
import './demo/rxdart/rxdart_demo.dart';
import './demo/bloc/bloc_demo.dart';
import './demo/http/http_demo.dart';
import './demo/animation/animation_demo.dart';
import './demo/i18n/i18n_demo.dart';
void main() => runApp(App());

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // locale: Locale('en','US'),
      localeResolutionCallback:(Locale locale,Iterable<Locale> supportedLocales){
        return Locale('en','US');
      },
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en','US'),
        Locale('zh','CN')
      ],
      debugShowCheckedModeBanner: false,
      // home:NavigatorDemo(),
      initialRoute: '/i18n',
      routes: {
        '/':(context) => Home(),
        '/about':(context) => Page2(title:'About'),
        '/form':(context) => FormDemo(),
        '/mdc':(context) => MaterialComponents(),
        '/state-management':(context) => StateManagementDemo(),
        '/stream':(context) => StreamDemo(),
        '/rxdart':(context) => RxDartDemo(),
        '/bloc':(context) => BlocDemo(),
        '/http':(context) => HttpDemo(),
        '/animation':(context) => AnimationDemo(),
        '/i18n':(context) => I18nDemo(),
      },
      theme:ThemeData(
        primarySwatch: Colors.yellow,
        highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
        splashColor: Colors.white70,
        accentColor: Color.fromRGBO(3, 54, 255, 1.0)
      )
    );
  }
}

class Home extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length:4,
      child:Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title:Center(
            child: Text(
              'HIHA'
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon:Icon(Icons.search),
              tooltip:'Search',
              onPressed: ()=>debugPrint('Search button is pressed.'),
            ),
          ],
          elevation: 0.0,
          bottom:TabBar(
            unselectedLabelColor: Colors.black38,
            indicatorColor: Colors.black54,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 1.0,
            tabs: <Widget>[
              Tab(icon:Icon(Icons.local_florist)),
              Tab(icon:Icon(Icons.change_history)),
              Tab(icon:Icon(Icons.directions_bike)),
              Tab(icon:Icon(Icons.view_quilt)),
            ],
          )
        ),
        body:TabBarView(
          children: <Widget>[
            ListViewDemo(),
            // Icon(Icons.change_history,size:128.0,color:Colors.black12),
            BasicDemo(),
            // Icon(Icons.directions_bike,size:128.0,color:Colors.black12),
            LayoutDemo(),
            // ViewDemo(),
            SliverDemo()
          ],
        ),
        drawer:DrawerDemo(),
        bottomNavigationBar: BottomNavigationBarDemo()
      ),
    );
  }
}






