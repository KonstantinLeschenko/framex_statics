import 'package:flutter/material.dart';
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: const Text('Расчёт статических и ветровых нагрузок'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: [
            SizedBox(
              width: 300,
              height: 150,
              child: ElevatedButton(onPressed: () {
                Navigator.pushNamed(context, '/stoyka');
              }, child: const Text('Ветровая нагрузка на стойку', style: TextStyle(fontSize: 20),)),
            ),
            SizedBox(
              width: 300,
              height: 150,
              child: ElevatedButton(onPressed: () {
                Navigator.pushNamed(context, '/rigel');
              }, child: const Text('Статическая нагрузка на ригель', style: TextStyle(fontSize: 20),)),
            ),
            SizedBox(
              width: 300,
              height: 150,
              child: ElevatedButton(onPressed: () {
                Navigator.pushNamed(context, '/info');
              }, child: const Text('Инфо', style: TextStyle(fontSize: 20),)),
            ),
          ],
        ),
      ),

    );
  }


}
