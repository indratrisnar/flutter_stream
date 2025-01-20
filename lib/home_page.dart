import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int number = 1;
  final numberController = StreamController<int>();

  void _add() {
    number += 1;
    // setState(() {});
    numberController.add(number);
  }

  @override
  void dispose() {
    numberController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<int>(
              initialData: 1,
              stream: numberController.stream,
              builder: (context, snapshot) {
                log('StreamBuilder');
                return Text(
                  '${snapshot.data!}',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 30,
                    color: Colors.black54,
                  ),
                );
              },
            ),
            Gap(20),
            FilledButton(
              onPressed: _add,
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
