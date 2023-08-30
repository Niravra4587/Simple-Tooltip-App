import 'package:flutter/material.dart';
import 'package:untitled3/main.dart';

import 'customtooltip.dart';


class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {

  bool isbutton(String s) {
    if (MyApp.selectedValue.compareTo(s) == 0) {
           return true;
    }
    return false;
  }
  final GlobalKey _tooltipKey = GlobalKey();

  void _showTooltip() {
    final dynamic tooltip = _tooltipKey.currentState;
    tooltip.ensureTooltipVisible();
  }
  bool show=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Stack(
        children: [

          Align(alignment: Alignment.center,
          child:isbutton('Button 1')?

GestureDetector(
    onTap: _showTooltip,

            child:
            Tooltip(

              key:_tooltipKey,
              child:ElevatedButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white70),
                ),
                child: Text('Button 1',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 19.0,
                  ),),
                onPressed:null,
              ),
              


              
              message:MyApp.text,
              textStyle: TextStyle(fontSize: MyApp.size,color:MyApp.hm[MyApp.textcolor],),
              padding: EdgeInsets.all(20),
              showDuration: const Duration(seconds: 10),
              decoration: ShapeDecoration(

                color: MyApp.hm[MyApp.bgcolor],
                shape: ToolTipCustomShape(usePadding: true,direction: 1,p:-10,radius:MyApp.radius),)

          )):ElevatedButton(
      style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white70),
    ),
    child: Text('Button 1',
    style: TextStyle(
    color: Colors.black,
    fontSize: 19.0,
    ),),
    onPressed:(){
        Navigator.pop(context);
    },
    ),),
        Align(
          alignment: Alignment.topLeft,
            child: isbutton('Button 2')?
            GestureDetector(
              onTap:_showTooltip,
                child:Tooltip(
                  key:_tooltipKey,
                child:ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white70),
              ),
              child: Text('Button 2',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 19.0,
                ),),
              onPressed:null,
            ),
    message: MyApp.text,

    textStyle: TextStyle(fontSize: MyApp.size,color:MyApp.hm[MyApp.textcolor]),
    padding: EdgeInsets.all(20),
    showDuration: const Duration(seconds: 10),
     preferBelow: true,
    decoration: ShapeDecoration(

      color: MyApp.hm[MyApp.bgcolor],
    shape: ToolTipCustomShape(usePadding: true,direction: 1,p:-15,radius: MyApp.radius),)

        )):ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white70),
              ),
              child: Text('Button 2',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 19.0,
                ),),
              onPressed:(){
                Navigator.pop(context);
              },
            )),
    Align(
    alignment: Alignment.topRight,
    child: isbutton('Button 3')?
    GestureDetector(
      onTap: _showTooltip,
        child:Tooltip(
      key: _tooltipKey,
      child: ElevatedButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white70),
        ),
        child: Text('Button 3',
          style: TextStyle(
            color: Colors.black,
            fontSize: 19.0,
          ),),
        onPressed: null,

      ),

      message: MyApp.text,
      padding: EdgeInsets.all(20),
      showDuration: const Duration(seconds: 10),
      decoration: ShapeDecoration(
        color: MyApp.hm[MyApp.bgcolor],
        shape: ToolTipCustomShape(usePadding:true,direction:1 ,p: 15,radius:MyApp.radius),
      ),
      textStyle: TextStyle(color:MyApp.hm[MyApp.textcolor],fontSize: MyApp.size,),

      preferBelow: true,


    )):ElevatedButton(
    style: ButtonStyle(
    foregroundColor: MaterialStateProperty.all<Color>(Colors.white70),
    ),
    child: Text('Button 3',
    style: TextStyle(
    color: Colors.black,
    fontSize: 19.0,
    ),),
    onPressed: (){
      Navigator.pop(context);
    },
    ),),

    Align(
    alignment: Alignment.bottomLeft,
    child:isbutton('Button 4')?
        GestureDetector(
          onTap: _showTooltip,
            child:Tooltip(
              key: _tooltipKey,
    child: ElevatedButton(
    style: ButtonStyle(
    foregroundColor: MaterialStateProperty.all<Color>(Colors.white70),
    ),
    child: Text('Button 4',
    style: TextStyle(
    color: Colors.black,
    fontSize: 19.0,
    ),),
    onPressed: null,

    ),

      message: MyApp.text,
      padding: EdgeInsets.all(20),
      showDuration: const Duration(seconds: 10),
      decoration: ShapeDecoration(
        color: MyApp.hm[MyApp.bgcolor],
        shape: ToolTipCustomShape(usePadding:true,p: 35,direction: -1,radius: MyApp.radius),
      ),
      textStyle: TextStyle(color:MyApp.hm[MyApp.textcolor],fontSize: MyApp.size),


    )):ElevatedButton(
    style: ButtonStyle(
    foregroundColor: MaterialStateProperty.all<Color>(Colors.white70),
    ),
    child: Text('Button 4',
    style: TextStyle(
    color: Colors.black,
    fontSize: 19.0,
    ),),
    onPressed:(){
      Navigator.pop(context);
    },

    )),
    Align(
    alignment: Alignment.bottomRight,
    child:isbutton('Button 5')?
    GestureDetector(
      onTap:_showTooltip,
        child:Tooltip(
          key: _tooltipKey,
    child: ElevatedButton(
    style: ButtonStyle(
    foregroundColor: MaterialStateProperty.all<Color>(Colors.white70),
    ),
    child: Text('Button 5',
    style: TextStyle(
    color: Colors.black,
    fontSize: 19.0,
    ),),
    onPressed: null,
    ),
    message: MyApp.text,
    padding: const EdgeInsets.all(20),
    showDuration: const Duration(seconds: 10),
    decoration: ShapeDecoration(
      color: MyApp.hm[MyApp.bgcolor],
    shape: ToolTipCustomShape(usePadding: true,p:25,direction: -1,radius: MyApp.radius),
    ),
    textStyle: TextStyle(color:MyApp.hm[MyApp.textcolor],fontSize: MyApp.size),

    )):ElevatedButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white70),
      ),
      child: Text('Button 5',
        style: TextStyle(
          color: Colors.black,
          fontSize: 19.0,
        ),),
      onPressed: (){
        Navigator.pop(context);
      }

    ),)]
    ));
  }



}



