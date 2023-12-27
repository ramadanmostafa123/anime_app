import 'buisness_logic/cubit/character_cubit.dart';
import 'presentation/screens/characters.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'buisness_logic/api_result/injection.dart';
import 'constant/mycolors/mycolors.dart';

import 'package:flutter/material.dart';

void main() {
 // runApp( BraeakingBadApp(appRouter: AppRouter()),);
  initGetIt();
  runApp(const BraeakingBadApp());
}

class BraeakingBadApp extends StatelessWidget {
 //  final AppRouter appRouter ;

  // ignore: use_super_parameters
  const BraeakingBadApp({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: MyColors.myYellow),
        useMaterial3: true,
      ),
      // onGenerateRoute: appRouter.generateRoute,
      home: BlocProvider(
        create: (context) => getIt<CharacterCubit>(),
        child: const CharactersScreen(),
      ),
    );
  }
}


// import 'package:breaking_bad_by_bloc/buisness_logic/api_result/injection.dart';
// import 'package:breaking_bad_by_bloc/buisness_logic/cubit/character_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:get_it/get_it.dart';
// import 'app_router.dart';

// void main() {
//   initGetIt();

//   runApp(BreakingBadApp(
//     appRouter: AppRouter(),
//   ));
// }

// class BreakingBadApp extends StatelessWidget {
//   final AppRouter appRouter;

//   const BreakingBadApp({super.key, required this.appRouter});

//   @override
//   Widget build(BuildContext context) {
//     getIt<CharacterCubit>();

//     //final characteeerCubit = getIt<CharacterCubit>();
//     //  characteeerCubit.createAndSetupDio;
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       onGenerateRoute: appRouter.generateRoute,
//     );
//   }
// }
