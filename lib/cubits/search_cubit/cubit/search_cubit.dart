import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/services/get_all_categories.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  dynamic categoriesName = [];
  void getCategoriesName() async {
    try {
      categoriesName = await AllCategoriesServices().getAllCategories();
      emit(SearchSuccess(categoriesName: categoriesName));
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
