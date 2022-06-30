import 'package:crudapi/add-blog.dart';
import 'package:crudapi/edit-blog.dart';
import 'package:crudapi/model.dart';
import 'package:crudapi/repository.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.blueGrey.shade100,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey.shade800,
          elevation: 0,
        ),
      ),
      routes: {
        '/home': (context) => MyHomePage(title: 'CRUD API'),
        '/add-blog': (context) => AddBlog(),
        '/edit-blog': (context) => EditBlog()
      },
      home: const MyHomePage(title: 'CRUD API'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Blog> listBlog = [];
  // List<Blog> listBlog = [];
  Repository repository = Repository();

  getData() async {
    listBlog = await repository.getData();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () =>
                  Navigator.of(context).popAndPushNamed('/add-blog'),
              icon: Icon(Icons.add)),
              // IconButton(
              // onPressed: () =>
              //     Navigator.of(context).popAndPushNamed('/edit-blog'),
              // icon: Icon(Icons.update))
              
        ],
        
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Navigator.of(context).popAndPushNamed('/edit-blog',
                  arguments: [
                    listBlog[index].id,
                    listBlog[index].title,
                    listBlog[index].content
                  ]),
              child: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      listBlog[index].title,
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    Text(listBlog[index].content),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: listBlog.length),
    );
  }
}
