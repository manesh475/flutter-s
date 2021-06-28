import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  var output = "";
  List<dynamic> lst = ["Manesh", "Kumar"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: lst.length,
          itemBuilder: (context, index) {
            return Container(
              height: 50,
              color: Colors.cyan[200],
              margin: EdgeInsets.all(8),
              
            decoration: BoxDecoration(
              color:Colors.orange,
              border: Border.all(
                color: Colors.pink,
                width: 3.0),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0)),
                  boxShadow: [BoxShadow(blurRadius: 8,color:Colors.grey, offset: Offset(1,3))]
              ),
            
              child: ListTile(
              
                title: Text("${lst[index]}"),
                trailing: Container(
                    width: 50,
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                      title: Text("Edit Item"),
                                      content: TextField(
                                        onChanged: (value) {
                                          output = value;
                                        },
                                      ),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () {
                                              setState(
                                                () {
                                                  lst.replaceRange(index,
                                                      index + 1, {output});
                                                },
                                              );
                                              Navigator.of(context).pop();
                                            },
                                            child: Text("Update Text"),
                                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.black)),
                                        )],
                                    );
                                  });
                            },
                            child: Icon(Icons.edit)),
                            
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                lst.removeAt(index);
                              });
                            },
                            child: Icon(Icons.delete)),
                      ],
                    )),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  title: Text("Add todo"),
                  content: TextField(
                    onChanged: (value) {
                      output = value;
                    },
                  ),
                  actions: [
                    ElevatedButton(
                      
                        onPressed: () {
                          setState(
                            () {
                              lst.add(output);
                            },
                          );
                          Navigator.of(context).pop();
                        },
                        
                        child: Text("Add"),
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.black)),
                        
                        
                        )
                  ],
                );
              });
        },
        child:Icon(Icons.add),
        backgroundColor: Colors.black,
         //Text("+"),
      ),
    );
  }
}
