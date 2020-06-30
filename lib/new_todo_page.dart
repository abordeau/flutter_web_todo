import 'package:flutter/material.dart';
import 'package:webtodo/todo.dart';

class NewTodoPage extends StatefulWidget {
  @override
  _NewTodoPageState createState() => _NewTodoPageState();
}

class _NewTodoPageState extends State<NewTodoPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name;
  String _description;

  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  _submitForm() {
    if (_formKey.currentState.validate()) {
      Todo todo = Todo(_name, description: this._description);
      Navigator.of(context).pop(todo);
    }
  }

  @override
  void initState() {
    super.initState();
    _nameController.addListener(() {
      _name = _nameController.text;
    });
    _descriptionController.addListener(() {
      _description = _descriptionController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Todo'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 50,
          horizontal: 10,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _nameController,
                validator: (String value) {
                  if (value == null || value.length == 0) {
                    return 'You must enter something';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Name*',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 100,
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  controller: _descriptionController,
                  maxLines: 100,
                  decoration: InputDecoration(
                    hintText: 'Description',
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              RaisedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
