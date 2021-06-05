import 'package:dartz/dartz.dart';
import 'package:display/core/error/failures.dart';
import 'package:display/features/slider/domain/enitities/slider_types.dart';
import 'package:display/features/slider/domain/enitities/sub_slider_entity.dart';

abstract class SliderRepository {
  Future<Either<Failure, List<SliderTypesEntity>>> getSlider();
  Future<Either<Failure, SubSliderEntity>> getSubSLider(int id);
}
