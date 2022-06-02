import 'package:flutter/material.dart';

class StoykaStatics extends StatefulWidget {
  const StoykaStatics({Key? key}) : super(key: key);

  @override
  _StoykaStaticsState createState() => _StoykaStaticsState();
}

class _StoykaStaticsState extends State<StoykaStatics> {

  final heightController = TextEditingController();
  final b1Controller = TextEditingController();
  final b2Controller = TextEditingController();
  final panesHController = TextEditingController();
  final panesWController = TextEditingController();

  String cities = 'Выбрать из списка';
  String windZone = 'Выбрать из списка';
  String highPoint = 'Выбрать из списка';
  String panes = 'Выбрать из списка';

  double modulE = 7000.00;

  double caer = 0.8;
  double calt = 1.0;
  double cref = 1.0;
  double cdtr = 1.0;
  double cd = 1.0;
  double gre = 1.0;

  late double pL;
  late double len;

  late double w0, ch, c, k1, k2, b1, b2, l, fdop, lDel, we, w, stJx, panesH, panesW;


  @override
  void dispose() {
    heightController.dispose();
    b1Controller.dispose();
    b2Controller.dispose();
    panesHController.dispose();
    panesWController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.deepOrangeAccent,
      title: const Text('Ветровая нагрузка на стойку'),),
      body: ListView(
            padding: EdgeInsets.all(50.0),
            children:  [
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text('Область установки фасада'),
              ),
              createListCities(),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text('Ветровая зона'),
              ),
              createListWindZone(),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text('Наивысшая точка фасада'),
              ),
              createListHighPoint(),
              const Text('Остекление'),
              createListPanes(),
              const Text('Расстояние между точками крепления стоек, см'),
              TextField(controller: heightController,
                keyboardType: TextInputType.number,),
              const Text('Расстояние до стойки слева, см'),
              TextField(controller: b1Controller,
                keyboardType: TextInputType.number,),
              const Text('Расстояние до стойки справа, см'),
              TextField(controller: b2Controller,
                keyboardType: TextInputType.number, ),
              const Text('Ширина остекления, см'),
              TextField(controller: panesWController,
                keyboardType: TextInputType.number, ),
              const Text('Высота остекления, см'),
              TextField(controller: panesHController,
                keyboardType: TextInputType.number, ),
            ],

          ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          calculateW0();
          calculateCh();
          calculateC();
          calculateFdop();
          calculateWe();
          calculateW();
          calculatek1();
          calculatek2();
          calculateJx();

          print(stJx);
          
          showResult(context);




        },
        child: Text('Расчитать'),
    
      ),





    );
  }

  createListCities() {
    return DropdownButton<String>(
      value: cities,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          cities = newValue!;
          //print(cities);
        });
      },
      items: <String>[
        'Выбрать из списка',
        'Винницкая область',
        'Волынская область',
        'Донецкая область',
        'Житомирская область',
        'Закарпатская область',
        'Запорожская область',
        'Ивано-Франковская область',
        'Киевская область',
        'Кировоградская область',
        'Луганская область',
        'Львовская область',
        'Николаевская область',
        'Одесская область',
        'Полтавская область',
        'Ровенская область',
        'Сумская область',
        'Тернопольская область',
        'Харьковская область',
        'Херсонская область',
        'Хмельницкая область',
        'Черкасская область',
        'Черновицкая область',
        'Черниговская область'
      ]
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );

  }

  createListWindZone() {
    return DropdownButton<String>(
      borderRadius: BorderRadius.circular(20),
      isExpanded: true,
      value: windZone,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple,),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          windZone = newValue!;
          //print(windZone);
        });
      },
      items: <String>[
        'Выбрать из списка',
        '1  - Открытые поверхности морей, озёр, плоские \n равнины без препятствий, подвергающиеся \n действию ветра на участке длиной не менее 3 км',
        '2 - Сельская местность с оградами, небольшими \n сооружениями, домами и деревьями',
        '3 - Пригородные и промышленные зоны, \n протяжённые лесные массивы',
        '4 - Городские территории,  на которых не менее \n 15% поверхности заняты зданиями, \n высотой более 15 метров'
      ]
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value, maxLines: 7,),
          // child: Text(value) ,

        );
      }).toList(),
    );
  }

  createListHighPoint() {
    return DropdownButton<String>(
      value: highPoint,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          highPoint = newValue!;
          //print(highPoint);
        });
      },
      items: <String>[
        'Выбрать из списка',
        'до 10 метров',
        '10 - 15 метров',
        '15 - 20 метров',
        '20 - 30 метров',
        '30 - 40 метров',
        '40 - 50 метров',
        '50 - 60 метров',
        '60 - 70 метров',
        '70 - 80 метров',
        '80 - 90 метров',
        '90 - 100 метров'
      ]
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  createListPanes() {
    return DropdownButton<String>(
      value: panes,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          panes = newValue!;
          //print(highPoint);
        });
      },
      items: <String>[
        'Выбрать из списка',
        'Стекло',
        'Стеклопакет'

      ]
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  calculateJx() {


    stJx = (5 * w / 100 * l * l * l * l) / (384 * modulE * fdop) * k1 * k2;



  }

  void calculateW0() {

    if (cities == 'Винницкая область') w0 = 0.48;
    if (cities == 'Волынская область') w0 = 0.5;
    if (cities == 'Донецкая область') w0 = 0.6;
    if (cities == 'Житомирская область') w0 = 0.48;
    if (cities == 'Закарпатская область') w0 = 0.37;
    if (cities == 'Запорожская область') w0 = 0.52;
    if (cities == 'Ивано-Франковская область') w0 = 0.55;
    if (cities == 'Киевская область') w0 = 0.45;
    if (cities == 'Кировоградская область') w0 = 0.43;
    if (cities == 'Луганская область') w0 = 0.49;
    if (cities == 'Львовская область') w0 = 0.56;
    if (cities == 'Николаевская область') w0 = 0.49;
    if (cities == 'Одесская область') w0 = 0.5;
    if (cities == 'Полтавская область') w0 = 0.47;
    if (cities == 'Ровенская область') w0 = 0.53;
    if (cities == 'Сумская область') w0 = 0.45;
    if (cities == 'Тернопольская область') w0 = 0.52;
    if (cities == 'Харьковская область') w0 = 0.45;
    if (cities == 'Херсонская область') w0 = 0.48;
    if (cities == 'Хмельницкая область') w0 = 0.52;
    if (cities == 'Черкасская область') w0 = 0.44;
    if (cities == 'Черновицкая область') w0 = 0.5;
    if (cities == 'Черниговская область') w0 = 0.41;
    if (cities == 'Выбрать из списка') w0 = 100;
  }

  void calculateCh() {
    if (windZone == 'Выбрать из списка') ch = 100;


    if (windZone == '1  - Открытые поверхности морей, озёр, плоские \n равнины без препятствий, подвергающиеся \n действию ветра на участке длиной не менее 3 км') {
      if (highPoint == 'Выбрать из списка') ch = 100;
      if (highPoint == 'до 10 метров') ch = 2.75;
      if (highPoint == '10 - 15 метров') ch = 3;
      if (highPoint == '15 - 20 метров') ch = 3.25;
      if (highPoint == '20 - 30 метров') ch = 3.5;
      if (highPoint == '30 - 40 метров') ch = 3.75;
      if (highPoint == '40 - 50 метров') ch = 3.8;
      if (highPoint == '50 - 60 метров') ch = 3.9;
      if (highPoint == '60 - 70 метров') ch = 4.1;
      if (highPoint == '70 - 80 метров') ch = 4.2;
      if (highPoint == '80 - 90 метров') ch = 4.25;
      if (highPoint == '90 - 100 метров') ch = 4.3;
    }

    if (windZone == '2 - Сельская местность с оградами, небольшими \n сооружениями, домами и деревьями') {
      if (highPoint == 'Выбрать из списка') ch = 100;
      if (highPoint == 'до 10 метров') ch = 2.3;
      if (highPoint == '10 - 15 метров') ch = 2.6;
      if (highPoint == '15 - 20 метров') ch = 2.8;
      if (highPoint == '20 - 30 метров') ch = 3.1;
      if (highPoint == '30 - 40 метров') ch = 3.3;
      if (highPoint == '40 - 50 метров') ch = 3.4;
      if (highPoint == '50 - 60 метров') ch = 3.6;
      if (highPoint == '60 - 70 метров') ch = 3.75;
      if (highPoint == '70 - 80 метров') ch = 3.8;
      if (highPoint == '80 - 90 метров') ch = 3.9;
      if (highPoint == '90 - 100 метров') ch = 4;
    }

    if (windZone == '3 - Пригородные и промышленные зоны, \n протяжённые лесные массивы') {
      if (highPoint == 'Выбрать из списка') ch = 100;
      if (highPoint == 'до 10 метров') ch = 1.6;
      if (highPoint == '10 - 15 метров') ch = 2;
      if (highPoint == '15 - 20 метров') ch = 2.25;
      if (highPoint == '20 - 30 метров') ch = 2.6;
      if (highPoint == '30 - 40 метров') ch = 2.8;
      if (highPoint == '40 - 50 метров') ch = 3;
      if (highPoint == '50 - 60 метров') ch = 3.1;
      if (highPoint == '60 - 70 метров') ch = 3.3;
      if (highPoint == '70 - 80 метров') ch = 3.6;
      if (highPoint == '80 - 90 метров') ch = 3.75;
      if (highPoint == '90 - 100 метров') ch = 3.8;
    }

    if (windZone == '4 - Городские территории,  на которых не менее \n 15% поверхности заняты зданиями, \n высотой более 15 метров') {
      if (highPoint == 'Выбрать из списка') ch = 100;
      if (highPoint == 'до 10 метров') ch = 1;
      if (highPoint == '10 - 15 метров') ch = 1.5;
      if (highPoint == '15 - 20 метров') ch = 1.75;
      if (highPoint == '20 - 30 метров') ch = 2;
      if (highPoint == '30 - 40 метров') ch = 2.25;
      if (highPoint == '40 - 50 метров') ch = 2.5;
      if (highPoint == '50 - 60 метров') ch = 2.6;
      if (highPoint == '60 - 70 метров') ch = 2.75;
      if (highPoint == '70 - 80 метров') ch = 2.9;
      if (highPoint == '80 - 90 метров') ch = 3;
      if (highPoint == '90 - 100 метров') ch =3.1 ;
    }


  }

  void calculateC() {
    c = caer * ch *calt * cref * cdtr * cd;
  }

  void calculateFdop() {
    l = double.parse(heightController.text);
    if (panes == 'Выбрать из списка') lDel = 1000;
    if (panes == 'Стекло') lDel = 200;
    if (panes == 'Стеклопакет') lDel = 300;
    fdop = l / lDel;
  }

  void calculateWe() {
    we = gre * c * w0;
  }

  void calculateW() {
    b1 = double.parse(b1Controller.text) / 100;
    b2 = double.parse(b2Controller.text) / 100;
    w = we * (b1 + b2) / 2;
  }

  void calculatek1() {

    //k1 = 1;

    panesH = double.parse(panesHController.text);
    panesW = double.parse(panesWController.text);

    if (panesH*10 < 2400 && panesW*10 < 2400) k1 = 1;
    if ((panesH*10 > 2400 && panesH*10 <= 2500) || (panesW*10 > 2400 && panesW*10 <= 2500)) k1 = 1.04;
    if ((panesH*10 > 2500 && panesH*10 <= 2600) || (panesW*10 > 2500 && panesW*10 <= 2600)) k1 = 1.08;
    if ((panesH*10 > 2600 && panesH*10 <= 2700) || (panesW*10 > 2600 && panesW*10 <= 2700)) k1 = 1.12;
    if ((panesH*10 > 2700 && panesH*10 <= 2800) || (panesW*10 > 2700 && panesW*10 <= 2800)) k1 = 1.17;
    if ((panesH*10 > 2800 && panesH*10 <= 2900) || (panesW*10 > 2800 && panesW*10 <= 2900)) k1 = 1.21;
    if ((panesH*10 > 2900 && panesH*10 <= 3000) || (panesW*10 > 2900 && panesW*10 <= 3000)) k1 = 1.25;
    if ((panesH*10 > 3000 && panesH*10 <= 3250) || (panesW*10 > 3000 && panesW*10 <= 3250)) k1 = 1.35;
    if ((panesH*10 > 3250 && panesH*10 <= 3500) || (panesW*10 > 3250 && panesW*10 <= 3500)) k1 = 1.46;
    if ((panesH*10 > 3500 && panesH*10 <= 3750) || (panesW*10 > 3500 && panesW*10 <= 3750)) k1 = 1.56;
    if ((panesH*10 > 3750 && panesH*10 <= 4000) || (panesW*10 > 3750 && panesW*10 <= 4000)) k1 = 1.67;

  }

  void calculatek2() {



    panesH = double.parse(panesHController.text);
    panesW = double.parse(panesWController.text);


    if (panesH >= panesW) pL = panesH / panesW;
    if (panesH < panesW) pL = panesW / panesH;

    if (panesH >= panesW) len = panesH * 10;
    if (panesH < panesW) len = panesW * 10;


    if (len <= 2400) k2 = 1;
    if (len > 2400 && len <= 2500) {
      if (pL <= 1) k2 = 1;
      if (pL > 1) k2 = 1.04;
    }

    if (len > 2500 && len <= 3000 ) {
      if (pL <= 1) k2 = 1;
      if (pL > 1) k2 = 1.24;

    }

    if (len > 3000 && len <= 3500) {
      if (pL <= 1) k2 = 1;
      if (pL > 1) k2 = 1.45;
    }

    if (len > 3500 && len <= 4000) {
      if (pL <= 1) k2 = 1;
      if (pL > 1) k2 = 1.67;

    }

    if (len > 4000 && len <= 4500) {
      if (pL <= 0.75) k2 = 1;
      if (pL > 0.75 && pL <= 1) k2 = 1.05;
      if (pL > 1) k2 = 1.87;

    }

    if (len > 4500 && len <= 5000) {
      if (pL <= 0.75) k2 = 1;
      if (pL > 0.75 && pL <= 1) k2 = 1.17;
      if (pL > 1) k2 = 2.08;

    }

    if (len > 5000 && len <= 5500) {
      if (pL <= 0.66) k2 = 1;
      if (pL > 0.66 && pL <= 0.75) k2 = 1.01;
      if (pL > 0.75 && pL <= 1) k2 = 1.28;
      if (pL > 1) k2 = 2.29;
    }

    if (len > 5500) {
      if (pL <= 0.66) k2 = 1;
      if (pL > 0.66 && pL <= 0.75) k2 = 1.11;
      if (pL > 0.75 && pL <= 1) k2 = 1.4;
      if (pL > 1) k2 = 2.49;
    }




    //k2 = 1;
  }

  Future<void> showResult(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Результат'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Text('Момент инерции стойки'),
                Text(stJx.toString()),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }











}
