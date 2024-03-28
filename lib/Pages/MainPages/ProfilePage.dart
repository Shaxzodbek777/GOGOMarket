import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
class ProfilrPage extends StatefulWidget {
  const ProfilrPage({super.key});
  static final String id = 'ProfilrPage';
  @override
  State<ProfilrPage> createState() => _ProfilrPageState();
}

class _ProfilrPageState extends State<ProfilrPage> {
  File? _image;
  final ImagePicker _picker = ImagePicker();


  _imgFromGallery() async {
    XFile? image =
    await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    setState(() {
      _image = File(image!.path);
    });
  }

  _imgFromCamera() async {
    XFile? image =
    await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    setState(() {
      _image = File(image!.path);
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: [
                  ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Pick Photo'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Take Photo'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(height: 20,),

                  //Appbar
                  Container(
                    width: 380,
                    height: 48,
                    child: Row(
                      children: [
                        Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/2logo.png')
                              )
                          ),
                        ),
                        SizedBox(width: 18,),
                        Text("Профиль", style: TextStyle(color: Colors.black, fontFamily: "Musio",fontWeight: FontWeight.bold, fontSize: 24),)
                      ],
                    ),
                  ),
                  SizedBox(height:30,),


                  //My Infos
                  Row(
                    children: [
                      SizedBox(width: 24,),
                      GestureDetector(
                        onTap: (){
                          _showPicker(context);
                        },
                        child:  Stack(
                          children: [
                            Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(70),
                                  border: Border.all(
                                      width: 1.5
                                  )
                              ),
                              child: _image != null ? ClipRRect(
                                  borderRadius: BorderRadius.circular(35),
                                  child:Image.file(
                                    _image!,
                                    width: 70,
                                    height: 70,
                                    fit: BoxFit.cover,
                                  )):
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundImage: AssetImage('assets/images/person.jpg'),

                              ),
                            ),
                            Container(
                              width: 90,
                              height: 90,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Icon(Icons.edit, color: Color(0xFFFF5001),)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 12,),
                      Column(
                        children: [
                          Text("Вова Адидас", style: TextStyle(color: Colors.black, fontFamily: 'Musio', fontWeight: FontWeight.bold, fontSize: 20),),
                          SizedBox(height: 8,),
                          Text("+998 90 989 98 98", style: TextStyle(color: Colors.black, fontFamily: 'Musio', fontSize: 20),)
                        ],
                      )

                    ],
                  ),
                  SizedBox(height: 30,),
                  Container(
                    height: 60,
                    width: double.maxFinite,
                    padding: EdgeInsets.only(left: 10,right: 15.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          child: Row(
                            children: [
                              Image(image: AssetImage('assets/images/icons/basket.png')),
                              SizedBox(width: 10,),
                              Text('Мои заказы', style: TextStyle(fontFamily: "Musio",fontSize: 18),),
                            ],
                          ),
                        ),
                        GestureDetector(
                            onTap: (){},
                            child: Icon(Icons.navigate_next)),
                      ],
                    ),
                  ),
                  SizedBox(height: 7,),
                  Container(
                    height: 60,
                    width: double.maxFinite,
                    padding: EdgeInsets.only(left: 8.0,right: 15.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          child: Row(
                            children: [
                              Image(image: AssetImage('assets/images/icons/person.png')),
                              SizedBox(width: 10,),
                              Text('Личные данные',style: TextStyle(fontFamily: "Musio",fontSize: 18)),
                            ],
                          ),
                        ),
                        GestureDetector(
                            onTap: (){},
                            child: Icon(Icons.navigate_next)),
                      ],
                    ),
                  ),
                  SizedBox(height: 7,),
                  Container(
                    height: 60,
                    width: double.maxFinite,
                    padding: EdgeInsets.only(left: 8.0,right: 15.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          child: Row(
                            children: [
                              Image(image: AssetImage('assets/images/icons/location.png')),
                              SizedBox(width: 10,),
                              Text('Адреса',style: TextStyle(fontFamily: "Musio",fontSize: 18)),
                            ],
                          ),
                        ),
                        GestureDetector(
                            onTap: (){},
                            child: Icon(Icons.navigate_next)),
                      ],
                    ),
                  ),
                  SizedBox(height: 7,),
                  Container(
                    height: 60,
                    width: double.maxFinite,
                    padding: EdgeInsets.only(left: 8.0,right: 15.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          child: Row(
                            children: [
                              Image(image: AssetImage('assets/images/icons/mony.png')),
                              SizedBox(width: 10,),
                              Text('Способы оплаты',style: TextStyle(fontFamily: "Musio",fontSize: 18)),
                            ],
                          ),
                        ),
                        GestureDetector(
                            onTap: (){},
                            child: Icon(Icons.navigate_next)),
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    height: 60,
                    width: double.maxFinite,
                    padding: EdgeInsets.only(left: 8.0,right: 15.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          child: Row(
                            children: [
                              Image(image: AssetImage('assets/images/icons/lang.png')),
                              SizedBox(width: 10,),
                              Text('Язык',style: TextStyle(fontFamily: "Musio",fontSize: 18),),
                            ],
                          ),
                        ),
                        Text("Русский",style: TextStyle(color: Color(0xFFFF5001), fontFamily: 'Musio',fontSize: 18),),
                        GestureDetector(
                            onTap: (){},
                            child: Icon(Icons.navigate_next)),
                      ],
                    ),
                  ),
                  SizedBox(height: 7,),
                  Container(
                    height: 60,
                    width: double.maxFinite,
                    padding: EdgeInsets.only(left: 8.0,right: 15.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          child: Row(
                            children: [
                              Image(image: AssetImage('assets/images/icons/Lock.png')),
                              SizedBox(width: 10,),
                              Text('Безопасность',style: TextStyle(fontFamily: "Musio",fontSize: 18)),
                            ],
                          ),
                        ),
                        GestureDetector(
                            onTap: (){},
                            child: Icon(Icons.navigate_next)),
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    height: 60,
                    width: double.maxFinite,
                    padding: EdgeInsets.only(left: 8.0,right: 15.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          child: Row(
                            children: [
                              Image(image: AssetImage('assets/images/icons/info.png')),
                              SizedBox(width: 10,),
                              Text('Часто задаваемые вопросы',style: TextStyle(fontFamily: "Musio",fontSize: 18)),
                            ],
                          ),
                        ),
                        GestureDetector(
                            onTap: (){},
                            child: Icon(Icons.navigate_next)),
                      ],
                    ),
                  ),
                  SizedBox(height: 7,),
                  Container(
                    height: 60,
                    width: double.maxFinite,
                    padding: EdgeInsets.only(left: 8.0,right: 15.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          child: Row(
                            children: [
                              Image(image: AssetImage('assets/images/icons/Chat.png')),
                              SizedBox(width: 10,),
                              Text('Связаться с нами',style: TextStyle(fontFamily: "Musio",fontSize: 18)),
                            ],
                          ),
                        ),
                        GestureDetector(
                            onTap: (){},
                            child: Icon(Icons.navigate_next)),
                      ],
                    ),
                  ),
                  SizedBox(height: 40,),
                  Row(
                    children: [
                      SizedBox(width: 24,),
                      Image(image: AssetImage('assets/images/icons/Logout.png')),
                      SizedBox(width: 16,),
                      Text('Выйти',style: TextStyle(color: Color(0xFFFF5001), fontFamily: 'Musio', fontSize: 18),)
                    ],
                  )



                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
