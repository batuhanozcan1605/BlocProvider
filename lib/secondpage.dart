import 'package:bloc_lecture/CounterCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<CounterCubit,int>(
                builder: (context,counterValue){
                  return Text("$counterValue",style: TextStyle(fontSize: 36),);
                },
              ),
              ElevatedButton(
                  onPressed: (){
                    context.read<CounterCubit>().increaseCounter();
                  },
                  child: Text("Increase Counter")),
              ElevatedButton(
                  onPressed: (){
                    context.read<CounterCubit>().decreaseCounter(2);
                  },
                  child: Text("Decrease Counter")),
            ]
        ),
      ),
    );
  }
}
