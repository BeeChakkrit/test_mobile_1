import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> numbers = List.filled(41, 0);

  List<ListIndex> listicon1 = [];
  List<ListIndex> listicon2 = [];
  List<ListIndex> listicon3 = [];

  int? indexselect;
  int? indexselect2;

  @override
  void initState() {
    super.initState();
    addData();
    _scrollController = ScrollController();

    numbers = List.filled(41, 0);
    numbers[0] = 0;
    numbers[1] = 1;

    for (int i = 2; i < 41; i++) {
      numbers[i] = numbers[i - 1] + numbers[i - 2];
    }

    for (int i = 0; i < item.length; i++) {
      if (i < numbers.length) {
        item[i].sumNumbers = numbers[i];
      }
    }
  }

  int? selectedValue;
  ScrollController _scrollController = ScrollController();

  void addData() {
    item2 = List.of(item);
  }

  List<ListIndex> item2 = [];

  List<ListIndex> item = [
    ListIndex(icon: Icons.clear, type: 0, index: 0),
    ListIndex(icon: Icons.clear, type: 0, index: 1),
    ListIndex(icon: Icons.crop_square, type: 1, index: 2),
    ListIndex(icon: Icons.clear, type: 0, index: 3),
    ListIndex(icon: Icons.fiber_manual_record, type: 2, index: 4),
    ListIndex(icon: Icons.fiber_manual_record, type: 2, index: 5),
    ListIndex(icon: Icons.clear, type: 0, index: 6),
    ListIndex(icon: Icons.crop_square, type: 1, index: 7),
    ListIndex(icon: Icons.clear, type: 0, index: 8),
    ListIndex(icon: Icons.clear, type: 0, index: 9),
    ListIndex(icon: Icons.crop_square, type: 1, index: 10),
    ListIndex(icon: Icons.clear, type: 0, index: 11),
    ListIndex(icon: Icons.fiber_manual_record, type: 2, index: 12),
    ListIndex(icon: Icons.fiber_manual_record, type: 2, index: 13),
    ListIndex(icon: Icons.clear, type: 0, index: 14),
    ListIndex(icon: Icons.crop_square, type: 1, index: 15),
    ListIndex(icon: Icons.clear, type: 0, index: 16),
    ListIndex(icon: Icons.clear, type: 0, index: 17),
    ListIndex(icon: Icons.crop_square, type: 1, index: 18),
    ListIndex(icon: Icons.clear, type: 0, index: 19),
    ListIndex(icon: Icons.fiber_manual_record, type: 2, index: 20),
    ListIndex(icon: Icons.fiber_manual_record, type: 2, index: 21),
    ListIndex(icon: Icons.crop_square, type: 1, index: 22),
    ListIndex(icon: Icons.clear, type: 0, index: 23),
    ListIndex(icon: Icons.clear, type: 0, index: 24),
    ListIndex(icon: Icons.crop_square, type: 1, index: 25),
    ListIndex(icon: Icons.clear, type: 0, index: 26),
    ListIndex(icon: Icons.fiber_manual_record, type: 2, index: 27),
    ListIndex(icon: Icons.clear, type: 0, index: 28),
    ListIndex(icon: Icons.crop_square, type: 1, index: 29),
    ListIndex(icon: Icons.clear, type: 0, index: 30),
    ListIndex(icon: Icons.clear, type: 0, index: 31),
    ListIndex(icon: Icons.crop_square, type: 1, index: 32),
    ListIndex(icon: Icons.clear, type: 0, index: 33),
    ListIndex(icon: Icons.fiber_manual_record, type: 2, index: 34),
    ListIndex(icon: Icons.fiber_manual_record, type: 2, index: 35),
    ListIndex(icon: Icons.clear, type: 0, index: 36),
    ListIndex(icon: Icons.crop_square, type: 1, index: 37),
    ListIndex(icon: Icons.clear, type: 0, index: 38),
    ListIndex(icon: Icons.fiber_manual_record, type: 2, index: 39),
  ];

  void updateItemList() {
    setState(() {
      item.clear();
      item.addAll(List.of(item2));
    });
  }

  void _scrollDown(int index) {
    double itemHeight = 10.0;
    double targetOffset = index * 0.5;

    index > 19
        ? _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(seconds: 2),
          curve: Curves.linear,
        )
        : _scrollController.animateTo(targetOffset, duration: Duration(seconds: 2), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          color: Colors.white,
          child: ListView.builder(
            controller: _scrollController,
            itemCount: item.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    indexselect = index;
                  });
                  print(indexselect);
                },
                child: Container(
                  color: selectedValue == item[index].index ? Colors.red : Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 40,
                  child: Row(
                    children: [
                      Text('index : ${item[index].index}'),
                      SizedBox(width: 10),
                      Text('Number: ${item[index].sumNumbers}'),
                      Expanded(child: Container()),
                      IconButton(
                        onPressed: () async {
                          ListIndex selectedItem = item[index];

                          indexselect = selectedItem.index;

                          if (selectedItem.type == 0) {
                            listicon1.add(
                              ListIndex(
                                type: selectedItem.type,
                                index: selectedItem.index,
                                icon: selectedItem.icon,
                                sumNumbers: selectedItem.sumNumbers,
                              ),
                            );
                          } else if (selectedItem.type == 1) {
                            listicon2.add(
                              ListIndex(
                                type: selectedItem.type,
                                index: selectedItem.index,
                                icon: selectedItem.icon,
                                sumNumbers: selectedItem.sumNumbers,
                              ),
                            );
                          } else {
                            listicon3.add(
                              ListIndex(
                                type: selectedItem.type,
                                index: selectedItem.index,
                                icon: selectedItem.icon,
                                sumNumbers: selectedItem.sumNumbers,
                              ),
                            );
                          }

                          indexselect = null;

                          List<ListIndex> selectedList =
                              item[index].type == 0
                                  ? listicon1
                                  : item[index].type == 1
                                  ? listicon2
                                  : listicon3;

                          final result = await showModalBottomSheet<int>(
                            backgroundColor: Colors.black45,
                            enableDrag: true,
                            context: context,
                            builder: (context) {
                              return ListClass(selectedList: selectedList, colorvselected: selectedItem.index);
                            },
                          );
                          item.removeAt(index);

                          if (result != null) {
                            updateItemList();
                            setState(() {
                              selectedValue = result;
                            });

                            // WidgetsBinding.instance.addPostFrameCallback((_) {
                            //   double itemHeight = 60.0;
                            //   double _position = index * itemHeight;

                            //   _scrollController.animateTo(
                            //     _position,
                            //     duration: Duration(milliseconds: 300),
                            //     curve: Curves.easeInOut,
                            //   );
                            // });
                            _scrollDown(result);
                            // _scrollController.animateTo(
                            //   0.0,
                            //   curve: (result >= 19) ? Curves.easeIn : Curves.fastOutSlowIn,
                            //   duration: const Duration(milliseconds: 300),
                            // );
                          }

                          setState(() {});
                        },
                        icon: Icon(item[index].icon),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class ListIndex {
  int type;
  int index;
  int? sumNumbers;
  IconData icon;

  ListIndex({required this.type, required this.index, required this.icon, this.sumNumbers});
}

class ListClass extends StatefulWidget {
  final int colorvselected;
  final List<ListIndex> selectedList;
  ListClass({super.key, required this.selectedList, required this.colorvselected});

  @override
  State<ListClass> createState() => _ListClassState();
}

class _ListClassState extends State<ListClass> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    List<ListIndex> sortedList = List.from(widget.selectedList)..sort((a, b) => a.index.compareTo(b.index));

    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(25)), color: Colors.white),

      height: height * 0.5,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Selected Items', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: sortedList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  color: widget.colorvselected == sortedList[index].index ? Colors.green : Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Row(
                      children: [
                        Text('index : ${sortedList[index].index}'),
                        SizedBox(width: 10),
                        Text('Number: ${sortedList[index].sumNumbers}'),
                        Expanded(child: Container()),
                        IconButton(
                          icon: Icon(sortedList[index].icon),
                          onPressed: () {
                            Navigator.pop(context, sortedList[index].index);

                            setState(() {
                              widget.selectedList.removeAt(index);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
