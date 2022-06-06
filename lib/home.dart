import 'package:flutter/material.dart';
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: const Text('Расчёт статических и ветровых нагрузок'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: SizedBox(
                width: 300,
                height: 150,
                child: ElevatedButton(
                    onPressed: () {
                  Navigator.pushNamed(context, '/stoyka');
                },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue[300]
                    ),
                    child: const Text('Ветровая нагрузка на стойку', style: TextStyle(fontSize: 20), textAlign: TextAlign.center,)),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: SizedBox(
                width: 300,
                height: 150,
                child: ElevatedButton(onPressed: () {
                  Navigator.pushNamed(context, '/rigel');
                },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue[300]
                    ),
                    child: const Text('Статическая нагрузка на ригель', style: TextStyle(fontSize: 20),textAlign: TextAlign.center,)),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: SizedBox(
                width: 300,
                height: 150,
                child: ElevatedButton(onPressed: () {
                  Navigator.pushNamed(context, '/info');
                },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue[300]
                    ),
                    child: const Text('Инфо', style: TextStyle(fontSize: 20),textAlign: TextAlign.center,)),
              ),
            ),
          ],
        ),
      ),

    );
  }


}
