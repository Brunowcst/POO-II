import 'package:flutter/material.dart';

void main() {

  MaterialApp app = MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text("Hello world!!!")),
        body: Center(
          child: Column(
            children: [
              const Text("Começando..."),
              const Text("No meio..."),
              const Text("Terminando...")]
          )
        ),
        bottomNavigationBar: const Text("Botão 1"),
      )
    );
  runApp(app);
}