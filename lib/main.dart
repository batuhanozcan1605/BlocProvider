import 'package:bloc_lecture/BlocListing/KisilerDaoRepository.dart';
import 'package:bloc_lecture/BlocListing/bloclisting.dart';
import 'package:bloc_lecture/CounterCubit.dart';
import 'package:bloc_lecture/KisilerCubit.dart';
import 'package:bloc_lecture/secondpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => KisilerCubit(KisilerDaoRepository())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocListing(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "0",
            style: TextStyle(fontSize: 36),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SecondPage()));
              },
              child: Text("NEXT")),
        ]),
      ),
    );
  }
}
