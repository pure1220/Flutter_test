/*
 * @Description: main.dark应用入口文件
 * @Version: 1.0
 * @Author: hjc<09497,13229482412>
 * @Date: 2024-02-22 09:35:04
 * @LastEditors: hjc<09497,13229482412>
 * @LastEditTime: 2024-02-29 11:57:42
 * @FilePath: \test_drive\flutter_application_1\lib\main01.dart
 */

// 导入Material Ui组件库
import 'package:flutter/material.dart';

// 相对路径导入
// import '../test/widget_test.dart';

// 支持使用别名进行空间命名
// import 'package:http/http.dart' as http;

// 应用入口函数 负责创建和运行应用 runApp()函数调用
// 创建MyApp常量对象 作为参数传递
// void 表示函数没有返回值
void main() {
  runApp(const MyApp());
}

// StatelessWidget无状态的小部件 静态
// StatefulWidget有状态的小部件 动态
// super关键字是用来调用父类的成员 super
class MyApp extends StatelessWidget {
  const MyApp({super.key});

// @override是Dart语言注解，用来提供元数据，提供类、方法、变量
// 在面向对象编程，子类可以重写父类的方法以提供自己的实现方式，当使用注解时，他可以确保我正在重写父类的方法，而不是意外创建
  @override

  // Widget是Flutter应用中构建UI基本构建块
  // build方法 是用来构建界面的
  // BuildContent 参数  context 命名
  Widget build(BuildContext context) {
    // 返回描述信息 materialApp是基于mUi风格的，提供配置项
    return MaterialApp(
      // 标题
      title: 'Flutter Demo',
      // 主题
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // 首页
      // home: const MyDetailPage(title: 'Flutter Demo Home Page ITry'),
    );
  }
}

// 动态的 在生命周期中持有状态，并根据状态更新UI
class MyDetailPage extends StatefulWidget {
  // 常量 意味在编译时 就能确定值
  // required 必须 this.title是必须的 如果缺失 会报错
  const MyDetailPage({super.key, required this.title});

  //final 不可变的，将在类实例化的过程中被赋值，且生命周期中保持不变
  final String title;

  @override
  // 创建相关联的状态对象
  State<MyDetailPage> createState() => _MyDetailPageState();
  // State<MyDetailPage> createState() => _MyDetailPageState();
}

// 关联的状态对象
// 类名前的私有类 用下划线表示 不能在其他文件访问
class _MyDetailPageState extends State<MyDetailPage> {
  // 私有类
  int _counter = 0;

  String _myname = 'I Try it';

// 增加数量
  void _incrementCounter() {
    setState(() {
      // 状态改变
      _counter++;
      _myname = 'i can do it';
    });
  }

// 减少数量
  void _decrementCounter() {
    setState(() {
      _counter--;
      _myname = 'i can not do it';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title)),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              const Text('You have pushed the button this many times'),
              Text('$_counter',
                  style: Theme.of(context).textTheme.headlineMedium),
              Text('$_myname', style: Theme.of(context).textTheme.labelMedium)
            ])),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'incrementCount',
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 16),
            FloatingActionButton(
                onPressed: _decrementCounter,
                tooltip: 'decrementCount',
                child: const Icon(Icons.remove))
          ],
        ));
  }
}
