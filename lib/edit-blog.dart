import 'package:crudapi/repository.dart';
import 'package:flutter/material.dart';

class EditBlog extends StatefulWidget {
  const EditBlog({Key? key}) : super(key: key);

  @override
  State<EditBlog> createState() => _EditBlogState();
}

class _EditBlogState extends State<EditBlog> {
  Repository repository = Repository();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as List<String>;
    if (args[1].isNotEmpty) {
      _titleController.text = args[1];
    }
    if (args[2].isNotEmpty) {
      _contentController.text = args[2];
    }
    return Scaffold(
        appBar: AppBar(
          title: Text('Ubah Data'),
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
                    bool response = await repository.putData(int.parse(args[0]),
                        _titleController.text, _contentController.text);

                    if (response) {
                      Navigator.of(context).popAndPushNamed('/home');
                    } else {
                      print('Data yang anda masukkan salah');
                    }
                  },
                  child: Text('Update')),
            ],
          ),
        ));
  }
}