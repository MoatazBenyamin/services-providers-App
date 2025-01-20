import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/sign_up_usecase.dart';
part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({required this.signUpUseCase}) : super(SignupInitial());

  static SignupCubit get(context) => BlocProvider.of(context);

  String selectedDropDownValue = '';

  bool isChecked = false;
  List<String> items = [
    "Manufacturing",
    "Medical",
    "Technology",
    "Finance",
    "else"
  ];
  List<String> selectedValues = [];
  List<bool> isCheckedList = [false, false, false, false, false];
  SignUpUseCase signUpUseCase;

  var emailController = TextEditingController();
  var passController = TextEditingController();
  var rePassController = TextEditingController();
  var personNameController = TextEditingController();
  var companyNameController = TextEditingController();
  var companySizeController =
      TextEditingController(); // ListDown Drop (micro-small-mini-large)
  var companyAddressController = TextEditingController();
  var companyLocationController = TextEditingController(); // Lat-Long
  var personPhoneController = TextEditingController();
  var companyIndustryController = TextEditingController(); // Check Box

  bool isnotShown = true;
  bool isnotShown1 = true;

  void onCategoryDropDownItemChanged(String value) {
    emit(HandelState());
    selectedDropDownValue = value;
    companySizeController.text = selectedDropDownValue;
    emit(CategoryDropDownItemChangedState());
  }

  void checkBoxChange(bool value, int index) {
    emit(HandelState());
    if (!isCheckedList[index]) {
      isCheckedList[index] = value;
      selectedValues.add(items[index]);
      print(selectedValues);
      emit(CheckBoxChangeState());
    } else {
      isCheckedList[index] = value;
      selectedValues.remove(items[index]);
      emit(CheckBoxChangeState());
      print(selectedValues);
    }
  }

  void changeVisibility() {
    emit(HandelState());
    isnotShown = !isnotShown;
    isnotShown1 = !isnotShown1;
    emit(ChangeVisibilityState());
  }

  void signUp(User user, BuildContext context) async {
    emit(SignUpLoadingState());
    // ! Shared Preferences
    try {
      await signUpUseCase(user, context);
      emit(SignUpSuccessState());
    } catch (e) {
      emit(SignUpErrorState());
    }
  }
}
