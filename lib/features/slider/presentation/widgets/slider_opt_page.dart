import 'package:cached_network_image/cached_network_image.dart';
import 'package:display/features/banner/presentation/widgets/loading.dart';
import 'package:display/features/slider/domain/enitities/slider_entity.dart';
import 'package:display/features/slider/domain/enitities/slider_types.dart';
import 'package:display/features/slider/presentation/pages/slider_detail_page.dart';
import 'package:flutter/material.dart';

class SliderOptionsPage extends StatelessWidget {
  final SliderTypesEntity slider;

  const SliderOptionsPage({Key key, @required this.slider}) : super(key: key);

  void _navigateToSubSlider(BuildContext context, SliderEntity entity) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SubSliderDetailPage(
                  entity: entity,
                )));
  }

  @override
  Widget build(BuildContext context) {
    // Sort the slider
    slider.entity.sort((a, b) => a.id.compareTo(b.id));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(slider.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: slider.entity.length,
          itemBuilder: (context, index) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: InkWell(
                onTap: () =>
                    _navigateToSubSlider(context, slider.entity[index]),
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
                              imageUrl: slider.entity[index].image,
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
                          slider.entity[index].title,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
