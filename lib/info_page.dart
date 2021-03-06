import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: const Text('Справочная информация'),
      ),
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: Colors.grey[300],
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('СТОЙКИ', style: TextStyle(fontSize: 30), textAlign: TextAlign.center,),
                        ),
                        Text('Стойка бескамерная - 1,1', style: TextStyle(fontSize: 18),),
                        Text('Стойка 60 мм - 32,81', style: TextStyle(fontSize: 18),),
                        Text('Стойка 80 мм - 61,7', style: TextStyle(fontSize: 18),),
                        Text('Стойка 95 мм - 90,92', style: TextStyle(fontSize: 18),),
                        Text('Стойка 110 мм - 127,29', style: TextStyle(fontSize: 18),),
                        Text('Стойка 130 мм - 194,44', style: TextStyle(fontSize: 18),),
                        Text('Стойка 150 мм - 273,07', style: TextStyle(fontSize: 18),),
                        Text('Стойка 170 мм - 395,30', style: TextStyle(fontSize: 18),),
                        Text('Стойка 190 мм - 570,06', style: TextStyle(fontSize: 18),),
                        Text('Стойка 210 мм - 823,32', style: TextStyle(fontSize: 18),),
                        Text('Стойка 230 мм - 1009,36', style: TextStyle(fontSize: 18),),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: Colors.grey[300],
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('РИГЕЛЯ', style: TextStyle(fontSize: 30), textAlign: TextAlign.center,),
                        ),
                        Text('Ригель бескамерный - 3,36', style: TextStyle(fontSize: 18),),
                        Text('Ригель 25 мм - 9,17', style: TextStyle(fontSize: 18),),
                        Text('Ригель 50 мм - 13,86', style: TextStyle(fontSize: 18),),
                        Text('Ригель 67 мм - 17,54', style: TextStyle(fontSize: 18),),
                        Text('Ригель 87 мм - 21,29', style: TextStyle(fontSize: 18),),
                        Text('Ригель 102 мм - 24,1', style: TextStyle(fontSize: 18),),
                        Text('Ригель 117 мм - 26,91', style: TextStyle(fontSize: 18),),
                        Text('Ригель 137 мм - 30,66', style: TextStyle(fontSize: 18),),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

      ),
    );
  }
}
