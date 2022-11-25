import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ViewImage extends StatefulWidget {
  ViewImage({Key? key, required this.photo}) : super(key: key);

  File photo;

  @override
  State<ViewImage> createState() => _ViewImageState();
}

class _ViewImageState extends State<ViewImage> {
  List<String> diagnose = [
    "небольшое отклонение",
    "сильное отклонение",
    "в норме"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Просмотр изображения"),
      ),
      body: ListView(
        children: [
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(20),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  kIsWeb
                      ? Image.network(widget.photo.path)
                      : Image.file(
                          widget.photo,
                          fit: BoxFit.cover,
                        ),
                  Positioned(
                    child: FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/spina.png",
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
          Container(
            padding: EdgeInsets.all(20.0),
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Text("Результат",
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.center),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                    "Ассиметрия надплечий: ${diagnose[random(diagnose.length)]}",
                    style: TextStyle(fontSize: 26),
                    textAlign: TextAlign.center),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                    "Отклонение линии остистых отростков от средней линии: ${diagnose[random(diagnose.length)]}",
                    style: TextStyle(fontSize: 26),
                    textAlign: TextAlign.center),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                    "Ассимметрия высоты стояния лопаток: ${diagnose[random(diagnose.length)]}",
                    style: TextStyle(fontSize: 26),
                    textAlign: TextAlign.center),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                    "Ассиметрия расстояний между углом лопаток и линией остистых отростков: ${diagnose[random(diagnose.length)]}",
                    style: TextStyle(fontSize: 26),
                    textAlign: TextAlign.center),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                    "Ассимметрия \"поясничных\" треугольников: ${diagnose[random(diagnose.length)]}",
                    style: TextStyle(fontSize: 26),
                    textAlign: TextAlign.center),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text("Мышечный \"валик\": ${diagnose[random(diagnose.length)]}",
                    style: TextStyle(fontSize: 26),
                    textAlign: TextAlign.center),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                    "Ассимметрия расположения крыльев подвздошных костей”: ${diagnose[random(diagnose.length)]}",
                    style: TextStyle(fontSize: 26),
                    textAlign: TextAlign.center),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text("Риск развития сколиоза: ${random(100)}%",
                    style: TextStyle(fontSize: 26),
                    textAlign: TextAlign.center),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Обратиться к специалисту"),
                    style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(fontSize: 20)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  int random(int num) => Random().nextInt(num);
}
