// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class AppBody extends StatefulWidget {
  const AppBody({super.key});

  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(child: Icon(Icons.computer_rounded,size: 60,)),
            ListTile(
              leading: Icon(Icons.search_rounded),
              title: Text("B i n a r y  S e a r c h"),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/binary');
              },
            ),
            ListTile(
              leading: Icon(Icons.manage_search_rounded),
              title: Text("L i n e a r  S e a r c h"),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/linear');
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Search Visualizer'),
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Welcome to Algorithm Visualizer!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/binary');
                },
                child: Container(
                  width: 500,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage('assets/binary_search.avif'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Binary Search',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Binary Search is a search algorithm that finds the position of a target value within a sorted array.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,'/linear'
                  );
                },
                child: Container(
                  width: 500,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage('assets/linear_search.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Linear Search',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Linear Search is a simple search algorithm that sequentially checks each element of a list until it finds the target value.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
