import 'package:cached_network_image/cached_network_image.dart';
import 'package:display/features/banner/presentation/widgets/loading.dart';
import 'package:display/features/upcoming_event/domain/entities/upcoming_entity.dart';
import 'package:display/features/upcoming_event/presentation/pages/upcoming_event_detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpcomingEventListPage extends StatelessWidget {
  final List<UpcomingEvent> list;
  const UpcomingEventListPage({Key key, @required this.list}) : super(key: key);

  Future<void> _navigatetoDetail(BuildContext context, UpcomingEvent entity) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => UpcomingEventDetailPage(
                  entity: entity,
                )));
  }

  @override
  Widget build(BuildContext context) {
    // Sort According to Dates
    list.sort((a, b) => a.date.compareTo(b.date));

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => _navigatetoDetail(context, list[index]),
            child: Card(
              clipBehavior: Clip.antiAlias,
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Container(
                width: MediaQuery.of(context).size.width / 2.1,
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
                        //   list[index].image,
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
                          imageUrl: list[index].image,
                          placeholder: (context, url) => LoadingIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      title: Text(list[index].title),
                      subtitle: Text(list[index].date),
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
