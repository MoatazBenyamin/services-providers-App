
import 'package:get_it/get_it.dart';


import '../login/data/datasources/login_datasource.dart';
import '../login/data/repositories/login_repo_implementation.dart';
import '../login/domain/repositories/login_repo.dart';
import '../login/domain/usecases/login_usecase.dart';
import '../login/presentation/cubit/login_cubit.dart';
import '../signUp/data/datasources/user_database.dart';
import '../signUp/data/repositories/signup_repo_implementation.dart';
import '../signUp/domain/repositories/signup_repo.dart';
import '../signUp/domain/usecases/sign_up_usecase.dart';
import '../signUp/presentation/cubit/signup_cubit.dart';


final s1 = GetIt.instance;


Future<void> signUpInit() async {
  /// Place Feature

// Users Cubit
  s1.registerFactory<SignupCubit>(() =>
      SignupCubit(signUpUseCase: s1()));

// Use Cases

  s1.registerLazySingleton(() => SignUpUseCase(signUpRepository: s1()));

// Repositories

  s1.registerLazySingleton<SignUpRepository>(
      () => SignUpRepositoryImplementation(signUpPHP: s1()));

// DataSources

  s1.registerLazySingleton<SignUpPHP>(() => SignUpPHP());

// Core
//   s1.registerLazySingleton<NetworkInfo>(() => NetworkInfoImplemnt(connectionChecker: s1()));

// // Externals
//   s1.registerLazySingleton(() => InternetConnectionChecker());

}
Future<void> logInInit() async {

  s1.registerFactory<LoginCubit>(() =>
      LoginCubit(loginUseCase: s1()));

// Use Cases

  s1.registerLazySingleton(() => LoginUseCase(loginRepository: s1()));

// Repositories

  s1.registerLazySingleton<LoginRepository>(
      () => LogInRepositoryImplementation(login: s1()));

// DataSources

  s1.registerLazySingleton<logInPHP>(() => logInPHP());
  }