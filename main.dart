

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'screen2.dart';

void main() {
  runApp(const App());
}
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  static String text="";
  static double size=3.0;
  static  double padding=3.0;
  static String selectedValue='Button 1';
  static double radius=1;
  static double arrw=1;
  static double arrh=1;
  static double width=1;
  static Map<String,Color> hm={
    'red': Colors.red,
    'green': Colors.green,
    'blue': Colors.blue,
    'black': Colors.black,
    'white':Colors.white,
    'white2':Colors.white10,
    'white3':Colors.white30,
    'white4':Colors.white70,
    'orange':Colors.orange,
    'light green':Colors.lightGreen,
    'purple':Colors.purple,
    'violet':Colors.deepPurple,
    'pink':Colors.pink,
    'grey':Colors.grey,
    'indigo':Colors.indigo,
    'brown':Colors.brown,
    'yellow':Colors.yellow,
    'cyan':Colors.cyan,
    'deep blue':Colors.blueAccent,
    'lime':Colors.lime,
    'Red': Colors.red,
    'Green': Colors.green,
    'Blue': Colors.blue,
    'Black': Colors.black,
    'White':Colors.white,
    'White2':Colors.white10,
    'White3':Colors.white30,
    'White4':Colors.white70,
    'Orange':Colors.orange,
    'Light green':Colors.lightGreen,
    'Purple':Colors.purple,
    'Violet':Colors.deepPurple,
    'Pink':Colors.pink,
    'Grey':Colors.grey,
    'Indigo':Colors.indigo,
    'Brown':Colors.brown,
    'Yellow':Colors.yellow,
    'Cyan':Colors.cyan,
    'Deep blue':Colors.blueAccent,
    'Lime':Colors.lime,



  };
  static String textcolor='';
  static String bgcolor='';
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _textEditingController1 = TextEditingController();
  final TextEditingController _textEditingController2= TextEditingController();
  final TextEditingController _textEditingController3= TextEditingController();
  final TextEditingController _textEditingController4= TextEditingController();
  final TextEditingController _textEditingController5= TextEditingController();
  final TextEditingController _textEditingController6= TextEditingController();
  final TextEditingController _textEditingController7= TextEditingController();
  final TextEditingController _textEditingController8= TextEditingController();


  late Database database;

  Future<void> insertDataToDB(Map<String, dynamic> data) async {
    final db = await openDatabase(
      join(await getDatabasesPath(), 'your_database.db'),
      onCreate: (db, version) async {
        await db.execute('''
CREATE TABLE tooltip (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  text TEXT,
  size REAL,
  padding REAL,
  textcolor TEXT,
  bgcolor TEXT,
  radius REAL,
  width REAL,
  arrh REAL,
  arrw REAL
)
''');
      },
      version: 1,
    );

    await db.insert('tooltip', data,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  void _settext()async {
    final data = {
      'text': _textEditingController.text,
      'size': double.parse(_textEditingController1.text.toString()),
      'padding': double.parse(_textEditingController2.text.toString()),
      'textcolor': _textEditingController6.text.toString(),
      'bgcolor': _textEditingController7.text.toString(),
      'radius': double.parse(_textEditingController3.text.toString()),
      'width': double.parse(_textEditingController8.text.toString()),
      'arrh': double.parse(_textEditingController5.text.toString()),
      'arrw': double.parse(_textEditingController4.text.toString()),
    };

    insertDataToDB(data);
    setState(() {
      MyApp.text = _textEditingController.text;
      MyApp.size = double.parse(_textEditingController1.text.toString());
      MyApp.padding = double.parse(_textEditingController2.text.toString());
      MyApp.textcolor = _textEditingController6.text.toString();
      MyApp.bgcolor = _textEditingController7.text.toString();
      MyApp.radius = double.parse(_textEditingController3.text.toString());
      MyApp.width = double.parse(_textEditingController8.text.toString());
      MyApp.arrh = double.parse(_textEditingController5.text.toString());
      MyApp.arrw = double.parse(_textEditingController4.text.toString());
    });
  }
 bool color(String? val){
    return MyApp.hm.containsKey(val);
 }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.deepPurple,title: Text('Render ToolTip'),),
        body:Form(
          key: _formKey,
    child:SingleChildScrollView(
          child:Container(
          color: Colors.white10,
          padding: EdgeInsets.all(20),
          child:Column(
            children: [
              Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Container(

                      child: Text('Target Element',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                      padding: EdgeInsets.only(bottom: 10),
                    ),
                    Container(

                      width: 350,
                      height: 50,

                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1.05),
                        borderRadius: BorderRadius.circular(10),
                      ),

                      child:DropdownButton<String>(
                      
                      value: MyApp.selectedValue,
                      onChanged: (newValue) {
                        setState(() {
                          MyApp.selectedValue = newValue!;
                        });
                      },
                        icon: Icon(Icons.arrow_drop_down),
                        items: <String>['Button 1', 'Button 2', 'Button 3', 'Button 4','Button 5']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                            child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.0), // Add padding here
                        child: Text(
                        value,
                        style: TextStyle(fontSize: 16.0),
                        ),),);
                      }).toList(),
                    ),)


                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Container(

                      child: Text('Tooltip Text',
                          style: TextStyle(

                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                      padding: EdgeInsets.only(bottom: 10),
                    ),
                    Container(

                      width: 400,
                      height:61,

                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 0.50),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      //padding: EdgeInsets.all(20),
                      child:TextFormField(
                         controller: _textEditingController,
                         validator: (value){
                           if(value=="null"){
                             return "Please Enter Tooltip Text";
                           }
                           return null;

                         },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Input',

                        ),
                      ))


                  ]
                ),
              ),
              Container(
                child: Row(

                  children: [
                    Container(

                      padding: EdgeInsets.all(5.0),
                      child: Column(
                      children: [
                        Container(
                          child:Text('Text Size',
                              style: TextStyle(

                                fontSize: 18.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )),
                          padding: EdgeInsets.only(bottom: 10,right: 86,left: 10),

                        ),
                        Container(
                          width: 160,
                          height:61,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 0.50),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            controller: _textEditingController1,
                            validator: (value){
                              if(value=="null"||double.parse(value.toString())<1||double.parse(value.toString())>50){
                                setState(() {
                                  _textEditingController2.text="";
                                });
                                return 'Enter Proper Value';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter From 1-50',

                            ),
                          ),
                        )

                      ],
                    ),),
                    Container(
                      //width:50,
                      padding: EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Container(
                            child:Text('Padding',
                                style: TextStyle(

                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                )),
                            padding: EdgeInsets.only(bottom: 10,right: 86,left: 0),

                          ),
                          Container(
                            width: 170,
                            height:61,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 0.50),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              controller: _textEditingController2,
                               validator: (value){
                        if(value=="null"||double.parse(value.toString())<1||double.parse(value.toString())>50){
                          setState(() {
                            _textEditingController2.text="";
                          });
    return 'Enter Proper Value';
    }
    return null;},
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter From 1-50',

                              ),
                            ),
                          )

                        ],
                      ),)

                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Container(

                        child: Text('Text colour',
                            style: TextStyle(

                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )),
                        padding: EdgeInsets.only(bottom: 10),
                      ),
                      Container(

                          width: 400,
                          height:61,

                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 0.50),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          //padding: EdgeInsets.all(20),
                          child:TextFormField(
                            controller: _textEditingController6,
                            validator: (value){
                              if(value=="null"||!MyApp.hm.containsKey(value.toString())){
                                return 'Sorry,this color doesnot exist';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Input',

                            ),
                          ))


                    ]
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Container(

                        child: Text('Background Color',
                            style: TextStyle(

                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )),
                        padding: EdgeInsets.only(bottom: 10),
                      ),
                      Container(

                          width: 400,
                          height:61,

                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 0.50),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          //padding: EdgeInsets.all(20),
                          child:TextFormField(
                            controller: _textEditingController7,
                            validator: (value){
                              if(value==null||!MyApp.hm.containsKey(value.toString())){
                              return 'Sorry,this color doesnot exist';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),

                              hintText: 'Input',
                            ),
                          ))


                    ]
                ),
              ),
        Container(
          child: Row(

            children: [
              Container(
                //width:50,
                //padding: EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Container(
                      child:Text('Corner Radius',
                          textAlign: TextAlign.left,
                          style: TextStyle(

                            fontSize: 18.0,
                            color: Colors.black,

                            fontWeight: FontWeight.bold,
                          )),
                      padding: EdgeInsets.only(bottom: 10,right: 56,top:1,left:5),

                    ),
                    Container(
                      width: 161,
                      height:55,
                      //padding: EdgeInsets.only(right:6,left: 6),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 0.35),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextFormField(
                        controller: _textEditingController3,
                        validator: (value){
                          if(value==null||double.parse(value.toString())<1||double.parse(value.toString())>30){
                            setState(() {
                              _textEditingController3.text="";

                            });
                            return 'Invalid Value';
                          }
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),

                          hintText: 'Enter From 1-30',
                        ),
                      ),
                    )

                  ],
                ),),
              Container(
                //width:50,
                padding: EdgeInsets.only(left: 18),
                child: Column(

                  children: [

                    Container(
                      child:Text('ToolTip width',
                          textAlign: TextAlign.left,

                          style: TextStyle(

                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                      padding: EdgeInsets.only(bottom: 10,right:50,left:0),

                    ),
                    Container(
                      width: 160,
                      height:55,
                      //padding: EdgeInsets.only(left:56),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 0.50),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: _textEditingController8,
                        validator: (value){
                          if(value==null||double.parse(value.toString())<20&&double.parse(value.toString())>100){
                            setState(() {
                              _textEditingController8.text="";
                            });
                            return 'Invalid Value';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),

                          hintText: 'Enter From 20-100',
                        ),
                      ),
                    )

                  ],
                ),),




      ],),

        ),
              Container(
                child: Row(

                  children: [
                    Container(
                      //width:50,
                      //padding: EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Container(
                            child:Text('Arrow width',
                                textAlign: TextAlign.left,
                                style: TextStyle(

                                  fontSize: 18.0,
                                  color: Colors.black,


                                  fontWeight: FontWeight.bold,
                                )),
                            padding: EdgeInsets.only(bottom: 10,right: 66,top:5,left:5),

                          ),
                          Container(
                            width: 161,
                            height:51,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 0.35),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: TextFormField(
                              controller:_textEditingController4,
                                validator: (value){
                                  if(value==null||double.parse(value.toString())<1||double.parse(value.toString())>20){
                                    setState(() {
                                      _textEditingController4.text="";
                                    });
                                    return 'Invalid Value';
                                  }
                                  return null;
                                },

                              decoration: InputDecoration(
                                border: OutlineInputBorder(),

                                hintText: 'Enter From 1-20',
                              ),
                            ),
                          )

                        ],
                      ),),
                    Container(
                      //width:50,
                      padding: EdgeInsets.only(left: 18),
                      child: Column(

                        children: [

                          Container(
                            child:Text('Arrow height',
                                textAlign: TextAlign.left,

                                style: TextStyle(

                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                )),
                            padding: EdgeInsets.only(bottom: 10,right:50,left:0,top: 5),

                          ),
                          Container(
                            width: 168,
                            height:51,

                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 0.50),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextFormField(
                              controller: _textEditingController5,
                              validator: (value){
                                if(value==null||double.parse(value.toString())<1&&double.parse(value.toString())>20){
                                  setState(() {
                                    _textEditingController5.text="";
                                  });
                                  return 'Invalid Value';
                                }
                                return null;
                              },

                              decoration: InputDecoration(
                                border: OutlineInputBorder(),

                                hintText: 'Enter From 1-20',
                              ),
                            ),
                          )

                        ],
                      ),),




                  ],),

              ),

              Container(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    ),

                    child: Text('Render Tooltip',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19.0,
                    ),),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _settext();


                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Screen2()));
                      }




                    },
                  ),
                ),

              )


            ],),))
      )),
    );
  }
}


