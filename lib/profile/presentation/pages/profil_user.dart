import 'package:Mob_Project/login/presentation/pages/login.dart';
import 'package:Mob_Project/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/colorsPallete.dart';
import '../cubit/profile_cubit.dart';
import '../widgets/textfield.dart';
import 'edit_profile.dart';

class ProfileUser extends StatelessWidget {
  ProfileUser({super.key});

  Future<String?> getCompanyEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('email');
    return email;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
        future: getCompanyEmail(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            String? email = snapshot.data;
            print("heeeeeeeeeeey${email}");
            return BlocProvider(
                create: (context) => ProfileCubit()..ReadUserData(email!),
                child: BlocConsumer<ProfileCubit, ProfileState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is getUserDataState ||
                          state is ImageChangedState) {
                        return Scaffold(
                          appBar: AppBar(
                            // title: const Text("Company Profile"),
                            leading: Icon(Icons.arrow_back,
                                color: Colors.transparent),
                            leadingWidth: 0,
                            actions: [
                              IconButton(
                                  icon: Icon(Icons.edit,color: Colors.black,),
                                  onPressed: () {
                                    var user =
                                        ProfileCubit.get(context).userdata!;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EditProfile(user: user)));
                                  }),
                            ],
                          ),
                          body: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Stack(children: [
                                    CircleAvatar(
                                      backgroundColor: lightblue,
                                      radius: 85,
                                      child: ProfileCubit.get(context)
                                                  .imageMemory ==
                                              null
                                          ? const CircleAvatar(
                                              radius: 80,
                                              backgroundImage: AssetImage(
                                                'assets/images/prof.jpg',
                                              ))
                                          : CircleAvatar(
                                              radius: 80,
                                              backgroundImage: MemoryImage(
                                                  ProfileCubit.get(context)
                                                      .imageMemory!),
                                            ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: lightblue,
                                            shape: BoxShape.circle),
                                        child: IconButton(
                                          icon:
                                              Icon(Icons.edit, color: white),
                                          onPressed: () async {
                                            ProfileCubit.get(context)
                                                .getImages(context);
                                          },
                                        ),
                                      ),
                                    ),
                                  ]),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                SharedTextFields(
                                  title: "Company name",
                                  body: ProfileCubit.get(context)
                                      .userdata!
                                      .companyname,
                                ),
                                SharedTextFields(
                                  title: "Person name",
                                  body: ProfileCubit.get(context)
                                      .userdata!
                                      .contactPersonName,
                                ),
                                SharedTextFields(
                                  title: "email",
                                  body: ProfileCubit.get(context)
                                      .userdata!
                                      .email,
                                ),
                                SharedTextFields(
                                  title: "Person phone",
                                  body: ProfileCubit.get(context)
                                      .userdata!
                                      .contactPersonPhone,
                                ),
                                SharedTextFields(
                                  title: "Company address",
                                  body: ProfileCubit.get(context)
                                      .userdata!
                                      .companyAddress,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    sharedPref.clear();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Login()),
                                    );
                                  },
                                  minWidth: 13,
                                  height: 50,
                                  color: Colors.red,
                                  child: Center(
                                    child: Row(
                                      children: [
                                        const Icon(Icons.logout_rounded,
                                            color: Colors.white, size: 33),
                                        Text(
                                          'Log Out',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 23),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      } else {
                        return Scaffold(
                          body: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                    }));
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
