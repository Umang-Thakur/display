import 'package:cached_network_image/cached_network_image.dart';
import 'package:display/features/banner/presentation/widgets/errorPage.dart';
import 'package:display/features/banner/presentation/widgets/loading.dart';
import 'package:display/features/banner/presentation/widgets/splashPage.dart';
import 'package:display/features/slider/domain/enitities/slider_entity.dart';
import 'package:display/features/slider/presentation/bloc/slider_bloc.dart';
import 'package:display/features/slider/presentation/widgets/sub_slider_widget.dart';
import 'package:display/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubSliderDetailPage extends StatelessWidget {
  final SliderEntity entity;

  const SubSliderDetailPage({Key key, @required this.entity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: ListTile(
          title: Text(entity.title),
          subtitle: Text(entity.id.toString()),
          leading: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(entity.image)),
        ),
      ),
      body: Container(
        child: buildSubSlider(context, entity.id),
      ),
    );
  }
}

BlocProvider<SliderBloc> buildSubSlider(BuildContext context, int id) {
  return BlocProvider(
    create: (_) => sl<SliderBloc>(),
    child: BlocBuilder<SliderBloc, SliderState>(
      builder: (context, state) {
        if (state is SliderInitial) {
          BlocProvider.of<SliderBloc>(context).add((SubSliderLoadingEvent()));
          return LoadingIndicator();
        } else if (state is SubSliderLoaded) {
          return SubSliderPage(entity: state.entity);
        } else if (state is Error) {
          return ErrorPage(message: state.msg);
        } else if (state is SubSliderLoading) {
          BlocProvider.of<SliderBloc>(context).add(GetSubSliderEvent(id: id));
          return LoadingIndicator();
        }
        return SplashPage();
      },
    ),
  );
}
