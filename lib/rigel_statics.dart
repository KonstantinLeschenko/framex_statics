import 'package:flutter/material.dart';

class RigelStatics extends StatefulWidget {
  const RigelStatics({Key? key}) : super(key: key);

  @override
  _RigelStaticsState createState() => _RigelStaticsState();
}

class _RigelStaticsState extends State<RigelStatics> {

  final rigLController = TextEditingController();
  final rigHController = TextEditingController();
  final glassController = TextEditingController();

  double g = 0.0025;
  double kH = 0.0098;
  double modulE = 7000;
  double fdop = 0.3;

  late double a, rigL, rigH, glassWeight, f;
  late double rigJx1;

  @override
  void dispose() {
    rigLController.dispose();
    rigHController.dispose();
    glassController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: const Text('Статическая нагрузка на ригель'),
      ),
      body: ListView(
        children: [
          const Text('Расстояние между осями стоек (по ширине), см'),
          TextField(controller: rigLController,
            keyboardType: TextInputType.number,),
          const Text('Расстояние между осями ригелей (по высоте), см'),
          TextField(controller: rigHController,
            keyboardType: TextInputType.number,),
          const Text('Суммарная толщина стёкол, см'),
          TextField(controller: glassController,
            keyboardType: TextInputType.number,),
          //const Text('Момент инерции ригеля без учёта соббственного веса (Jx1)'),
          //Text(rigJx1.toString())


        ],

      ),

      floatingActionButton: FloatingActionButton(onPressed: () {
        rigL = double.parse(rigLController.text);
        rigH = double.parse(rigHController.text);
        f = double.parse(glassController.text);
        a = rigL / 10;
        glassWeight = (rigL * rigH * g * f) / 2 * kH;

        rigJx1 = (glassWeight * a * (3 * rigL * rigL - 4 * a * a)) / (24 * modulE * fdop);

        print(rigJx1);

        showRigJx1(context);



      },

      ),

    );

  }

  Future<void> showRigJx1(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Результат'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Text('Момент инерции ригеля без учёта собственного веса'),
                Text(rigJx1.toString()),
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
