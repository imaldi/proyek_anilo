import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyek_anilo/logic_layer/GithubRepoCubit.dart';
import 'package:proyek_anilo/logic_layer/UserCubit.dart';
import 'package:proyek_anilo/presentation_layer/screens/GithubRepoScreen.dart';
import 'package:proyek_anilo/presentation_layer/screens/UserScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserCubit>(create: (context) {
          return UserCubit();
        }),
        BlocProvider<GithubRepoCubit>(create: (context) {
          return GithubRepoCubit();
        }),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Aplikasi Aldi Irsan Majid'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<Widget> tabsTitles = [Tab(text: "Users"), Tab(text: "Repositories")];
  List<Widget> tabViews = [UserScreen(), GithubRepoScreen()];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return DefaultTabController(
      initialIndex: 0,
      length: tabsTitles.length < 1 ? 1 : tabsTitles.length,
      child: Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
          bottom: TabBar(
              tabs: tabsTitles.length < 1
                  ? [
                      Tab(
                        text: "My Issue",
                      )
                    ]
                  : tabsTitles),
        ),
        body: TabBarView(children: tabViews.length < 1 ? [Container()] : tabViews
            // [
            // ],
            ),
      ),
    );
  }
}
