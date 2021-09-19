import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fast_money/constants.dart';

class SpentScreen extends StatefulWidget {
  const SpentScreen({Key? key}) : super(key: key);

  @override
  _SpentScreenState createState() => _SpentScreenState();
}

class _SpentScreenState extends State<SpentScreen> {

  int value = 0; // Переменная, равная введенному значению
  var status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: SafeArea(
        child: Column(
          children:[

//текстовое поле для ввода суммы
            Container(
              width: 500,
                height: 50,
                child: new TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
                  onChanged: (addedMoney) {
                    value = int.parse(addedMoney);
                    print(value);
                  },
                ),
            ),

//Выбор плюс или минус бабки
            ToggleButtons(children: [Icon(Icons.attach_money_outlined), Icon(Icons.money_off_outlined)],
                isSelected: choosingOptionES,
                onPressed: (int newIndex) {
                  setState(() {
                    for (int index = 0; index < choosingOptionES.length; index++) {
                      if (index == newIndex) {
                        choosingOptionES[index] = true;
                        spendingVisibility = true;
                        earningsVisibility = false;
                      } else {
                        choosingOptionES[index] = false;
                        spendingVisibility = false;
                        earningsVisibility = true;
                      }
                    }

                    print(choosingOptionES);
                  });
                },
            ),

//Категория Заработков
            Visibility(
              visible: earningsVisibility,
              child: Container(
                height: 50,
                width: 500,
                child: Scrollbar(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return ToggleButtons(
                          children:[
                            Text('Зарплата'),
                            Text('Фриланс'),
                          ],
                          isSelected: categoryEarnBool,
                          onPressed: (int newIndexInSpend) {
                            setState(() {

                              status = true;

                              for (int index = 0; index < categoryEarnBool.length; index++) {
                                if (index == newIndexInSpend) {
                                  categoryEarnBool[index] = true;
                                } else {
                                  categoryEarnBool[index] = false;
                                }
                              }

                              if (categoryEarnBool[0] == true) {
                                indexesOfTransactions.add('Зарплата');
                              } else if (categoryEarnBool[1] == true) {
                                indexesOfTransactions.add('Фриланс');
                              }

                              print(categoryEarnBool);
                            });
                          },
                        );
                      }),
                ),
              ),
            ),

            //Категория Трат
            Visibility(
              visible: spendingVisibility,
              child: Container(
                height: 50,
                width: 500,
                child: Scrollbar(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return ToggleButtons(
                            children:[
                              Text('Продукты'),
                              Text('Здоровье'),
                              Text('Одежда'),
                              Text('Развлечения'),
                            ],
                          isSelected: categorySpendBool,
                          onPressed: (int newIndex) {
                            setState(() {

                              status = true;

                              for (int index = 0; index < categorySpendBool.length; index++) {
                                if (index == newIndex) {
                                  categorySpendBool[index] = true;
                                  indexNow = index;
                                } else {
                                  categorySpendBool[index] = false;
                                }
                              }
                              print(categorySpendBool);
                            });

                            if (categorySpendBool[0] == true) {
                              indexesOfTransactions.add('Продукты');
                            } else if (categorySpendBool[1] == true) {
                              indexesOfTransactions.add('Здоровье');
                            } else if (categorySpendBool[2] == true) {
                              indexesOfTransactions.add('Одежда');
                            } else if (categorySpendBool[3] == true) {
                              indexesOfTransactions.add('Развлечения');
                            }

                          },
                        );
                      }),
                ),
              ),
            ),

            //Кнопка "Добавить"
            TextButton(
                child: Text('Добавить'),

                onPressed: status?(){
                  if (choosingOptionES[0]==true) {
                    money += value;
                    spentOperationTime.add(DateTime.now());
                  } else {
                    money -= value;
                    spentOperationTime.add(DateTime.now());
                  }

                  //Добавление иконок в список
                  iconWithPleasure();

                  //Прибавка к истории
                  print('datetime = $spentOperationTime');
                  int_history.add(value);

                  //Выход к начальному экрану
                  Navigator.pushNamed(context, '/');

                  //Восстановление переменных
                  spendingVisibility = false;
                  earningsVisibility = false;
                  reloadingData(categoryEarnBool);
                  reloadingData(categorySpendBool);
                  reloadingData(choosingOptionES);
                }: null,
            ),
          ],
        ),
      ),
    );
  }
}


void reloadingData (List list) {
  for (var i=0; i <list.length; i++) {
    list[i] = false;
  }
}

void iconWithPleasure () {
  switch (indexesOfTransactions[indexesOfTransactions.length-1]) {
    case 'Зарплата': icon.add(Icon(Icons.date_range_outlined));
    break;
    case 'Фриланс': icon.add(Icon(Icons.face));
    break;
    case 'Продукты': icon.add(Icon(Icons.no_meals_outlined));
    break;
    case 'Здоровье': icon.add(Icon(Icons.add));
    break;
    case 'Одежда': icon.add(Icon(Icons.add));
    break;
    case 'Развлечения': icon.add(Icon(Icons.add));
    break;
  }
}