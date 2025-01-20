// ignore_for_file:, must_be_immutable
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import '../../../core/colorsPallete.dart';
import '../../../core/dependency_injiction.dart' as di;
import '../../../core/drop_down.dart';
import '../../../core/shared_components.dart';
import '../../../login/presentation/pages/login.dart';
import '../../domain/entities/user.dart';
import '../cubit/signup_cubit.dart';

class SignUp extends StatelessWidget {
  var signUpFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: signUpFormKey,
        child: BlocProvider(
            create: (BuildContext context) => di.s1<SignupCubit>(),
            child: BlocConsumer<SignupCubit, SignupState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return Scaffold(
                    backgroundColor: white,
                    appBar: AppBar(
                      backgroundColor: Darkblue,
                      toolbarHeight: 250,
                      title: Center(
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account ? ',
                              style: TextStyle(
                                  color: white, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            MaterialButton(
                                height: 40,
                                minWidth: 250,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                elevation: 30,
                                splashColor: Colors.black,
                                color: Colors.black,
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()),
                                  );
                                },
                                child: const Text(
                                  "Login",
                                  style: TextStyle(color: Colors.white),
                                ))
                          ],
                        ),
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.elliptical(550, 550),
                        ),
                      ),
                    ),
                    body: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Create your ",
                              style: TextStyle(color: Darkblue, fontSize: 20),
                            ),
                            Text(
                              "Business Account ",
                              style: TextStyle(
                                  color: Darkblue,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            defaultFormField(
                                controller: SignupCubit.get(context)
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
                                controller: SignupCubit.get(context)
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
                                controller:
                                    SignupCubit.get(context).emailController,
                                type: TextInputType.emailAddress,
                                ispassword: false,
                                ontap: () {},
                                filled: true,
                                labelText: "Email",
                                prefixicon: const Icon(Icons.email_rounded),
                                fillColor: white,
                                validate: (String value) {
                                  if (value.isEmpty) {
                                    return 'Email must not be empty';
                                  } else if (!RegExp(
                                          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                      .hasMatch(value)) {
                                    return 'Unvalid Email Format';
                                  } else {
                                    return null;
                                  }
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            defaultFormField(
                                controller:
                                    SignupCubit.get(context).passController,
                                type: TextInputType.visiblePassword,
                                ispassword: SignupCubit.get(context).isnotShown,
                                ontap: () {},
                                filled: true,
                                fillColor: white,
                                labelText: "Password",
                                prefixicon: const Icon(Icons.lock),
                                suffixicon: SignupCubit.get(context).isnotShown
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                suffixPress: () {
                                  SignupCubit.get(context).changeVisibility();
                                },
                                validate: (String value) {
                                  if (value.isEmpty) {
                                    return 'Password must not be empty';
                                  } else {
                                    return null;
                                  }
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            defaultFormField(
                                controller:
                                    SignupCubit.get(context).rePassController,
                                type: TextInputType.visiblePassword,
                                ispassword: SignupCubit.get(context).isnotShown,
                                ontap: () {},
                                filled: true,
                                labelText: "Confirm Password",
                                fillColor: white,
                                prefixicon: const Icon(Icons.lock),
                                suffixicon: SignupCubit.get(context).isnotShown1
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                suffixPress: () {
                                  SignupCubit.get(context).changeVisibility();
                                },
                                validate: (String value) {
                                  if (value.isEmpty) {
                                    return 'Password must not be empty';
                                  } else if (SignupCubit.get(context)
                                          .rePassController
                                          .text !=
                                      SignupCubit.get(context)
                                          .passController
                                          .text) {
                                    return '2 Passwords are not equal';
                                  } else {
                                    return null;
                                  }
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            defaultFormField(
                                controller: SignupCubit.get(context)
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
                                controller: SignupCubit.get(context)
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
                                controller: SignupCubit.get(context)
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
                            Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: CustomDropDownList(
                                  dropDownValue: SignupCubit.get(context)
                                      .selectedDropDownValue,
                                  onChanged: SignupCubit.get(context)
                                      .onCategoryDropDownItemChanged,
                                  dropdownItems: const [
                                    "Micro",
                                    "Small",
                                    "Mini",
                                    "Large"
                                  ]),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 2, vertical: 2),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    border: Border.all(
                                      color: Darkblue,
                                    )),
                                child: Column(
                                  children: [
                                    CheckboxListTile(
                                      activeColor: Darkblue,
                                      title: Text(
                                          SignupCubit.get(context).items[0],
                                          style: TextStyle(color: Darkblue)),
                                      value: SignupCubit.get(context)
                                          .isCheckedList[0],
                                      onChanged: (bool? value) {
                                        SignupCubit.get(context)
                                            .checkBoxChange(value ?? false, 0);
                                      },
                                    ),
                                    CheckboxListTile(
                                      activeColor: Darkblue,
                                      title: Text(
                                          SignupCubit.get(context).items[1],
                                          style: TextStyle(color: Darkblue)),
                                      value: SignupCubit.get(context)
                                          .isCheckedList[1],
                                      onChanged: (bool? value) {
                                        SignupCubit.get(context)
                                            .checkBoxChange(value ?? false, 1);
                                      },
                                    ),
                                    CheckboxListTile(
                                      activeColor: Darkblue,
                                      title: Text(
                                          SignupCubit.get(context).items[2],
                                          style: TextStyle(color: Darkblue)),
                                      value: SignupCubit.get(context)
                                          .isCheckedList[2],
                                      onChanged: (bool? value) {
                                        SignupCubit.get(context)
                                            .checkBoxChange(value ?? false, 2);
                                      },
                                    ),
                                    CheckboxListTile(
                                      activeColor: Darkblue,
                                      title: Text(
                                          SignupCubit.get(context).items[3],
                                          style: TextStyle(color: Darkblue)),
                                      value: SignupCubit.get(context)
                                          .isCheckedList[3],
                                      onChanged: (bool? value) {
                                        SignupCubit.get(context)
                                            .checkBoxChange(value ?? false, 3);
                                      },
                                    ),
                                    CheckboxListTile(
                                      activeColor: Darkblue,
                                      title: Text(
                                          SignupCubit.get(context).items[4],
                                          style: TextStyle(color: Darkblue)),
                                      value: SignupCubit.get(context)
                                          .isCheckedList[4],
                                      onChanged: (bool? value) {
                                        SignupCubit.get(context)
                                            .checkBoxChange(value ?? false, 4);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Center(
                              child: MaterialButton(
                                  height: 50,
                                  minWidth: 3000,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  elevation: 1,
                                  splashColor: lightblue,
                                  color: Darkblue,
                                  onPressed: () {
                                    if (signUpFormKey.currentState!
                                        .validate()) {
                                      User user = User(
                                          personName: SignupCubit.get(context)
                                              .personNameController
                                              .text,
                                          companyName: SignupCubit.get(context)
                                              .companyNameController
                                              .text,
                                          personPhone: SignupCubit.get(context)
                                              .personPhoneController
                                              .text,
                                          email: SignupCubit.get(context)
                                              .emailController
                                              .text,
                                          companySize: SignupCubit.get(context)
                                              .selectedDropDownValue,
                                          industry: SignupCubit.get(context)
                                              .selectedValues
                                              .join(","),
                                          companyAddress:
                                              SignupCubit.get(context)
                                                  .companyAddressController
                                                  .text,
                                          companyLocation:
                                              SignupCubit.get(context)
                                                  .companyLocationController
                                                  .text,
                                          password: SignupCubit.get(context)
                                              .passController
                                              .text);

                                      di
                                          .s1<SignupCubit>()
                                          .signUp(user, context);
                                    }
                                  },
                                  child: Text(
                                    "Sign up",
                                    style: TextStyle(
                                        color: white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  )),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                })));
  }
}
