import 'dart:math';

import 'package:flutter/material.dart';

class VisualiseBinarySearch extends StatefulWidget {
  const VisualiseBinarySearch({Key? key});

  @override
  State<VisualiseBinarySearch> createState() => _VisualiseBinarySearchState();
}

class _VisualiseBinarySearchState extends State<VisualiseBinarySearch> {
  late int listSize;
  late List<int> numbers;
  late int target;
  late String searchTarget;
  bool ranSearch = false;
  int start = 0;
  late int end;
  int? foundIndex;
  List<int> highlightedIndices = [];

  @override
  void initState() {
    super.initState();
    listSize = 69; // Default list size
    numbers = List.generate(listSize, (index) => index + 1);
    end = listSize - 1;
    target = 0;
    searchTarget="";
  }

  Future<void> binarySearch() async {
    while (start <= end) {
      int mid = (start + end) ~/ 2;
      highlightedIndices = [start, mid, end];
      setState(() {}); // Update UI immediately after setting state

      await Future.delayed(Duration(seconds: 1)); // Wait for 1 second

      if (numbers[mid] == target) {
        setState(() {
          foundIndex = mid;
        });
        return;
      }
      if (numbers[mid] < target) {
        setState(() {
          start = mid + 1;
        });
      } else {
        setState(() {
          end = mid - 1;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Binary Search Visualizer'),
      ),
      body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'This is an application of binary search to find where a book is stored in the library by representing it with index values.',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Text(
                'Enter the size of the list and the book name to search:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          listSize = int.tryParse(value) ?? 100;
                          numbers = List.generate(listSize, (index) => index + 1);
                          end = listSize - 1;
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
                          ranSearch = false;
                          searchTarget=value;
                          target = int.tryParse(Random().nextInt(listSize + 10).toString()) ?? 0;
                          start = 0;
                          end = listSize - 1;
                          foundIndex = null;
                          highlightedIndices = [];
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
                  binarySearch();
                  setState(() {
                    ranSearch=true;
                  });
                },
                child: Text(
                  'Search',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 20),
              if (foundIndex != null)
                Text(
                  ' "$searchTarget" has been found at index $foundIndex!',
                  style: TextStyle(fontSize: 18),
                ),
              if(foundIndex == null && ranSearch)
                Text(
                  "'$searchTarget' has not been found :(",
                  style:  TextStyle(fontSize: 18),
                ),
              SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 6, // Number of items in each row
                      crossAxisSpacing: 5.0, // Spacing between items horizontally
                      mainAxisSpacing: 5.0, // Spacing between rows vertically
                    ),
                    itemCount: numbers.length,
                    itemBuilder: (BuildContext context, int index) {
                      final number = numbers[index];
                      final isHighlighted = highlightedIndices.contains(index);
                      return Container(
                        width: 30,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isHighlighted ? Colors.blue.withOpacity(0.5) : Colors.transparent,
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          '$number',
                          style: TextStyle(fontSize: 16),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
