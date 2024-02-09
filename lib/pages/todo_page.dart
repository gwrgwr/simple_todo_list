import 'package:flutter/material.dart';
import 'package:todo_list/data/list_data.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({required this.nick, super.key});

  final String nick;

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController taskController = TextEditingController();

    TextEditingController editTaskController = TextEditingController();

    final teste = TaskList.of(context).tasks;

    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      drawer: _drawerSection(),
      appBar: _appBarSection(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            right: 20,
            left: 20,
            bottom: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Search for tasks",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 27,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 15,
              ),
              const TextField(
                style: TextStyle(color: Colors.white, fontSize: 20),
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search, color: Colors.black),
                    hintText: "Enter a task name...",
                    hintStyle: TextStyle(fontSize: 20),
                    disabledBorder:
                        OutlineInputBorder(borderSide: BorderSide.none),
                    enabledBorder:
                        OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2))),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 400,
                height: 450,
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 8,
                  ),
                  itemCount: teste.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.deepOrange.shade600,
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: CheckboxListTile(
                          materialTapTargetSize: MaterialTapTargetSize.padded,
                          value: teste[index][1],
                          onChanged: (bool? value) {
                            setState(() {
                              teste[index][1] = value!;
                              if (teste[index][1] == true) {
                                final snackBar = SnackBar(
                                    duration: const Duration(seconds: 10),
                                    content: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Text("Want to Delete the task?"),
                                        TextButton(
                                          onPressed: () {
                                            ScaffoldMessenger.of(context)
                                                .hideCurrentSnackBar();
                                          },
                                          child: const Text("Yes"),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            ScaffoldMessenger.of(context)
                                                .hideCurrentSnackBar();
                                            setState(() {
                                              teste[index][2] =
                                                  !teste[index][2];
                                            });
                                          },
                                          child: const Text("No"),
                                        ),
                                      ],
                                    ));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              } else {
                                teste[index][2] = false;
                              }
                            });
                          },
                          activeColor: Colors.white,
                          checkColor: Colors.deepOrangeAccent,
                          secondary: Container(
                            width: 72,
                            child: Row(
                              children: [
                                IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          useRootNavigator: false,
                                          builder: (context) => Dialog(
                                                backgroundColor:
                                                    Colors.deepOrangeAccent,
                                                child: Container(
                                                  width: 400,
                                                  height: 500,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      const Text(
                                                        "Change your task",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 26,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                      SizedBox(height: 20),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 10,
                                                                right: 10),
                                                        child: TextField(
                                                          controller:
                                                              editTaskController,
                                                          decoration:
                                                              InputDecoration(
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Colors
                                                                          .white,
                                                                      width: 2,
                                                                    ),
                                                                  ),
                                                                  focusedBorder:
                                                                      UnderlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                  hintText:
                                                                      "Task name",
                                                                  hintStyle:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                  )),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment: Alignment
                                                            .bottomRight,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  right: 35),
                                                          child: TextButton(
                                                            style: ButtonStyle(
                                                                backgroundColor:
                                                                    MaterialStateProperty
                                                                        .all(Colors
                                                                            .white),
                                                                shape: MaterialStateProperty
                                                                    .all(
                                                                        RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20),
                                                                ))),
                                                            child: const Text(
                                                              "Edit",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .deepOrangeAccent,
                                                                fontSize: 18,
                                                              ),
                                                            ),
                                                            onPressed: () {
                                                              setState(() {
                                                                teste[index]
                                                                        [0] =
                                                                    editTaskController
                                                                        .text;
                                                                const editSnackBar =
                                                                    SnackBar(
                                                                  behavior:
                                                                      SnackBarBehavior
                                                                          .floating,
                                                                  content: Text(
                                                                      "Editing your task..."),
                                                                );
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                        editSnackBar);
                                                                Navigator.pop(
                                                                    context);
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ));
                                    }),
                              ],
                            ),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Text(
                            teste[index][0],
                            softWrap: true,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                decoration: teste[index][1]
                                    ? TextDecoration.lineThrough
                                    : null,
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w500),
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
      floatingActionButton:
          _bottomButtonSection(context, taskController, teste),
    );
  }

  Row _bottomButtonSection(
      BuildContext context, TextEditingController taskController, teste) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text(
                "Add new Task",
                style: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              )),
        ),
        const SizedBox(
          width: 15,
        ),
        Container(
          width: 50,
          decoration: const BoxDecoration(
            color: Colors.deepOrangeAccent,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            highlightColor: Colors.black,
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(1),
                shadowColor: MaterialStateProperty.all(Colors.black)),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => Dialog.fullscreen(
                        backgroundColor: Colors.deepOrangeAccent,
                        child: SizedBox(
                          height: 400,
                          width: 400,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextField(
                                controller: taskController,
                                decoration: InputDecoration(
                                    hintText: "Insert task name",
                                    hintStyle: TextStyle(
                                        color: Colors.white.withOpacity(0.4),
                                        fontSize: 30),
                                    enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide.none)),
                              ),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      teste.add(
                                          [taskController.text, false, false]);
                                      Navigator.pop(context);
                                    });
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      Colors.white,
                                    ),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 25),
                                    child: Text(
                                      "Send",
                                      style: TextStyle(
                                          color: Colors.deepOrangeAccent,
                                          fontSize: 22),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ));
            },
            icon: const Icon(
              Icons.add,
              size: 30,
            ),
          ),
        )
      ],
    );
  }

  AppBar _appBarSection() {
    return AppBar(
      backgroundColor: Colors.deepOrangeAccent,
      title: const Text(
        "Todo",
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
      ),
      centerTitle: true,
    );
  }

  Drawer _drawerSection() {
    return Drawer(
      backgroundColor: Colors.deepOrangeAccent,
      child: ListView(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepOrangeAccent.withOpacity(0.8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 400,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.nick.isNotEmpty
                              ? 'Hello ${widget.nick}'
                              : 'Anonymus',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.person, size: 45),
                          onPressed: () {},
                        )
                      ],
                    ),
                  )
                ],
              )),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 50),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20)),
              child: const IntrinsicHeight(
                child: ListTile(
                  leading: SizedBox(
                    width: 50,
                    child: Row(
                      children: [
                        Icon(
                          Icons.list_outlined,
                          color: Colors.deepOrangeAccent,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        VerticalDivider(
                          endIndent: 15,
                          indent: 15,
                          color: Colors.deepOrangeAccent,
                          thickness: 2,
                        )
                      ],
                    ),
                  ),
                  title: Text(
                    "All tasks",
                    style: TextStyle(
                        color: Colors.deepOrangeAccent,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 50),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20)),
              child: const IntrinsicHeight(
                child: ListTile(
                  leading: SizedBox(
                    width: 50,
                    child: Row(
                      children: [
                        Icon(
                          Icons.checklist,
                          color: Colors.deepOrangeAccent,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        VerticalDivider(
                          endIndent: 15,
                          indent: 15,
                          color: Colors.deepOrangeAccent,
                          thickness: 2,
                        )
                      ],
                    ),
                  ),
                  title: Text(
                    "Finished Tasks",
                    style: TextStyle(
                        color: Colors.deepOrangeAccent,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 50),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20)),
              child: const IntrinsicHeight(
                child: ListTile(
                  leading: SizedBox(
                    width: 50,
                    child: Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      child: Row(
                        children: [
                          Icon(
                            Icons.timelapse_rounded,
                            color: Colors.deepOrangeAccent,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          VerticalDivider(
                            endIndent: 15,
                            indent: 15,
                            color: Colors.deepOrangeAccent,
                            thickness: 2,
                          )
                        ],
                      ),
                    ),
                  ),
                  title: Text(
                    "Pending tasks",
                    style: TextStyle(
                        color: Colors.deepOrangeAccent,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
