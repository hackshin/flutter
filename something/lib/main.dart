import 'package:flutter/material.dart';

import 'dart:io';

import 'package:image_picker/image_picker.dart';

void main()=>runApp(MyApp());

class MyApp extends StatefulWidget{

   @override

  State<StatefulWidget> createState(){
  return _MyAppState();
}
//  every statefull widget class needs to return its 
//  state class that is in this case is _MyAppState();
// so lets create it 

}

class _MyAppState extends State<MyApp>{

File _image;

Future getImage(bool isCamera) async{
  File image;
  if(isCamera)
  {
    // the image will be store in the image variable in the future when the user
    // will enter tap on the camera icon or gallery icon so for now what we can do is
    // await because before that the Future tupe function does not know what kind of 
    // variable is image because untill users enters the camera it will not get the file type
    // so it will give error so we need to kind of make it wait for sometime so that's why
    // we use this await key for this hope that you understood this 
    image = await ImagePicker.pickImage(source: ImageSource.camera);
  }
  else{
    image = await ImagePicker.pickImage(source: ImageSource.gallery);
  }
  setState(() {
    _image=image;
  });

}
@override

Widget build(BuildContext context)
{

return MaterialApp(

  home: Scaffold(
    backgroundColor: Color.fromRGBO(10,100,200,1),
    appBar: AppBar(
      title: Text('Pick your image'),
    ),
    body: Center(
      
      child: Column(
        children: <Widget>[
          SizedBox(height: 50.0,),
          IconButton(

            icon: Icon(Icons.insert_drive_file,size: 50.0,),
            onPressed: (){},
          ),
          SizedBox(height: 60.0,),
            IconButton(
            icon: Icon(Icons.camera_alt,size: 50.0,color: Color.fromRGBO(0,1,0,1)),
            onPressed: (){},
          ),
          _image == null? Container(): Image.file(_image,height: 300.0,width: 300.0,),
        ],
      ),
    ),

  ),

);

}
}

