import 'package:cart_example/screens/catalog.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? name;
  String? password;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    print("rebuild");
    var inputDecoration = InputDecoration(
      hintText: "Name1",
      filled: true,
      fillColor: Colors.grey[200],
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login", style: TextStyle(fontSize: 24)),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: height / 4,
                ),
                TextFormField(
                  controller: nameController,
                  validator: (String? name) {
                    if (name?.isEmpty ?? true) {
                      return "please enter name";
                    }
                    return null;
                  },
                  decoration: inputDecoration,
                ),
                SizedBox(
                  height: height / 12,
                ),
                TextFormField(
                  validator: (String? password) {
                    if (password?.isEmpty ?? true) {
                      return "please enter password";
                    }
                    return null;
                  },
                  decoration: inputDecoration.copyWith(
                    hintText: "Password",
                  ),
                ),
                SizedBox(
                  height: height / 12,
                ),
                ElevatedButton(
                    onPressed: () {
                      nameController.clear();
                    },
                    child: Icon(Icons.clear)),
                ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState?.validate() ?? false) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => MyCatalog()));
                    }
                  },
                  child: Text("Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
