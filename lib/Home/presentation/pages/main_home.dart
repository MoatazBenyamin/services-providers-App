import 'package:Mob_Project/core/colorsPallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../profile/presentation/pages/profil_user.dart';
import '../../../search/presentation/pages/Search.dart';
import '../cubit/home_cubit.dart';
import 'bookmark.dart';
import 'home_screen.dart';

class MainHome extends StatelessWidget {
  MainHome({Key? key}) : super(key: key);

  static const _navBarItems = [
    NavigationDestination(
      icon: Icon(Icons.bookmark_border_outlined),
      selectedIcon: Icon(Icons.bookmark_rounded,color: Colors.black),
      label: 'Bookmarks',
    ),
    NavigationDestination(
      icon: Icon(Icons.home_outlined),
      selectedIcon: Icon(Icons.home_rounded,color: Colors.black),
      label: 'Home',
    ),
    NavigationDestination(
      icon: Icon(Icons.search_outlined),
      selectedIcon: Icon(Icons.search,color: Colors.black),
      label: 'Search',
    ),
    NavigationDestination(
      icon: Icon(Icons.person_outline_rounded),
      selectedIcon: Icon(Icons.person_rounded ,color: Colors.black,),
      label: 'Profile',
    ),
    

  ];

// static pages[
//   HomeScreen(),

// ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
      child: Scaffold(
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is UpdateSelectedIndexState) {
              final selectedIndex = state.selectedIndex;
              return _buildPage(selectedIndex);
            }
            return _buildPage(1);
          },
        ),
        bottomNavigationBar: Builder(
          builder: (context) {
            final cubit = context.watch<HomeCubit>();
            return NavigationBar(
              backgroundColor: white,
              animationDuration: const Duration(seconds: 2),
              selectedIndex: cubit.index,
              onDestinationSelected: (index) {
                cubit.updateSelectedIndex(index);
              },
              destinations: _navBarItems,
            );
          },
        ),
      ),
    );
  }
}

Widget _buildPage(int selectedIndex) {
  switch (selectedIndex) {
    case 0:
      return BookmarksPage();
    case 1:
      return HomePage();
    case 2:
      return SearchCompanies();
    case 3:
      return ProfileUser();

    default:
      return HomePage(); // Default to the first page
  }
}
