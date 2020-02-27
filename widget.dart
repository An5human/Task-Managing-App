import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String username;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Stack(
          alignment: Alignment.center,
          children: <Widget>[
      Container(
            width: 500,
      decoration: BoxDecoration(
        //color: Color.alphaBlend(Color.fromRGBO(0, 0, 217, 50),Color.fromRGBO(4, 142, 198, 50))
        image: DecorationImage(image: AssetImage("img/img.jpeg"),fit:BoxFit.cover),
        //backgroundBlendMode: BlendMode.color,
    )),
      Container(
          width:340,
          height: 450,


          decoration: BoxDecoration(
              color: Color.alphaBlend(Color.fromRGBO(50, 1,10, 90),Color.fromRGBO(4, 142, 198, 90))
            //image: DecorationImage(image: AssetImage("img/img.jpeg"),fit:BoxFit.cover),
            //backgroundBlendMode: BlendMode.color,
          ),
    child:Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children : <Widget>[
      Padding(
      padding: const EdgeInsets.symmetric(vertical: 70.0),
        child: Text("Welcome",
          style: TextStyle(
            fontSize: 50,
            color: Colors.green,
          ),))
        ,
          Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child:  TextFormField(
                  autofocus: true,
                  decoration: const InputDecoration(
                   hintText: 'Username',
                    errorText: "Invalid Username",
                  ),
                  //style: new TextStyle(color: Colors.green),
                  validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  username = value;
                  //Processing the data.
                  return null;
              },
            ),),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child:  TextFormField(
              decoration: const InputDecoration(
                hintText: "Please Enter Password",
              ),
                //style: new TextStyle(color: Colors.green),
              validator: (value) {
                if (value.isEmpty) {
                     return 'Please enter some text';
                }
                password = value;
                return null;},
          obscureText: true,
            ),),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: RaisedButton(
                onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                 if(username != "" && password != "")
                   {
                     Navigator.pushNamed(context, "/home");
                   }
                }
              },
                color: Colors.lightGreen,
    highlightColor: Colors.green,
                textColor: Colors.white,
                child: Text("Submit"),
      ),
    ),

    ]
    ,
    )
    )],))],));
  }
}