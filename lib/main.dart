import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarea3/bloc/book_bloc.dart';
import 'package:tarea3/home_page.dart';

void main() => runApp(MultiBlocProvider(providers: [
  BlocProvider(create: (context) => BookBloc()),
], child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomePage(),
    );
  }
}

