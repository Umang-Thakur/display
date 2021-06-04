import 'package:display/features/banner/domain/entities/banner_entity.dart';
import 'package:flutter/material.dart';

class BannerDetail extends StatelessWidget {
  final BannerEntity entity;

  const BannerDetail({Key key, @required this.entity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(entity.name),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              entity.imageUrl,
              fit: BoxFit.fill,
              alignment: Alignment.topCenter,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                    child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes
                      : null,
                ));
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      'Id: ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    Text(entity.id.toString(), style: TextStyle(fontSize: 14)),
                  ],
                ),
                Divider(
                  height: 10.0,
                  indent: 5.0,
                  color: Colors.grey,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Name: ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    Text(entity.name, style: TextStyle(fontSize: 14)),
                  ],
                ),
                Divider(
                  height: 10.0,
                  indent: 5.0,
                  color: Colors.grey,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Image Url : ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    Expanded(
                        child: Text(
                      entity.imageUrl,
                      style: TextStyle(fontSize: 14),
                    )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
