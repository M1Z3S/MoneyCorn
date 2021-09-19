import 'package:fast_money/Pages/start_page.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//1) Текущая сумма в кошельке
int money = 0;

//2) История трат и приобритений
List int_history = [];
var indexNow;


//Эран с операцией (Убрать/Добавить)

//Выбор Заработок или трата
List<bool> choosingOptionES = [false, false];

//2)
bool isButtonClickable = false;

//3) Категории трат
List categorySpend = [
  'Продукты',
  'Здоровье',
  'Одежда',
  'Развлечения'
];
List<bool> categorySpendBool = [false,false,false,false];

//4) Категории заработка
List categoryEarn = [
  'Зарплата',
  'Фриланс'
];
List<bool> categoryEarnBool = [false,false];

//5) Список индексов для категории транзакций
List indexesOfTransactions = [];

//6) Дата и время траты
List<DateTime> spentOperationTime = [];


//7) Дата и время прибыли
List<DateTime> earnOperationTime = [];

// 8) Переменные для отобродения выбранных кнопок
bool earningsVisibility = false;
bool spendingVisibility = false;

List<Icon> icon = [];

//Данные для диаграммы
final chartSections = [
  PieChartSectionData(
    color: Colors.yellow,
    value: 15,
  ),
  PieChartSectionData(
    color: Colors.greenAccent,
    value: 12,
  ),
  PieChartSectionData(
    color: Colors.green,
    value: 15,
  ),
  PieChartSectionData(
    color: Colors.blue,
    value: 15,
  ),

];

