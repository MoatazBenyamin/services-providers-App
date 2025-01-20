import 'dart:convert';

import 'package:Mob_Project/profile/domain/entities/user.dart';
import 'package:Mob_Project/search/data/models/service_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../../../core/constants/api_link.dart';
import '../../../core/crud.dart';
import '../../../main.dart';
import '../../../profile/data/models/user_profile.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  static SearchCubit get(context) => BlocProvider.of(context);
  List<ServiceModel> service_model = [];
  List<ServiceModel> service_modelToShow = [];
  Future<void> getListOfservices() async {
    var result = await http.get(Uri.parse(read_service_data));

    if (result.statusCode == 200) {
      var res = await jsonDecode(result.body);
      for (var data in res) {
        service_model.add(ServiceModel.fromJson(data));
      }
      service_modelToShow.add(service_model[0]);
      bool flag =false;
      for (int i = 0; i < service_model.length; i++) {
        for(int j=0; j<service_modelToShow.length;j++)
{
        if (service_modelToShow[j].servicetitle==service_model[i].servicetitle) {
             {
              flag=false;
              
              break;
             }   
        }
        flag =true;
        }
        if(flag)
        {
          service_modelToShow.add(service_model[i]);
        }
      }

      emit(getListOfServicesState());
    }
  }

  List<UserUdateProfile> companyList= [];
 Future<void> getListOfCompany(serviceTitle) async {
  companyList= [];
    Crud crud = Crud();
    for (var service in service_model) {
      print(service.servicetitle);
      if (service.servicetitle == serviceTitle) {
        var response = await crud
            .postRequest(get_company_link, {"companyid": service.companyid});
       
          companyList.add(UserUdateProfile.fromJson(response['data']));
        
        
      }
    }
    emit(getListOfCompanyState());
  }
  int changeSizeList()
  {
    
    int size = companyList.length;
    emit(changeSizeListState());
    return size;
  }
}
