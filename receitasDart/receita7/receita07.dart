import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DataService {
  final ValueNotifier<List> tableStateNotifier = new ValueNotifier([]);

  var keys = ["name", "style", "ibu"];
  var columns = ["Mudança", "de", "ESTADO"];

  void carregar(index) {
    var funcoes = [
      getPlanets,
      getTimes,
      getDiscipline,
    ];

    funcoes[index]();
  }

  void columnPlanets() {
    keys = ["name", "discoveryYear", "distanceFromEarth"];
    columns = ["Planeta", "Ano de Descoberta", "Distância da Terra"];
  }

  void columnTimes() {
    keys = ["team", "gamestyle", "fundation"];
    columns = ["Time", "Estilo de Jogo", "Fundação"];
  }

  void columnMaterias() {
    keys = ["matery", "Área", "duration"];
    columns = ["Matéria", "Área", "Duração"];
  }

  void getPlanets() {
    columnPlanets();

    tableStateNotifier.value = [
      {"name": "Mercury", "discoveryYear": "1631", "distanceFromEarth": "91.7 million miles"},
      {"name": "Venus", "discoveryYear": "1610", "distanceFromEarth": "25 million miles"},
      {"name": "Earth", "discoveryYear": "N/A", "distanceFromEarth": "0 miles"},
      {"name": "Mars", "discoveryYear": "1659", "distanceFromEarth": "48.6 million miles"},
      {"name": "Jupiter", "discoveryYear": "1610", "distanceFromEarth": "365 million miles"}
    ];
  }

  void getTimes() {
    columnTimes();

    tableStateNotifier.value = [
      {"team": "Real Madrid", "gamestyle": "Agressivo", "fundation": "121"},
      {"team": "Barcelona FC", "gamestyle": "Tático", "fundation": "123"},
      {"team": "Manchester City", "gamestyle": "Ofensivo", "fundation": "143"},
      {"team": "Santos", "gamestyle": "Sofredor", "fundation": "111"},
      {"team": "São Paulo", "gamestyle": "Cauteloso", "fundation": "93"}
    ];
  }

  void  getDiscipline() {
    columnMaterias();

    tableStateNotifier.value = [
      {"matery": "ÁLGEBRA LINEAR", "Área": "Exatas", "duration": "60"},
      {"matery": "POOII", "Área": "Programação", "duration": "60"},
      {"matery": "ESTRUTURA DE DADOS", "Área": "Exatas", "duration": "90"},
      {"matery": "OSM", "Área": "Gestão", "duration": "60"},
      {"matery": "FSI", "Área": "Administração", "duration": "60"}
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
            label: "Planetas",
            icon: Icon(Icons.language),
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

  DataTableWidget({
    this.jsonObjects = const [],
    this.columnNames = const ["Nome", "Estilo", "IBU"],
    this.propertyNames = const ["matery", "Área", "duration"],
  });
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: columnNames
          .map(
            (name) => DataColumn(
              label: Expanded(
                child: Text(
                  name,
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
          )
          .toList(),
      rows: jsonObjects
          .map(
            (obj) => DataRow(
              cells: propertyNames
                  .map(
                    (propName) => DataCell(
                      Text(obj[propName] ?? ''), // Handle null values gracefully
                    ),
                  )
                  .toList(),
            ),
          )
          .toList(),
    );
  }
}