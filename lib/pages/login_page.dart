import 'package:flutter/material.dart';
import 'package:todo_list/pages/todo_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nickController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      body: Container(
        height: 700,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              textAlign: TextAlign.center,
              "Login to see your\nlist of tasks",
              style: TextStyle(
                  color: Colors.white, fontSize: 30, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 40),
              child: TextField(
                  controller: nickController,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                  ),
                  decoration: InputDecoration(
                    helperText: "A nickname between 4 and 8 letters",
                    helperStyle: TextStyle(
                      fontSize: 16
                    ),
                    hintText: "Nickname",
                    hintStyle: const TextStyle(fontSize: 19),
                    labelText: "Enter your nickname",
                    labelStyle: const TextStyle(color: Colors.white, fontSize: 26,),
                    enabledBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white, width: 1.5)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1.5,
                        )),
                  )),
            ),
            const SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(right: 35),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white,),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TodoPage(
                                  nick: nickController.text,
                                )));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Login", style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontSize: 19
                    ),),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
