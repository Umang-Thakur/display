import 'package:display/features/banner/presentation/widgets/errorPage.dart';
import 'package:display/features/banner/presentation/widgets/loading.dart';
import 'package:display/features/banner/presentation/widgets/splashPage.dart';
import 'package:display/features/upcoming_event/domain/entities/upcoming_entity.dart';
import 'package:display/features/upcoming_event/presentation/bloc/upcomingevent_bloc.dart';
import 'package:display/features/upcoming_event/presentation/widgets/upcomingEvent_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:display/injection_container.dart';

class UpcomingEventDetailPage extends StatelessWidget {
  final UpcomingEvent entity;

  const UpcomingEventDetailPage({Key key, @required this.entity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: ListTile(
          title: Text(entity.title),
          subtitle: Text(entity.date),
        ),
      ),
      body: Container(
        child: buildUpcomingEventDetail(context, entity),
      ),
    );
  }
}

BlocProvider<UpcomingeventBloc> buildUpcomingEventDetail(
    BuildContext context, UpcomingEvent entity) {
  return BlocProvider(
    create: (_) => sl<UpcomingeventBloc>(),
    child: BlocBuilder<UpcomingeventBloc, UpcomingeventState>(
      builder: (context, state) {
        if (state is UpcomingeventInitial) {
          BlocProvider.of<UpcomingeventBloc>(context)
              .add((UpcomingEventListLoading()));
          return LoadingIndicator();
        } else if (state is UpcomingeventLoaded) {
          return UpcomingEventGetDetailPage(
            list: state.list,
          );
        } else if (state is Error) {
          return ErrorPage(message: state.msg);
        } else if (state is UpcomingeventListLoading) {
          BlocProvider.of<UpcomingeventBloc>(context)
              .add(GetUpcomingEvent(id: entity.id));
          return LoadingIndicator();
        }
        return SplashPage();
      },
    ),
  );
}
