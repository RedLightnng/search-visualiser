
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:search_visualiser/pages/appbody.dart';
import 'package:search_visualiser/pages/binarysearch.dart';
import 'package:search_visualiser/pages/linearsearch.dart';

void main() {
  runApp(SearchVisualizer());
}

class SearchVisualizer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Search Visualiser',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: AppBody(),
      routes: {
        '/binary' : (context) => VisualiseBinarySearch(),
        '/linear' : (context) => VisualiseLinearSearch(),
      },
    );
  }
}
