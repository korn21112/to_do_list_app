import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp>{
  TextEditingController inputcontroller = new TextEditingController();
  List<String> _products = new List();
  String product;

  OutlineInputBorder _outlineInputBorder(){
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(28),
      borderSide: BorderSide(color: Colors.black),
      gapPadding: 10,
    );
  }

  Column _listOutput(){
    if(_products!=null){
      return Column(
          children: _products
              .map((element) => Card(
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Text(element),
                    IconButton(icon: new Icon(Icons.auto_delete), onPressed: null)
                  ],
                )
              ],
            ),

          ))
              .toList()
      );
    }
    else
      return Column();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'To Do List',
        home: Scaffold(
          //appBar: AppBar(),
          body: SafeArea(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'To do list',
                      style: TextStyle(fontSize: 36),
                    ),
                    Text('Enter what you want to do!!'),
                    Container(height: 30,),
                    TextFormField(
                      controller: inputcontroller,
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        enabledBorder: _outlineInputBorder(),
                        focusedBorder: _outlineInputBorder(),
                      ),
                    ),
                    RaisedButton(onPressed:(){
                      setState(() {
                        product=inputcontroller.text;
                        _products.add(product);
                        inputcontroller.text='';
                      });
                    },
                      child: Text('Add'),
                    ),

                    Column(
                        children: _products
                            .map((element) => Card(
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: [
                                  Text(element),
                                  IconButton(
                                      icon: new Icon(Icons.auto_delete),
                                      onPressed:(){
                                        setState(() {
                                          _products.remove(element);
                                        });
                                      } )
                                ],
                              )
                            ],
                          ),

                        ))
                            .toList()
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
