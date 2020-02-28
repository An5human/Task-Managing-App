import 'package:flutter/material.dart';

List<Widget> _list = [];
List<Widget> _complete = [];

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            bottom: TabBar(
              tabs: [
                Tab(text: "Upcoming"),
                Tab(text: "Completed"),
              ],
            ),
            title: Text('Tasks'),
          ),
          body: TabBarView(
            children: [
              Container(
                child: Column(
                  children: _list,
                ),
              ),
              Container(
                child: Column(
                  children: _complete,
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
    child: Icon(
            Icons.add,
            color: Colors.white,
          ),
    onPressed:(){
      String title = " ",task = " ";
      showDialog(child: new Dialog(

        child: new Container(
          height:200,
            width: 120,
            child: new Form(
              key: _formKey,
              child:Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("Task"),
              new Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: new TextFormField(
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Title',
                  errorText: "Title",
                ),
                //style: new TextStyle(color: Colors.green),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  title = value;
                  print(title);
                  //Processing the data.
                  return null;
                },
              ),),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child:TextFormField(
                  autofocus: true,
                  decoration: const InputDecoration(
                  hintText: 'Task',
                ),
                //style: new TextStyle(color: Colors.green),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  task = value;
                  //Processing the data.
                  return null;
                  },
                ),
              ),
              new RaisedButton(
                color: Colors.lightGreen,
                highlightColor: Colors.green,
                textColor: Colors.white,
                child: new Text("Add"),
                onPressed: (){
                  if (_formKey.currentState.validate()){
                  setState((){
                    if(_list.length==0)
                    _list.add(Task(title,task,'0'));
                  });
                  Navigator.pop(context);}
                  },
              )
              ],
              )
            ),
        ),
      ),
          context:context
      );
    }
    ),
        )
    );
  }
}


class Task extends StatefulWidget {
  final String title,task,i;
  const Task(this.title,this.task,this.i);

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  Icon _icon = new Icon(Icons.check_box_outline_blank);

  void remove(){
    _icon = Icon(Icons.check_box);
    _complete.add(_list[0]);
    if(_list.length > 0)
    _list.removeAt(0);
    //Home();
  }

  void delete(){
    if(_complete.length > 0 )
      _complete.removeAt(0);
    //Home();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration( border: Border.all(color: Colors.black,)),
      margin: const EdgeInsets.symmetric(vertical: 1.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: IconButton(icon: _icon, onPressed: (){setState(() {
              remove();
            });
            }
    ),
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(widget.title, style: Theme.of(context).textTheme.subhead),
              new Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: new Text(widget.task),
              ),
            ],
          ),
          Spacer(),
          new Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: IconButton(icon: new Icon(Icons.delete) , onPressed: (){setState(() {
              delete();
            });
            }
            ),
          ),
        ],
      ),
    );
  }
}
