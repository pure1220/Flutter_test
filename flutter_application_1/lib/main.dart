/*
 * @Description: main.dark应用入口文件
 * @Version: 1.0
 * @Author: hjc<09497,13229482412>
 * @Date: 2024-02-22 09:35:04
 * @LastEditors: hjc<09497,13229482412>
 * @LastEditTime: 2024-02-29 14:57:15
 * @FilePath: \test_drive\flutter_application_1\lib\main.dart
 */

// 导入Material Ui组件库

import 'package:flutter/material.dart';
import './main01.dart';

// 应用入口函数 负责创建和运行应用 runApp()函数调用
// 创建MyApp常量对象 作为参数传递
void main() {
  runApp(const MyApp());
}

// super关键字是用来调用父类的成员 super
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
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
      routes: {
        '/': (context) => const MyHomePage(),
        '/home': (context) => const MyHomePage(),
        '/detail': (context) =>
            const MyDetailPage(title: 'Flutter Demo Home Page ITry')
      },
      initialRoute: '/',
    );
  }
}

class MyHomePage extends StatefulWidget {
  // 常量 意味在编译时 就能确定值
  // required 必须 this.title是必须的 如果缺失 会报错
  const MyHomePage({super.key});

  @override
  // 创建相关联的状态对象
  State<MyHomePage> createState() => _MyHomePageState();
  // State<MyHomePage> createState() => _MyHomePageState();
}

// 顶部搜索栏
class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: Row(
          children: <Widget>[
            //Expanded
            Expanded(
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.search, color: Colors.white),
                        SizedBox(width: 8.0),
                        Text('搜索一下111',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                decoration: TextDecoration.none))
                      ],
                    ))),
            const SizedBox(width: 16.0),
            const Icon(Icons.auto_awesome_mosaic_outlined)
          ],
        ));
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      color: Colors.white,
      child: const Column(
        children: [
          SearchBarWidget(),
          ContentWidget(),
          BottomNavigationBarWidget()
        ],
      ),
    ));
  }
}

// 中间面板内容
class ContentWidget extends StatefulWidget {
  const ContentWidget({super.key});

  @override
  State<ContentWidget> createState() => _ContentWidgetState();
}

class _ContentWidgetState extends State<ContentWidget>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  List<String> tabStrList = [
    '关注',
    '推荐',
    '热榜',
    '头条',
    '后端',
    '前端',
    'Android',
    'iOS',
    '人工智能',
    '开发工具'
  ];

  @override
  // 初始化状态
  void initState() {
    super.initState();
    _controller = TabController(length: tabStrList.length, vsync: this);
  }

  @override
  // 销毁
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold填满剩余空间
    return Expanded(
        child: Scaffold(
            body: Column(children: <Widget>[
      TabBar(
        tabs: tabStrList.map((e) => Tab(text: e)).toList(),
        isScrollable: true, //设置可滚动
        controller: _controller,
      ),
      // 高度填满剩余空间
      // Expanded(
      //     child: TabBarView(controller: _controller, children: [
      //   tabStrList.map((e) => ContentListWidget(name: '$e title')).toList(),
      // ]))
    ])));
  }
}

// 中间列表Widget
class ContentListWidget extends StatefulWidget {
  const ContentListWidget({super.key, required this.name});
  final String name;

  @override
  State<ContentListWidget> createState() => _ContentListWidgetState();
}

class _ContentListWidgetState extends State<ContentListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
              child: Column(children: [
                Row(children: [
                  Text(widget.name,
                      style: const TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold)),
                ]),
                const Row(children: [
                  Icon(Icons.person, size: 20),
                  SizedBox(width: 5),
                  Text('pure_big')
                ]),
                const SizedBox(height: 6),
                const Row(
                  children: [
                    Expanded(
                        child: Text(
                      '前端工程化这个词，是国内前端圈子2018年前后才出现的，大概的意思是将（后端已经比较成熟的）许多软件工程概念、实践、工具引入前端开发，提升开发效率。',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ))
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(
                      Icons.thumb_up,
                      size: 16,
                    ),
                    const SizedBox(width: 5),
                    const Text('999+'),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.keyboard_voice,
                      size: 16,
                    ),
                    const Text('999+'),
                    // 空间组件 利用剩余空间进行占位
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: const Text(
                        'Flutter',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.more_horiz,
                      size: 16,
                    )
                  ],
                )
              ]));
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: 1.0,
            color: Colors.grey,
          );
        },
        itemCount: 20);
  }
}

// 底部导航栏
class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int _selectedIndex = 0;

  final Map<int, String> _routes = {
    0: '/',
    1: '/detail',
    2: '/home',
  };

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.deepPurple,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: '搜索'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: '我的'),
      ],
      onTap: (position) {
        Navigator.pushNamed(context, _routes[position]!);
        setState(() {
          _selectedIndex = position;
        });
      },
    );
  }
}
