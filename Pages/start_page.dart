import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fast_money/constants.dart';


class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  List myPockets = [
    'Основной кошелек',
  ];

  @override     //OPTIONS BUTTONS
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Color(0xFF535353),
                      ),
                      margin: EdgeInsets.all(30),
                      width: 300,
                      height: 120,
                      child: Center(
                        child: Column(
                          children: [
                            Text('Текущий баланс\n ${money}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,fontSize: 15,
                                  color: Colors.white,
                                )
                            ),
                          ],
                        ),
                      )
                  ),
                  Container(
                    width: 400,
                    height: 50,
                    child: Scrollbar(
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: myPockets.length,
                            itemBuilder: (context, number) {
                              return InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/spending');
                                },
                                child: Container(
                                  child: Text('${myPockets[number]}'),
                                ),
                              );
                            })
                    ),
                  ),//Кнопки кошельков


                  Container(
                    width: 400,
                    height: 200,
                    child: Scrollbar(
                      child: ListView.builder(
                          itemCount: int_history.length,
                          itemBuilder: (context, index) {
                            return Card(child: Column(
                              children: [
                                icon[index],
                                Text('${int_history[index]}'),
                                Text('${spentOperationTime[index]}'),
                                Text('${indexesOfTransactions[index]}'),
                              ],
                            )
                            );
                          }), //карточки с историей
                    ),
                  ),

                  Container(
                    height: 500,
                    child: PieChart(
                        PieChartData(
                          sections: chartSections,
                        )
                    ),
                  ),
                ],
              ),
      ),
          );
        }
  }




class Category {
  Category(this.name, this.amount);

  final String name;
  final double amount;
}
