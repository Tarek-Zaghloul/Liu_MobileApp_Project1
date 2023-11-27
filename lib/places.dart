import 'package:flutter/material.dart';

class Place{
  final String _name;
  final double _price;
  bool _selected = false;

  Place(this._name, this._price);
  String get name=> _name;
  double get price=> _price;
  bool get selected => _selected;
  set selected(bool e)=> _selected = e;
  @override
  String toString() {
    String space = '';
    for(int i= 0; i<3 - _price.toString().length; i++){
      space += ' ';
    }
    return 'Price: \$$_price $space$_name';
  }
}
List<Place> places = [
  Place('Dubai Marina', 20),
  Place('Dubai Mall', 10),
  Place('Atlantis', 5),
  Place('Burj Khalifa', 30),
];
class ShowPlaces extends StatelessWidget {
  const ShowPlaces({required this.width, Key?key}) : super(key: key);
  final double width;
  @override
  Widget build(BuildContext context) {
    List<Place> selectedPlaces = [];
    for (var e in places){
      if(e.selected){
        selectedPlaces.add(e);
      }
    }
    return ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: selectedPlaces.length,
        itemBuilder: (context, index){
          return Column(children: [
          const SizedBox(height: 10),
          SizedBox(width: width * 0.28),
          Text(selectedPlaces[index].toString(), style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
          ]);
        },
    );
  }
}
