import 'package:flutter/material.dart';
import 'places.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _sum=0;
  bool _showSelected = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      screenWidth = screenWidth * 0.8;
    }
    return Scaffold(
        appBar: AppBar(
          title:Text('Total Price: \$$_sum'),
          centerTitle: true,
          actions: [
            Tooltip(
              message: 'Rest selection',
              child: IconButton(
                onPressed: (){
                  setState((){
                    _sum = 0;
                    for (var e in places){
                      e.selected = false;
                    }
                    _showSelected = false;
                  });
                },
                    icon: const Icon(
                Icons.restore,
                ),
              )),
            Tooltip(
              message: 'Show/Hide Selected Places',
              child: IconButton(
                onPressed: (){
                  if(_sum != 0){
                    setState(() {
                      _showSelected = !_showSelected;
                    });
                  }
                },
                icon: const Icon(
                  Icons.shopping_cart_checkout,
                ),
              ),
            )
          ],
        ),
        body: _showSelected ? ShowPlaces(width: screenWidth):
            ListView.builder(
                itemCount: places.length,
                itemBuilder: (context, index){
                  return Column(children: [
                    Row(children: [
                      SizedBox(width: screenWidth * 0.24),
                      Checkbox(
                          value: places[index].selected,
                          onChanged: (e){
                            places[index].selected = e as bool;
                            if(places[index].selected){
                              _sum +=places[index].price;
                            }else{
                              _sum -= places[index].price;
                            }
                            setState(() {});
                          }),
                      Text(places[index].toString()),
                    ]),
                  ]);
                },
            )
    );
  }
}
