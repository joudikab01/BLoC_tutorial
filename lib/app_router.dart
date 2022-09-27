import '../../../business_logic/cubit/characters_cubit.dart';
import '../../../data/repository/characters_repository.dart';

import '../../constants/strings.dart';
import '../../presentation/screens/characters_details.dart';
import '../../presentation/screens/characters_screen.dart';
import 'package:flutter/material.dart';

import 'data/web_services/characters_web_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) =>
                      charactersCubit,
                  child: const CharactersScreen(),
                ));
      case characterDetailsScreen:
        return MaterialPageRoute(builder: (_) => CharacterDetailsScreen());
    }
  }
}
