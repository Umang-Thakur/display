import 'package:display/features/slider/domain/enitities/slider_types.dart';
import 'package:display/features/slider/presentation/widgets/slider_opt_page.dart';
import 'package:flutter/material.dart';

class SliderTypesPage extends StatelessWidget {
  final List<SliderTypesEntity> entity;

  const SliderTypesPage({Key key, @required this.entity}) : super(key: key);

  Future<void> navigateTosliderList(
      BuildContext context, SliderTypesEntity obj) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SliderOptionsPage(
                  slider: obj,
                )));
  }

  @override
  Widget build(BuildContext context) {
    // Sort According to Dates
    entity.sort((a, b) => b.id.compareTo(a.id));

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 10,
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: entity.length,
        itemBuilder: (context, index) {
          return Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width / 1.1,
              child: ListTile(
                title: Text(
                  entity[index].title,
                  style: TextStyle(color: Colors.white),
                ),
                leading: Text(
                  entity[index].id.toString(),
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () => navigateTosliderList(context, entity[index]),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                tileColor: Color.fromRGBO(64, 75, 96, .9),
              ));
        },
      ),
    );
  }
}
