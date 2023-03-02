// ignore_for_file: file_names
                                        // "Used in Task 2"
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

// ignore: camel_case_types
class AnimatedListTask extends StatefulWidget {
  const AnimatedListTask({super.key});

  @override
  State<AnimatedListTask> createState() => _AnimatedListTaskState();
}

// ignore: camel_case_types
class _AnimatedListTaskState extends State<AnimatedListTask> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final _items = []; //list of items
    final GlobalKey<AnimatedListState> listKey =
        GlobalKey(); //key for animated list widget "
    /*
     AnimatedListState ==> حاوية قائمة قابلة للتمرير تعمل على تحريك العناصر عند إدراجها أو إزالتها.    
     Global keys provide access to other objects that are associated with those elements 
     such as [BuildContext]. For [StatefulWidget]s, global keys also provide access to [State"insert ,, remove,,etc"].
     */

    //add item to list
    void _insertItem() {
      //insert in list
      _items.insert(0, 'Item ${_items.length + 1}');
      //insert in current state
      listKey.currentState!.insertItem(0, duration: const Duration(seconds: 1));
    }

    //remove item from list
    void _removeItem(int idx) {
      // remove in current state
      listKey.currentState!.removeItem(
        idx,
        (_, animation) {
          //"builder" return  a transition widget that animates the removal of the item
          return SizeTransition(
            // SizeTransition   ==> used to make the item go smaller and smaller  disappear
            sizeFactor: animation,
            child: const Card(
              margin: EdgeInsets.all(10),
              color: Colors.red,
              child: ListTile(
                title: Text(
                  "deleted",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          );
        },
        duration: const Duration(milliseconds: 300),
      );
      //remove from list
      _items.removeAt(idx);
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height / 10,
        title: const Text('Flutter Mapp'),
        centerTitle: true,
        // leading: Container(),  //to remove the back button
        backgroundColor: const Color.fromARGB(255, 80, 79, 79),
        elevation: 0.0,
        
      ),
      body: Container(
          color: const Color.fromARGB(255, 32, 33, 57),
        child: Card(
          color: const Color.fromARGB(255, 32, 33, 57),
          
          child: Column(
            children: [
              //distance
              SizedBox(
                height: height / 20,
              ),
        
              IconButton(
                  onPressed: _insertItem,
                  icon: const Icon(
                    
                    Icons.add,
                    size: 30,
                    color: Colors.white,
                     
                    ),
                  splashColor: Colors.blue,
                   highlightColor: Colors.red,
                  padding: const EdgeInsets.all(10),
                    ),
              //distance
              SizedBox(height: height / 30, ),
 //Creates a widget that expands a child of a [Row], [Column], 
//or [Flex] so that the child fills the available space along the flex widget's main axis.             
              Expanded(
                child: AnimatedList(
                  key: listKey,
                  padding: const EdgeInsets.all(10),
                  initialItemCount: 0,
                  itemBuilder: (context, index, animation) {
                    return SizeTransition(
                      //SizeTransition :this time we use it to make item bigger and bigger until item appear
                      key: UniqueKey(),
                      sizeFactor: animation,
                      child: Card(
                        margin: const EdgeInsets.all(10),
                        color: Colors.orangeAccent,
                        child: ListTile(
                          title: Text(
                            _items[index],
                            style: const TextStyle(fontSize: 24),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              _removeItem(index);
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
