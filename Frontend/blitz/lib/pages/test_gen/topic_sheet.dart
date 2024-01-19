import 'package:flutter/material.dart';

class TopicSheet extends StatefulWidget {
  const TopicSheet(
      {super.key,
      required this.searchController,
      required this.topicsList,
      required this.topicSelected});

  final TextEditingController searchController;
  final List topicsList;
  final Function(String) topicSelected;

  @override
  State<TopicSheet> createState() => _TopicSheetState();
}

class _TopicSheetState extends State<TopicSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[50],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  const BoxShadow(
                    color: Color.fromRGBO(166, 166, 166, 0.25),
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    spreadRadius: -1.0,
                    blurRadius: 12.0,
                  ),
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Icon(Icons.search),
                    ),
                    SizedBox(
                      width: 300,
                      child: TextFormField(
                        controller: widget.searchController,
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontFamily: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.fontFamily,
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.fontSize),
                          border: InputBorder.none,
                        ),
                        cursorColor: Colors.black87,
                        cursorHeight: 20,
                        cursorWidth: 2,
                        cursorRadius: Radius.circular(20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: SizedBox(
              height: 425,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: ListView.builder(
                  itemCount: widget.topicsList.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      if (widget.topicsList[index][1]) {
                        widget.topicsList[index][1] = false;
                        widget.topicSelected('Selected');
                      } else {
                        widget.topicsList[index][1] = true;
                        widget.topicSelected('Deselected');
                      }
                      setState(() {});
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: widget.topicsList[index][1] == true
                              ? Theme.of(context).hintColor
                              : Theme.of(context).colorScheme.background,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(widget.topicsList[index][0]),
                              Icon(widget.topicsList[index][1] == true
                                  ? Icons.close_rounded
                                  : Icons.add_box_outlined)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 65,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        offset: Offset.zero,
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ]),
                child: Center(
                    child: Text(
                  "Done",
                  style: TextStyle(
                      fontFamily:
                          Theme.of(context).textTheme.bodyLarge?.fontFamily,
                      fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                      fontWeight:
                          Theme.of(context).textTheme.bodyLarge?.fontWeight,
                      color: Colors.grey.shade50),
                )),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
