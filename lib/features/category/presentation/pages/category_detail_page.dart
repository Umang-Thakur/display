import 'package:display/features/banner/presentation/widgets/errorPage.dart';
import 'package:display/features/banner/presentation/widgets/loading.dart';
import 'package:display/features/banner/presentation/widgets/splashPage.dart';
import 'package:display/features/category/domain/entities/category_entity.dart';
import 'package:display/features/category/presentation/bloc/category_bloc.dart';
import 'package:display/features/category/presentation/widgets/category_detail_widget.dart';
import 'package:display/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryDetailPage extends StatelessWidget {
  final CategoryEntity entity;

  const CategoryDetailPage({Key key, @required this.entity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(entity.name),
        ),
        body: buildImages(context, entity));
  }
}

BlocProvider<CategoryBloc> buildImages(
    BuildContext context, CategoryEntity entity) {
  return BlocProvider(
    create: (_) => sl<CategoryBloc>(),
    child: BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategoryInitial) {
          BlocProvider.of<CategoryBloc>(context).add((CategoryLoadingEvent()));
          return LoadingIndicator();
        } else if (state is CategoryLoaded) {
          entity.images = state.list;
          return CategoryDetailWidget(entity: entity);
        } else if (state is Error) {
          return ErrorPage(message: state.msg);
        } else if (state is CategoryLoading) {
          BlocProvider.of<CategoryBloc>(context).add(GetCategoryEvent(entity));
          return LoadingIndicator();
        }
        return SplashPage();
      },
    ),
  );
}
