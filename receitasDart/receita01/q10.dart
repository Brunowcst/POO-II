import 'package:flutter/material.dart';

void main() {
  MaterialApp app = MaterialApp(
    theme: ThemeData(
      brightness: Brightness.dark,
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Roboto'),
      ),
    ),
    home: Scaffold(
      appBar: AppBar(title: const Text("Cervejas")),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DataTable(
                columns: const [
                  DataColumn(label: Text('Nome')),
                  DataColumn(label: Text('Estilo')),
                  DataColumn(label: Text('Ibu')),
                ],
                rows: const [
                  DataRow(cells: [
                    DataCell(Text('La Fin Du Monde')),
                    DataCell(Text('Bock')),
                    DataCell(Text('65')),
                  ]),

                  DataRow(cells: [
                    DataCell(Text('Saporo Premium')),
                    DataCell(Text('Sour Ale')),
                    DataCell(Text('54')),
                  ]),

                  DataRow(cells: [
                    DataCell(Text('Duvel')),
                    DataCell(Text('Pilsner')),
                    DataCell(Text('82')),
                  ]),
              ],
          )],
        )
      ),
      bottomNavigationBar: Row(
            children: [
              Expanded(
                  child: IconButton(
                      icon: const Icon(Icons.home), onPressed: () {})),
              Expanded(
                  child: IconButton(
                      icon: const Icon(Icons.person), onPressed: () {})),
              Expanded(
                  child: IconButton(
                      icon: const Icon(Icons.settings), onPressed: () {}))
            ],
      )
    ),
  );
  runApp(app);
}
