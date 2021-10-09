import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Form Validations Example'),
          ),
          body: MyCustomForm(),
        ));
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formkey = GlobalKey<FormState>();
  String? dataInput;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Padding(
        padding: EdgeInsets.only(top: 20, right: 8, left: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 50, bottom: 10),
                child: TextFormField(
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      dataInput = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Some Text";
                    } else if (value.length < 4) {
                      return "Username should have at least 4 chars";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: "Enter username",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          25,
                        ),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          25,
                        ),
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 3,
                        ),
                      ),
                      suffixIcon: Icon(Icons.account_box_outlined),
                      hintText: 'Enter UserName'),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 50, bottom: 10),
                child: TextFormField(
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      dataInput = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Some Text";
                    } else if (value.length < 6) {
                      return "Username should have at least 4 chars";
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Enterpassword ",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          25,
                        ),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          25,
                        ),
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 3,
                        ),
                      ),
                      suffixIcon: Icon(Icons.password_outlined),
                      hintText: 'Enter UserName'),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          if (dataInput == 'Harsh' && password == "Ktr@2314") {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Processing'),
                              ),
                            );
                          }

                          print("the output is $dataInput");
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  Text("Invalid INput please check again")));
                        }
                      },
                      child: Text("submit")),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
