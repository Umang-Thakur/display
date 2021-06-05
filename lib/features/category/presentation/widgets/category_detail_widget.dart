import 'package:cached_network_image/cached_network_image.dart';
import 'package:display/features/banner/presentation/widgets/loading.dart';
import 'package:display/features/category/domain/entities/category_entity.dart';
import 'package:flutter/material.dart';

class CategoryDetailWidget extends StatelessWidget {
  final CategoryEntity entity;

  const CategoryDetailWidget({Key key, @required this.entity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sort the images
    entity.images.sort((a, b) => a.id.compareTo(b.id));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: entity.images.length,
        itemBuilder: (context, index) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Card(
              clipBehavior: Clip.antiAlias,
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Container(
                width: MediaQuery.of(context).size.width / 1.1,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        child: CachedNetworkImage(
                          imageUrl: entity.images[index].image,
                          placeholder: (context, url) => LoadingIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      entity.images[index].id.toString(),
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
