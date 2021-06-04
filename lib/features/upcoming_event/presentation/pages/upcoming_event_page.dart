import 'package:display/features/banner/presentation/widgets/errorPage.dart';
import 'package:display/features/banner/presentation/widgets/loading.dart';
import 'package:display/features/banner/presentation/widgets/splashPage.dart';
import 'package:display/features/upcoming_event/presentation/bloc/upcomingevent_bloc.dart';
import 'package:display/features/upcoming_event/presentation/widgets/upcomingEvent_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:display/injection_container.dart';

BlocProvider<UpcomingeventBloc> buildUpcomingEvent(BuildContext context) {
  return BlocProvider(
    create: (_) => sl<UpcomingeventBloc>(),
    child: Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Text(
          'Upcoming Events',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        // UpcomingeventList
        Container(
          height: MediaQuery.of(context).size.height / 3,
          child: BlocBuilder<UpcomingeventBloc, UpcomingeventState>(
            builder: (context, state) {
              if (state is UpcomingeventInitial) {
                BlocProvider.of<UpcomingeventBloc>(context)
                    .add((UpcomingEventListLoading()));
                return LoadingIndicator();
              } else if (state is UpcomingeventListLoaded) {
                return UpcomingEventListPage(list: state.list);
              } else if (state is Error) {
                return ErrorPage(message: state.msg);
              } else if (state is UpcomingeventListLoading) {
                BlocProvider.of<UpcomingeventBloc>(context)
                    .add(GetUpcomingEventList());
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
