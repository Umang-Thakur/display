import 'package:display/features/banner/presentation/bloc/banner_bloc.dart';
import 'package:display/features/banner/presentation/widgets/bannerList.dart';
import 'package:display/features/banner/presentation/widgets/errorPage.dart';
import 'package:display/features/banner/presentation/widgets/loading.dart';
import 'package:display/features/banner/presentation/widgets/splashPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:display/injection_container.dart';

BlocProvider<BannerBloc> buildBanner(BuildContext context) {
  return BlocProvider(
    create: (_) => sl<BannerBloc>(),
    child: Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Text(
          'Banner',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        // BannerList
        Container(
          height: MediaQuery.of(context).size.height / 3,
          child: BlocBuilder<BannerBloc, BannerState>(
            builder: (context, state) {
              if (state is BannerInitial) {
                BlocProvider.of<BannerBloc>(context).add(LoadingEvent());
                return LoadingIndicator();
              } else if (state is BannerLoaded) {
                return BannerList(list: state.list);
              } else if (state is Error) {
                return ErrorPage(message: state.msg);
              } else if (state is BannerLoading) {
                BlocProvider.of<BannerBloc>(context).add(GetBannerListEvent());
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
