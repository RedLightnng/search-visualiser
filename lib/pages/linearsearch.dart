import 'dart:math';

import 'package:flutter/material.dart';

class VisualiseLinearSearch extends StatefulWidget {
  const VisualiseLinearSearch({Key? key});

  @override
  State<VisualiseLinearSearch> createState() => _VisualiseLinearSearchState();
}

class _VisualiseLinearSearchState extends State<VisualiseLinearSearch> {
  late int listSize;
  late List<int> numbers;
  late int target;
  late String searchTarget;
  int currentIndex = -1;
  bool targetFound = false;

  @override
  void initState() {
    super.initState();
    listSize = 20; // Default list size
    generateNumbers();
    target = 0;
    searchTarget="";
  }

  void generateNumbers() {
    numbers = List.generate(listSize, (index) => index + 1);
  }

  Future<void> linearSearch() async {
    setState(() {
      currentIndex = 0;
      targetFound = false; // Reset targetFound flag
    });

    // Perform linear search
    while (currentIndex < numbers.length) {
      if (numbers[currentIndex] == target) {
        // Target found
        setState(() {
          targetFound = true; // Set targetFound flag to true when target is found
        });
        return;
      }
      setState(() {
        currentIndex++;
      });
      await Future.delayed(Duration(milliseconds: 200));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Linear Search Visualizer'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'This is an application of linear search to find where a book is stored in the library by representing it with index values.',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Text(
                'Enter the size of the list and the book name to search:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          listSize = int.tryParse(value) ?? 10;
                          generateNumbers();
                          currentIndex = -1; // Reset currentIndex when list size changes
                          targetFound = false; // Reset targetFound flag
                        });
                      },
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                        labelText: 'List Size',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.name,
                      onChanged: (value) {
                        setState(() {
                          searchTarget = value;
                          target = int.tryParse(Random().nextInt(listSize + 10).toString()) ?? 0;
                          currentIndex = -1; // Reset currentIndex when search target changes
                          targetFound = false; // Reset targetFound flag
                        });
                      },
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                        labelText: 'Search Target',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  linearSearch();
                },
                child: Text(
                  'Search',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: numbers.map((number) {
                    return Container(
                      width: 30,
                      height: 30,
                      margin: EdgeInsets.all(5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        color: targetFound && number == target
                            ? Colors.green.withOpacity(0.5) // Highlight the target after it's found
                            : currentIndex >= 0 && currentIndex == number - 1
                            ? Colors.red.withOpacity(0.5) // Highlight the current index being checked
                            : Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        '$number',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 20),
              if(targetFound)
                Text(
                  "'$searchTarget' found at index $currentIndex",
                  style: TextStyle(fontSize: 18),
                ),
              if(!targetFound)
                Center(
                  child: Text(
                    "'$searchTarget' not found yet :(",
                    style: TextStyle(fontSize: 18,),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
