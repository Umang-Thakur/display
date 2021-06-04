import 'package:cached_network_image/cached_network_image.dart';
import 'package:display/features/banner/presentation/widgets/loading.dart';
import 'package:display/features/upcoming_event/domain/entities/event_detail.dart';
import 'package:flutter/material.dart';

class UpcomingEventGetDetailPage extends StatelessWidget {
  final List<UpcomingEventDetail> list;

  const UpcomingEventGetDetailPage({Key key, @required this.list})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sort the list
    list.sort((a, b) => a.id.compareTo(b.id));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: list.length,
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
                    Text(
                      list[index].id.toString(),
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
