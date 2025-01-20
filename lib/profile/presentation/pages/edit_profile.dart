// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/colorsPallete.dart';
import '../../../core/shared_components.dart';
import '../../data/models/user_profile.dart';
import '../../domain/entities/user.dart';
import '../cubit/profile_cubit.dart';

class EditProfile extends StatelessWidget {
  UserUdateProfile user;
   EditProfile({super.key,required this.user});
 var profileFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: profileFormKey,
      child: BlocProvider(
          create: (BuildContext context) => ProfileCubit(),
          child: BlocConsumer<ProfileCubit, ProfileState>(
              listener: (context, state) {
    
              },
              builder:  (context, state) {
                ProfileCubit.get(context).saveUser(user);
                return Scaffold(
                  
                  appBar: AppBar(
                    leading: IconButton(icon: const Icon(Icons.arrow_back) , onPressed: (){Navigator.pop(context);},),
                    
                  ),
                  body: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           defaultFormField(
                                controller: ProfileCubit.get(context)
                                    .companyNameController,
                                type: TextInputType.text,
                                ispassword: false,
                                ontap: () {},
                                fillColor: white,
                                filled: true,
                                labelText: "Company Name",
                                prefixicon:
                                    const Icon(Icons.account_balance_rounded),
                                validate: (String value) {
                                  if (value.isEmpty) {
                                    return 'This Field must not be empty';
                                  } else {
                                    return null;
                                  }
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            defaultFormField(
                                controller: ProfileCubit.get(context)
                                    .personNameController,
                                type: TextInputType.text,
                                ispassword: false,
                                ontap: () {},
                                filled: true,
                                fillColor: white,
                                labelText: "Person Name",
                                prefixicon: const Icon(Icons.people_alt),
                                validate: (String value) {
                                  if (value.isEmpty) {
                                    return 'This Field must not be empty';
                                  } else {
                                    return null;
                                  }
                                }),
                            const SizedBox(
                              height: 10,
                            ),                                                                               
                            defaultFormField(
                                controller: ProfileCubit.get(context)
                                    .companyAddressController,
                                type: TextInputType.text,
                                ispassword: false,
                                ontap: () {},
                                filled: true,
                                labelText: "Company Address",
                                fillColor: white,
                                prefixicon: const Icon(Icons.map_rounded),
                                validate: (String value) {
                                  if (value.isEmpty) {
                                    return 'This Field must not be empty';
                                  } else {
                                    return null;
                                  }
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            defaultFormField(
                                controller: ProfileCubit.get(context)
                                    .companyLocationController,
                                type: TextInputType.text,
                                ispassword: false,
                                ontap: () {},
                                filled: true,
                                labelText: "Company Map Location",
                                fillColor: white,
                                prefixicon: const Icon(Icons.location_on),
                                validate: (String value) {
                                  if (value.isEmpty) {
                                    return 'This Field must not be empty';
                                  } else {
                                    return null;
                                  }
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            defaultFormField(
                                controller: ProfileCubit.get(context)
                                    .personPhoneController,
                                type: TextInputType.phone,
                                ispassword: false,
                                ontap: () {},
                                suffixPress: () {},
                                filled: true,
                                labelText: "Person Phone",
                                fillColor: white,
                                prefixicon: const Icon(Icons.phone),
                                validate: (String value) {
                                  if (value.isEmpty) {
                                    return 'This Field must not be empty';
                                  } else if (value.toString().length != 11) {
                                    return 'Password must be 11 digits';
                                  } else {
                                    return null;
                                  }
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                          Center(
                                child: MaterialButton(
                                    height: 40,
                                    minWidth: 250,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20)),
                                    elevation: 30,
                                    
                                    color:Darkblue,
                                    onPressed: () {
                                      if (profileFormKey.currentState!
                                          .validate()) {
    
                                        userProfile user = userProfile(
                                          contactPersonName: ProfileCubit.get(context).personNameController.text, 
                                          companyname: ProfileCubit.get(context).companyNameController.text, 
                                          contactPersonPhone: ProfileCubit.get(context).personPhoneController.text, 
                                          companyid: ProfileCubit.get(context).userdata!.companyid,
                                          companyAddress: ProfileCubit.get(context).companyAddressController.text, 
                                          companyLocation: ProfileCubit.get(context).companyLocationController.text, 
                                          )  ;  
                                          
                                           ProfileCubit.get(context).updateProfile(user, context);
                                        // Navigator.pop(context);
                                        // Navigator.push(context, MaterialPageRoute(builder: (context) =>const ProfileUser()));
                                      }
                                    },
                                    child: const Text(
                                      "Save",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
                              )
                        ],
                      ),
                    ),
                  ),
                );
              })),
    );
  }
}
