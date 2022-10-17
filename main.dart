import 'dart:io';

void main() {
  stdout.writeln('|========== Todo List APP ==========|');

  List<Todo> todos = [];
  int id = 1;
  bool isDone = false;

  while (true) {
    stdout.write("Input Operation(quit/add/report/dlt/update) : ");
    String? operation = stdin.readLineSync()?.toLowerCase();

    if (operation == 'q' || operation == 'quit') {
      print('\x1B[31m Quitting... \x1B[0m');
      break;
    } else if (operation == 'add' || operation == 'a') {
      stdout.write("Input Date : ");
      String? date = stdin.readLineSync();

      stdout.write("Input Task : ");
      String? task = stdin.readLineSync();

      stdout.write("Input Description : ");
      String? description = stdin.readLineSync();

      Todo todoInput = new Todo(id, date, task, isDone, description);

      todos.add(todoInput);
      print('\x1B[32m Successfully Added! \x1B[0m');
      id++;
    } else if (operation == 'report' || operation == 'r') {
      print('|========== Todo List ==========|');
      if (todos.length == 0) {
        print('\x1B[34m \t No info to Show. \x1B[0m');
      } else {
        todos.forEach((todo) {
          todo.showOutput();
        });
      }
      print('|===============================|');
    } else if (operation == 'd' ||
        operation == 'delete' ||
        operation == 'dlt') {
      int dlt = 0;

      if (todos.length == 0) {
        print('\x1B[34m \t No info to Show.Add task. \x1B[0m');
      } else {
        stdout.write("Input Task ID : ");
        dlt = int.parse(stdin.readLineSync()!);

        if (dlt > todos.length || dlt.runtimeType != int) {
          print('\x1B[31m Task id $dlt invalid! \x1B[0m');
        } else {
          var dltTodo = todos.elementAt(dlt - 1);
          dltTodo.showOutput();
          todos.removeAt(dlt - 1);
          print('\x1B[31m Deleted! \x1B[0m');
        }
      }
    } else if (operation == 'u' || operation == 'update') {
      if (todos.length == 0) {
        print('\x1B[34m \t No info to Show.Add a task! \x1B[0m');
      } else {
        int update = 0;

        stdout.write("Update status of Task ID : ");
        update = int.parse(stdin.readLineSync()!);

        if (update > todos.length || update.runtimeType != int) {
          print('\x1B[31m Task id $update invalid! \x1B[0m');
        } else {
          var updateTodo = todos.elementAt(update - 1);

          todos[update - 1].isDone = true;
          print('\x1B[32m Updated! \x1B[0m');

          updateTodo.showOutput();
        }
      }
    } else {
      print('Invalid Input!');
      print(
          'Input operations: ( a/add/ADD | r/report/Report | d/delete/dlt | u/update | q/quit');
    }
  }
}

class Todo {
  int id;
  String? date = '';
  String? task = '';
  bool isDone;
  String? description = '';

  Todo(this.id, this.date, this.task, this.isDone, this.description);

  void showOutput() {
    print('\x1B[34m _id : $id \x1B[0m');
    print('\x1B[34m Date : $date \x1B[0m');
    print('\x1B[34m Task : $task \x1B[0m');
    print('\x1B[34m Status : $isDone \x1B[0m');
    print('\x1B[34m Description : $description \x1B[0m');
  }
}
