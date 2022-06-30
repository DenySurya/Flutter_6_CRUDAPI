import 'package:crudapi/repository.dart';
import 'package:flutter/material.dart';

class AddBlog extends StatefulWidget {
  const AddBlog({Key? key}) : super(key: key);

  @override
  State<AddBlog> createState() => _AddBlogState();
}

class _AddBlogState extends State<AddBlog> {
  Repository repository = Repository();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments as List<String>;
    // if (args[1].isNotEmpty) {
    //   _titleController.text = args[1];
    // }
    // if (args[2].isNotEmpty) {
    //   _contentController.text = args[2];
    // }
    return Scaffold(
        appBar: AppBar(
          title: Text('Tambah Data'),
        ),
        body: Container(
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(hintText: 'Title'),
              ),
              TextField(
                controller: _contentController,
                decoration: InputDecoration(hintText: 'Content'),
              ),
              ElevatedButton(
                  onPressed: () async {
                    bool response = await repository.postData(
                        _titleController.text, _contentController.text);

                    if (response) {
                      Navigator.of(context).popAndPushNamed('/home');
                    } else {
                      print('Data yang anda masukkan salah');
                    }
                  },
                  child: Text('Submit')),
              
            ],
          ),
        ));
  }
}