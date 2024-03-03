import 'package:flutter/material.dart';

class VisualiseBinarySearch extends StatefulWidget {
  const VisualiseBinarySearch({super.key});

  @override
  State<VisualiseBinarySearch> createState() => _VisualiseBinarySearchState();
}

class _VisualiseBinarySearchState extends State<VisualiseBinarySearch> {
  late int listSize;
  late List<int> numbers;
  late int target;
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
  }

  Future<void> binarySearch() async {
    while (start <= end) {
      int mid = (start + end) ~/ 2;
      highlightedIndices = [start, mid, end];
      setState(() {}); // Update UI immediately after setting state

      await Future.delayed(Duration(seconds: 1)); // Wait for 1 seconds

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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter the size of the list and the number to search:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
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
                  Flexible(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          target = int.tryParse(value) ?? 0;
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
                },
                child: Text(
                  'Search',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 20),
              if (foundIndex != null)
                Text(
                  'Number $target found at index $foundIndex!',
                  style: TextStyle(fontSize: 18),
                ),

              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: numbers
                        .asMap()
                        .entries
                        .map(
                          (entry) => Container(
                        width: 30,
                        height: 30,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: highlightedIndices.contains(entry.key)
                              ? Colors.blue.withOpacity(0.5)
                              : Colors.transparent,
                          border: Border.all(
                            color: Colors.blue,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          '${entry.value}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    )
                        .toList(),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
