import 'package:Mob_Project/core/constants/api_link.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/crud.dart';
import '../../../main.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);
  int index = 1;


  getservicesformycompany() async {
      Crud crud = Crud();

    var response = await crud.postRequest(view_all_services_link,
        {"companyid": sharedPref.getString("companyid")});
    return response;
  }

  void updateSelectedIndex(int index) {
    this.index = index;
    emit(UpdateSelectedIndexState(index));
  }
}
