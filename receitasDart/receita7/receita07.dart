import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DataService {
  final ValueNotifier<List> tableStateNotifier = new ValueNotifier([]);

  var keys = ["name", "style", "ibu"];
  var columns = ["Mudança", "de", "ESTADO"];

  void carregar(index) {
    var funcoes = [
      carregarBrenos,
      carregarTimes,
      carregarMaterias,
    ];

    funcoes[index]();
  }

  void columnBrenos() {
    keys = ["name", "type", "age"];
    columns = ["Nome", "Tipo", "Idade"];
  }

  void columnTimes() {
    keys = ["team", "gamestyle", "fundation"];
    columns = ["Time", "Estilo de Jogo", "Fundação"];
  }

  void columnMaterias() {
    keys = ["matery", "area", "duration"];
    columns = ["Matéria", "Área", "Duração"];
  }

  void carregarBrenos() {
    columnBrenos();

    tableStateNotifier.value = [
      {"name": "Breno", "type": "Bombado", "age": "19"},
      {"name": "Breno", "type": "Magro", "age": "13"},
      {"name": "Breno", "type": "Gordo", "age": "17"},
      {"name": "Breno", "type": "Anoréxico", "age": "15"},
      {"name": "Breno", "type": "Careca", "age": "20+"}
    ];
  }

  void carregarTimes() {
    columnTimes();

    tableStateNotifier.value = [
      {"team": "Real Madrid", "gamestyle": "Agressivo", "fundation": "121"},
      {"team": "Barcelona FC", "gamestyle": "Tático", "fundation": "123"},
      {"team": "Manchester City", "gamestyle": "Ofensivo", "fundation": "143"},
      {"team": "Santos", "gamestyle": "Sofredor", "fundation": "111"},
      {"team": "São Paulo", "gamestyle": "Cauteloso", "fundation": "93"}
    ];
  }

  void carregarMaterias() {
    columnMaterias();

    tableStateNotifier.value = [
      {"matery": "ÁLGEBRA LINEAR", "area": "Exatas", "duration": "60"},
      {"matery": "POOI", "area": "Programação", "duration": "60"},
      {"matery": "ESTRUTURA DE DADOS", "area": "Exatas", "duration": "90"},
      {"matery": "OSM", "area": "Gestão", "duration": "60"},
      {"matery": "FSI", "area": "Administração", "duration": "60"}
    ];
  }
}

final dataService = DataService();

void main() {
  MyApp app = MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
        brightness: Brightness.dark,
      ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("State Change"),
          ),
          body: ValueListenableBuilder(
              valueListenable: dataService.tableStateNotifier,
              builder: (_, value, __) {
                return DataTableWidget(
                  jsonObjects: value,
                  propertyNames: dataService.keys,
                  columnNames: dataService.columns,
                );
              }),
          bottomNavigationBar:
              NewNavBar(itemSelectedCallback: dataService.carregar),
        ));
  }
}

class NewNavBar extends HookWidget {
  var itemSelectedCallback;

  NewNavBar({this.itemSelectedCallback}) {
    itemSelectedCallback ??= (_) {};
  }

  @override
  Widget build(BuildContext context) {
    var state = useState(1);
    return BottomNavigationBar(
        onTap: (index) {
          state.value = index;
          itemSelectedCallback(index);
        },
        currentIndex: state.value,
        items: const [
          BottomNavigationBarItem(
            label: "Brenos",
            icon: Icon(Icons.person),
          ),
          BottomNavigationBarItem(
              label: "Times", icon: Icon(Icons.emoji_flags)),
          BottomNavigationBarItem(
              label: "Matérias", icon: Icon(Icons.library_books_rounded))
        ]);
  }
}

class DataTableWidget extends StatelessWidget {
  final List jsonObjects;
  final List<String> columnNames;
  final List<String> propertyNames;

  DataTableWidget(
      {this.jsonObjects = const [],
      this.columnNames = const ["Nome", "Estilo", "IBU"],
      this.propertyNames = const ["name", "style", "ibu"]});
  @override
  Widget build(BuildContext context) {
    return DataTable(
        columns: columnNames
            .map((name) => DataColumn(
                label: Expanded(
                    child: Text(name,
                        style: TextStyle(fontStyle: FontStyle.italic)))))
            .toList(),
        rows: jsonObjects
            .map((obj) => DataRow(
                cells: propertyNames
                    .map((propName) => DataCell(Text(obj[propName])))
                    .toList()))
            .toList());
  }
}