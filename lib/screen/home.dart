import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home1',style: TextStyle(color: Colors.red),),),
      body: ListView(
        children:[ Container(
        width: 100,
          height: 100,
          color: Colors.amber,
        ),
      ]
      ),
    );
  }
}
class HomePage2 extends StatelessWidget {
  const HomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home2',style: TextStyle(color: Colors.red),),),
    );
  }
}

class HomePage3 extends StatelessWidget {
  const HomePage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home3',style: TextStyle(color: Colors.red),),),
    );
  }
}

class HomePage4 extends StatelessWidget {
  const HomePage4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home4',style: TextStyle(color: Colors.red),),),
    );
  }
}

