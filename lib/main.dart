import 'package:bmi_calculator/cubit/bmi_cubit.dart';
import 'package:bmi_calculator/cubit/person_list_cubit.dart';
import 'package:bmi_calculator/view/home/home.dart';
import 'package:flutter/gestures.dart';

import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'dart:io';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    doWhenWindowReady(() {
      const initialSize = Size(600, 1200);
      const minSize = Size(500, 900);
      const maxSize = Size(500, 900);
      appWindow.maxSize = maxSize;
      appWindow.minSize = minSize;
      appWindow.size = initialSize;
      appWindow.show();
    });
  }

  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  HydratedBlocOverrides.runZoned(
    () => runApp(const MyApp()),
    storage: storage,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BmiCubit>(
          create: ((context) => BmiCubit()),
        ),
        BlocProvider<PersonListCubit>(
          create: (context) => PersonListCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
            PointerDeviceKind.stylus,
            PointerDeviceKind.unknown
          },
        ),
        home: const HomePage(),
      ),
    );
  }
}
