import 'dart:io';

import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hackatone_camera/view_image.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final photos = <File>[];
  int _index = 0;

  void openCamera() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => CameraCamera(
                  onFile: (file) {
                    photos.add(file);
                    Navigator.pop(context);
                    setState(() {});
                  },
                )));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: GridView.builder(
          physics: ScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              childAspectRatio: 3 / 4,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: photos.length,
          itemBuilder: (BuildContext ctx, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () => {
                  setState(() {
                    _index = index;
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ViewImage(photo: photos[index])));
                  })
                },
                child: Container(
                  width: size.width,
                  child: kIsWeb
                      ? Image.network(photos[index].path)
                      : Image.file(
                          photos[index],
                          fit: BoxFit.cover,
                        ),
                ),
              )),
        ),
        floatingActionButton: SizedBox(
          width: MediaQuery.of(context).size.width * 0.2,
          height: MediaQuery.of(context).size.width * 0.2,
          child: FloatingActionButton(
            backgroundColor: Colors.deepPurple,
            onPressed: openCamera,
            child: Icon(
              Icons.camera_alt,
              size: MediaQuery.of(context).size.width * 0.1,
              color: Colors.white,
            ),
          ),
        ));
  }
}
