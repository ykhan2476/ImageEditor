import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'dart:ui';
import 'dart:io';

import 'package:yasha_khan/screens/dialog.dart';
import 'package:yasha_khan/screens/shapes.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';




class home extends StatefulWidget {
  File? backimage;
  String? shape;
  home({super.key,this.shape,this.backimage});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
 //declaring image 
  File? _selectedimage;
  Future<void> _getImage() async {
  final picker = ImagePicker();
  final pickedImage = await picker.pickImage(source: ImageSource.gallery);

  if (pickedImage == null) {
    print('No image selected');
    return;
  }
  // Crop the selected image
CroppedFile? croppedImage = await ImageCropper().cropImage(
      sourcePath: pickedImage.path,
      aspectRatioPresets: [CropAspectRatioPreset.original],
      uiSettings: [
        AndroidUiSettings(
          
            toolbarTitle: 'Crop',
            toolbarColor: Color.fromARGB(255, 16, 56, 55),
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,),
        IOSUiSettings(
          title: 'Crop',
        ),
        WebUiSettings(
          context: context,
        ),
      ],
    );
  if (croppedImage != null) {
    setState(() {
      _selectedimage = File(croppedImage.path);
    });
    
  }
 else {
    setState(() {
      _selectedimage =File(pickedImage.path);
    }); 
  }
  Navigator.push(context, MaterialPageRoute(builder: (context) =>dialog(image: _selectedimage,)));
}

check(){
  if(widget.shape=='heart'){
    return heart();
  }
  if(widget.shape=='square'){
    return square();
  }
   if(widget.shape=='rectangle'){
    return rectangle();
  }
   if(widget.shape=='circle'){
    return circle();
  }
  else{
    return null;
  }
}

  @override
  Widget build(BuildContext context) {
    
    double hght = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,foregroundColor: Color.fromARGB(255, 96, 94, 94),
       title:Text('Add Image / Icon') ,
       leading: IconButton(
         onPressed: (){SystemChannels.platform.invokeMethod('SystemNavigator.pop');},
         icon: Icon(Icons.keyboard_arrow_left_outlined)),)
      ,body: Center(child: Column(children: [
        Container(height:hght*0.2,width: wid ,margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                     border: Border.all(color: Color.fromARGB(255, 96, 94, 94)),
                     borderRadius: BorderRadius.circular(10),),
                  child: Column(children: [
                    Container(height: hght*0.1,padding: EdgeInsets.all(20),
                            child:Text('Upload Image',style: TextStyle(
                              fontSize: 18,color: Color.fromARGB(255, 96, 94, 94),
                              fontFamily: AutofillHints.countryCode))),
                    ElevatedButton(
                      onPressed: 
                        _getImage,
                      child:Text('Choose From Device',style: TextStyle(fontSize: 18 ),)),
                    
                  ],),),
        SizedBox(height: 20),
        ClipPath(clipper: check(),child:Container(height: hght*0.6,width: wid*0.9,clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(0)),
              child:  widget.backimage != null? 
              Container(height: hght*0.3,width: wid*0.9,child:Image.file(widget.backimage!,fit: BoxFit.cover,),)
              : Text('No image selected'),)),
      ],),));
  }
}
