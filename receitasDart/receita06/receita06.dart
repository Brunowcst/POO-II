import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = "Login Now";
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  String? _gender;
  bool _isOver18 = true;
  int _age = 25;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Nome: ",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Campos obrigatório não preenchido!";
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "E-mail: ",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Campos obrigatório não preenchido!";
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Informe sua nota: ",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Campos obrigatório não preenchido!";
                }
                return null;
              },
            ),
            const Text("Informe seu sexo: "),
            ListTile(
              title: const Text("Homem"),
              leading: Radio<String>(
                value: "homem",
                groupValue: _gender,
                onChanged: (value) {
                  setState(() {
                    _gender = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text("Mulher"),
              leading: Radio<String>(
                value: "mulher",
                groupValue: _gender,
                onChanged: (value) {
                  setState(() {
                    _gender = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text("Outro"),
              leading: Radio<String>(
                value: "outro",
                groupValue: _gender,
                onChanged: (value) {
                  setState(() {
                    _gender = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text("SOU UMA XÍCARA DE CAFÉ"),
              leading: Radio<String>(
                value: "não-identificado",
                groupValue: _gender,
                onChanged: (value) {
                  setState(() {
                    _gender = value;
                  });
                },
              ),
            ),
            const Text("INFORME SUA IDADE:"),
            Slider(
              value: _age.toDouble(),
              min: 18,
              max: 90,
              divisions: 92,
              label: _age.toString(),
              onChanged: (double newValue) {
                setState(() {
                  _age = newValue.round();
                });
              },
            ),
            ToggleButtons(
              children: const <Widget>[
                Text("ESTOU TRISTE"),
                Text("ESTOU FELIZ"),
              ],
              isSelected: <bool>[_isOver18, !_isOver18],
              onPressed: (int index) {
                setState(() {
                  _isOver18 = index == 0;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_gender == null || _gender == '') {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Campos obrigatórios não preenchidos.")),
                  );
                } else if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Dados enviados!")),
                  );
                }
              },
              child: const Text("ENVIAR"),
            ),
            const SizedBox(height: 40),
            Container(
              height: 10,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: GestureDetector(
                onHorizontalDragUpdate: (DragUpdateDetails details) {
                  setState(() {
                    double newPosition = _age + details.delta.dx;
                    if (newPosition < 18) {
                      _age = 18;
                    } else if (newPosition > 90) {
                      _age = 90;
                    } else {
                      _age = newPosition.round();
                    }
                  });
                },
                child: Container(
                  height: 10,
                  width: MediaQuery.of(context).size.width *
                      0.8 *
                      (_age - 18) /
                      (90 - 18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
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
