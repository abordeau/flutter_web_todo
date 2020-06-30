import 'package:uuid/uuid.dart';

class Todo {
  String id;
  DateTime createdOn;
  String name;
  String description;

  Todo(this.name, {this.description}) {
    var uuid = Uuid();
    this.id = uuid.v4();
    this.createdOn = DateTime.now();
  }
}
