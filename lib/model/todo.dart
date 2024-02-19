class ToDo {
  String? id;
  String? todoText;
  bool isDone;
  ToDo({this.id, this.todoText, this.isDone = false});
  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'drink water', isDone: true),
      ToDo(id: '02', todoText: 'Eat Breakfast', ),
      ToDo(id: '03', todoText: 'go to office', ),
      ToDo(id: '04', todoText: 'Meeting at 2 p.m', ),
      ToDo(id: '05', todoText: 'Have Medicines', ),
    ];
  }
}
