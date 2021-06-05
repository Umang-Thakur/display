import 'package:display/features/banner/presentation/widgets/errorPage.dart';
import 'package:display/features/banner/presentation/widgets/loading.dart';
import 'package:display/features/banner/presentation/widgets/splashPage.dart';
import 'package:display/features/category/presentation/bloc/category_bloc.dart';
import 'package:display/features/category/presentation/widgets/category_list_widget.dart';
import 'package:display/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

BlocProvider<CategoryBloc> buildCategories(BuildContext context) {
  return BlocProvider(
    create: (_) => sl<CategoryBloc>(),
    child: Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Text(
          'Categories',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        // CategoryList
        Container(
          height: MediaQuery.of(context).size.height * 0.1,
          child: BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (state is CategoryInitial) {
                BlocProvider.of<CategoryBloc>(context)
                    .add((CategoryListLoadingEvent()));
                return LoadingIndicator();
              } else if (state is CategoryListLoaded) {
                return CategoryListPage(entity: state.list);
              } else if (state is Error) {
                return ErrorPage(message: state.msg);
              } else if (state is CategoryListLoading) {
                BlocProvider.of<CategoryBloc>(context)
                    .add(GetCategoryListEvent());
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
