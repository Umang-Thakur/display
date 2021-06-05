import 'package:display/features/banner/presentation/widgets/errorPage.dart';
import 'package:display/features/banner/presentation/widgets/loading.dart';
import 'package:display/features/banner/presentation/widgets/splashPage.dart';
import 'package:display/features/slider/presentation/bloc/slider_bloc.dart';
import 'package:display/features/slider/presentation/widgets/slider_list_widget.dart';
import 'package:display/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

BlocProvider<SliderBloc> buildSlider(BuildContext context) {
  return BlocProvider(
    create: (_) => sl<SliderBloc>(),
    child: Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Text(
          'Sliders',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        // SliderList
        Container(
          height: MediaQuery.of(context).size.height * 0.1,
          child: BlocBuilder<SliderBloc, SliderState>(
            builder: (context, state) {
              if (state is SliderInitial) {
                BlocProvider.of<SliderBloc>(context)
                    .add((SliderTypesLoadingEvent()));
                return LoadingIndicator();
              } else if (state is SliderTypesLoaded) {
                return SliderTypesPage(entity: state.list);
              } else if (state is Error) {
                return ErrorPage(message: state.msg);
              } else if (state is SliderTypesLoading) {
                BlocProvider.of<SliderBloc>(context).add(GetSliderTypesEvent());
                return LoadingIndicator();
              }
              return SplashPage();
            },
          ),
        ),
      ],
    ),
  );
}
