// main 是Dart的入口函数

import 'dart:io';

main(List<String> args) {
  print('HELLO World');
  String name = 'wwwwww';
  int age = 19;
  double height = 1.88;
  print('${name}, ${age}, ${height}');

  // final 可以函数的计算结果赋值
  // 一旦被赋值，
  final time = DateTime.now();
  print(time);
  // Duration 时间段
  // 创建一个一秒的时间段，然后sleep
  sleep(Duration(seconds: 1));
  print(time);

  // ①字符串转数字
  var one = int.parse('111');
  print('$one ${one.runtimeType}');

  // ②数字转字符串
  var two = 111.toString();
  print('$two ${two.runtimeType}');

  // DART内置集合类型 SET/LIST/MAP
  List<int> numbers = [1, 2, 3, 4, 5];
  print('$numbers');

  // SET无序 数据不重复
  Set<int> numberSet = {1, 2, 3, 4, 5};
  print('$numberSet');

  // MAP 字典类型 key:value
  Map<String, Object> numberMap = {'one': '111', 'two': 2};
  print('$numberMap');

  // 集合类型长度
  print(numbers.length);
  print(numberSet.length);
  print(numberMap.length);

  // 添加、删除操作
  numbers.add(6);
  numberSet.add(6);
  numberMap['three'] = 3;
  print('$numbers $numberSet $numberMap');

  numbers.remove(6);
  numberSet.remove(6);
  print('$numbers $numberSet');

  // Map独有操作 key value

  // 根据key获取value
  print(numberMap['one']);

  // 获取entries
  print(numberMap.entries);

  // 获取所有 value 所有key
  print(numberMap.values);
  print(numberMap.keys);

  // 判断是否包含某个key or value
  print(numberMap.containsKey('age'));
}
