import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/constants/api_link.dart';
import '../../../core/crud.dart';
import '../../data/models/user_profile.dart';
import '../../domain/entities/user.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);

  var personNameController = TextEditingController();
  var companyNameController = TextEditingController();
  var companyAddressController = TextEditingController();
  var companyLocationController = TextEditingController(); // Lat-Long
  var personPhoneController = TextEditingController();
  Crud? crud;
  final ImagePicker picker = ImagePicker();
  Uint8List? imageMemory;
  File? image;
  Future<void> uploadPhoto(File imageFile) async {
    var url = Uri.parse(
        'https://example.com/upload'); // Replace with your actual API endpoint

    // Create a multipart request
    var request = http.MultipartRequest('POST', url);

    // Add the image file to the request
    var imageStream = http.ByteStream(imageFile.openRead());
    var length = await imageFile.length();
    var multipartFile = http.MultipartFile('photo', imageStream, length,
        filename: imageFile.path.split('/').last);
    request.files.add(multipartFile);

    // Send the request and get the response
    var response = await request.send();

    // Handle the response
    if (response.statusCode == 200) {
      // Photo uploaded successfully
      print('Photo uploaded');
    } else {
      // Error occurred during upload
      print('Error uploading photo: ${response.statusCode}');
    }
  }

  Future<File?> getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  void getImages(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Image from Gallery'),
          content: const Text('Please choose an image.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                File? image = await getImageFromGallery();

                if (image != null) {
                  await fileToUint8List(image);
                }
                Navigator.of(context).pop();
              },
              child: const Text('Select'),
            ),
          ],
        );
      },
    );
  }

  Future<void> fileToUint8List(File file) async {
    try {
      //crud.postRequestWithFile(upload_image, file);
      List<int> fileBytes = file.readAsBytesSync();
      imageMemory = Uint8List.fromList(fileBytes);
      emit(ImageChangedState());
    } catch (e) {
      print('Error converting file to Uint8List: $e');
    }
  }

  List<UserUdateProfile> userModel = [];

  Future<void> ReadUserData(String email) async {
    var url = readData;
    var result = await http.get(Uri.parse(url));
    if (result.statusCode == 200) {
      var res = await jsonDecode(result.body);
      for (var data in res) {
        userModel.add(UserUdateProfile.fromJson(data));
      }
      print(userModel.length);
      print("heeeeeeeeeeey ReadUserData${email}");

      getUserData(email);
      // emit(ReadUserDataState());
    }
  }

  UserUdateProfile? userdata;

  void saveUser(UserUdateProfile user) async {
    personNameController.text = user.contactPersonName;
    personPhoneController.text = user.contactPersonPhone;
    companyAddressController.text = user.companyAddress;
    companyNameController.text = user.companyname;
    companyLocationController.text = user.companyLocation;
    // ! Shared Preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('companyid', user.companyid);
    await prefs.setString('email', user.email);
    await prefs.setString('companyAddress', user.companyAddress);
    await prefs.setString('companyname', user.companyname);
    await prefs.setString('companyLocation', user.companyLocation);
    await prefs.setString('contactPersonName', user.contactPersonName);
    await prefs.setString('contactPersonPhone', user.contactPersonPhone);

    userdata = user;
    emit(saveUserState());
  }

  void getUserData(String email) {
    print(userModel.length);
    for (UserUdateProfile user in userModel) {
      print(user.email);
      if (user.email == email) {
        userdata = user;
        emit(getUserDataState());
        break; // Assuming you want to stop the loop after finding a match
      }
    }
  }

  Future<void> updateProfile(userProfile user, BuildContext context) async {
    Crud crud = Crud();

    try {
      var response = await crud.postRequest(updataLink, {
        "companyid": user.companyid.toString(),
        "contactPersonName": user.contactPersonName,
        "contactPersonPhone": user.contactPersonPhone,
        "companyname": user.companyname,
        "companyAddress": user.companyAddress,
        "companyLocation": user.companyLocation,
      });

      if (response != null && response.containsKey('status')) {
        if (response['status'] == 'Success') {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("update Succeeded")));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("update Failed")));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Unexpected response from server")));
      }
    } catch (e) {}
  }
}
