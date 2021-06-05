import 'package:display/features/category/domain/entities/category_entity.dart';
import 'package:display/features/category/presentation/pages/category_detail_page.dart';
import 'package:flutter/material.dart';

class CategoryListPage extends StatelessWidget {
  final List<CategoryEntity> entity;

  const CategoryListPage({Key key, @required this.entity}) : super(key: key);

  Future<void> _navigateToDetail(
      BuildContext context, CategoryEntity entity) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CategoryDetailPage(
                  entity: entity,
                )));
  }

  @override
  Widget build(BuildContext context) {
    // Sort the List of Categories
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
                  entity[index].name,
                  style: TextStyle(color: Colors.white),
                ),
                leading: Text(
                  entity[index].id.toString(),
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () => _navigateToDetail(context, entity[index]),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                tileColor: Color.fromRGBO(64, 75, 96, .9),
              ));
        },
      ),
    );
  }
}
