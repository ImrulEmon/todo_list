import 'dart:io';

void main() {
  stdout.writeln('|========== Todo List ==========|');

  List<Todo> todos = [];
  int id = 1;
  while (true) {
    stdout.write("Input Date : ");
    String? date = stdin.readLineSync();

    stdout.write("Input Task : ");
    String? task = stdin.readLineSync();

    stdout.write("Input Description : ");
    String? description = stdin.readLineSync();

    Todo todoInput = new Todo(id, date, task, description);

    todos.add(todoInput);
    print('|========== Todo List ==========|');
    todos.forEach((todo) {
      todo.showOutput();
    });
    print('|===============================|');
    id++;
  }
}

class Todo {
  int id;
  String? date = '';
  String? task = '';
  String? description = '';

  Todo(this.id, this.date, this.task, this.description);

  void showOutput() {
    print('\x1B[32m _id : $id \x1B[0m');
    print('\x1B[32m Date : $date \x1B[0m');
    print('\x1B[32m Task : $task \x1B[0m');
    print('\x1B[32m Description : $description \x1B[0m');
  }
}
