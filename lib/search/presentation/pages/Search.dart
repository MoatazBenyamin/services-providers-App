import 'package:Mob_Project/search/data/models/service_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Home/presentation/pages/company_details.dart';
import '../../../Home/presentation/widgets/service_cards.dart';
import '../../../core/colorsPallete.dart';
import '../cubit/search_cubit.dart';

class SearchCompanies extends StatelessWidget {
  const SearchCompanies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => SearchCubit()..getListOfservices(),
        child: BlocConsumer<SearchCubit, SearchState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is getListOfServicesState||state is getListOfCompanyState|| state is changeSizeListState) {
                return Scaffold(

                    appBar: AppBar(
                      // title: Text("Search",style:  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),),
                    ),
                    body: Padding(
                      padding: const EdgeInsets.only(top:15),
                      child: Column(
                        children: [
                        InputDecorator
                        (
                          isFocused: true,
                          decoration: 
                          InputDecoration
                          (
                            labelText: "Services search",
                            labelStyle:TextStyle
                            (
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                            prefixIcon: Icon(Icons.search,color: Colors.black,),
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15))
                            ),
                          child: Center(

                            child: Autocomplete(

                              optionsBuilder: (TextEditingValue textEditingValue) {

                                if (textEditingValue.text == '') {
                                  return const Iterable<String>.empty();
                                } else {
                                  List<String> matches = <String>[];
                                  for(var item in SearchCubit.get(context).service_modelToShow)
                                   {
                                    print(item.servicetitle);
                                     matches.add(item.servicetitle);
                                   }
                                  matches.retainWhere((s){
                                     return s.toLowerCase().contains(textEditingValue.text.toLowerCase());
                                  });
                                  return matches;
                                }
                              },

                              onSelected: (String selection) async {
                                 await SearchCubit.get(context).getListOfCompany(selection);
                                 print(SearchCubit.get(context).companyList.length);

                              },
                            ),
                          ),
                        ),
                        ListView.separated
                        (
                          shrinkWrap: true,
                          itemBuilder: (context, index) 
                          {
                            return InkWell(
                            onTap: () {
                              int companyid =int.parse(SearchCubit.get(context).companyList[index].companyid);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Companyprofile(
                                         companyid: companyid,
                                        )),
                              );
                            },
                            child: Card(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Image.asset(
                                      'assets/images/service.png',
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.fill,
                                    )), // Image.asset // Expanded
                                Expanded(
                                    flex: 2,
                                    child: ListTile(
                                      title: Text(
                      SearchCubit.get(context).companyList[index].companyname,
                      style:
                          TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                                      ),
                                      subtitle:
                                      Text(
                                        SearchCubit.get(context).companyList[index].contactPersonPhone,
                                        style:TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                                      ),
                                    )) // ListTile // Expanded
                              ],
                            ), // Row
                          ),
                    
                            
                          );
                          }, 
                          separatorBuilder: (context, index) => SizedBox(height: 10,),
                           itemCount: SearchCubit.get(context).changeSizeList()
                           ),
                      ]),
                    ));
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
