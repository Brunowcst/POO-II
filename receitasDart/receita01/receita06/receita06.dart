import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    const appTitle = "PÁGINA DE LOGIN";
    return MaterialApp(
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
  const MyCustomForm({super.key});
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
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: "NOME: ",
              labelText: "INFORME SEU NOME: ",
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "ESTÁ ÁREA NÃO PODE SER NULA!!!";
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: "E-MAIL: ",
              labelText: "INFORME SEU E-MAIL: ",
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "ESTÁ ÁREA NÃO PODE SER NULA!!!";
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: "CUIDADO PARA NÃO REPROVAR! ",
              labelText: "INFORME QUANTOS PONTOS VOCÊ TIROU EM POO: ",
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "ESTÁ ÁREA NÃO PODE SER NULA!!!";
              }
              return null;
            },
          ),
          const Text("INFORME SEU SEXO: "),
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
                  const SnackBar(content: Text("INFORME UM CAMPO POR FAVOR!!")),
                );
              } else if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("DADOS ACEITOS E SUBMETIDOS")),
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
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.symmetric(vertical: 10),
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
    );
  }
}