import 'package:cached_network_image/cached_network_image.dart';
import 'package:display/features/banner/domain/entities/banner_entity.dart';
import 'package:display/features/banner/presentation/widgets/bannerDetail.dart';
import 'package:display/features/banner/presentation/widgets/loading.dart';
import 'package:flutter/material.dart';

class BannerList extends StatelessWidget {
  final List<BannerEntity> list;

  const BannerList({Key key, @required this.list}) : super(key: key);

  void _navigatetoDetail(BuildContext context, BannerEntity entity) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => BannerDetail(
                entity: entity,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Sort the list
    list.sort((a, b) => a.id.compareTo(b.id));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Card(
            clipBehavior: Clip.antiAlias,
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: Container(
              width: MediaQuery.of(context).size.width / 1.1,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      // decoration: BoxDecoration(
                      //     image: DecorationImage(
                      //   image: ImageProvider(),
                      //   fit: BoxFit.fill,
                      //   alignment: Alignment.topCenter,
                      // )),
                      // child: Image.network(
                      //   list[index].imageUrl,
                      //   fit: BoxFit.fill,
                      //   // alignment: Alignment.topCenter,
                      //   loadingBuilder: (BuildContext context, Widget child,
                      //       ImageChunkEvent loadingProgress) {
                      //     if (loadingProgress == null) return child;
                      //     return Center(
                      //         child: CircularProgressIndicator(
                      //       value: loadingProgress.expectedTotalBytes != null
                      //           ? loadingProgress.cumulativeBytesLoaded /
                      //               loadingProgress.expectedTotalBytes
                      //           : null,
                      //     ));
                      //   },
                      // ),
                      child: CachedNetworkImage(
                        imageUrl: list[index].imageUrl,
                        placeholder: (context, url) => LoadingIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    list[index].name,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
