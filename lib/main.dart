import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/click_cubit.dart';
import 'cubit/listedit_cubit.dart';
import 'cubit/themechanger_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  AppRouter router = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ClickCubit()),
        BlocProvider(create: (context) => ThemechangerCubit()),
        BlocProvider(create: (context) => ListeditCubit()),
      ],
      child: BlocBuilder<ThemechangerCubit, ThemeMode>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Cubit',
            onGenerateRoute: router.generateRouter,
            darkTheme: ThemeData.dark(),
            initialRoute: mainpage,
            themeMode: state,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();
  List<ClickCubitModel> myWidgetList = <ClickCubitModel>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(15, 80, 15, 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Счётчик',
              textDirection: TextDirection.ltr,
                    textAlign: TextAlign.center,
                    
                    style: TextStyle(
                        fontSize: 40,
                        fontFamily: "Arial"),
            ),
            BlocBuilder<ClickCubit, ClickState>(
              builder: (context, state) {
                if (state is onClick) {
                  return Text(
                    context.read<ClickCubit>().count.toString(),
                    style: Theme.of(context).textTheme.headline5,
                  );
                }
                if (state is ClickError) {
                  return Text(
                    state.message,
                    style: Theme.of(context).textTheme.headline5,

                  );
                }

                return Text(
                  'Нажмите на кнопку',
                  style: Theme.of(context).textTheme.headline5,
                  
                );
              },
            ),


            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: FloatingActionButton(
                  onPressed: () {
                    final ThemeData mode = Theme.of(context);
                    var brightness = mode.brightness;
                    bool isDarkMode = brightness == Brightness.dark;
                    context.read<ClickCubit>().Click(isDarkMode);
                  },
                  tooltip: 'Плюс',
                  child: const Icon(Icons.add_circle_outline),
                ),),
                
                Padding(
                  padding: const EdgeInsets.all(20),
                  child:FloatingActionButton(
                  onPressed: () {
                    final ThemeData mode = Theme.of(context);
                    var brightness = mode.brightness;
                    context
                        .read<ClickCubit>()
                        .ClickMinus(brightness == Brightness.dark);
                  },
                  
                  tooltip: 'Минус',
                  child: const Icon(Icons.remove_circle_outline),
                ),),

                 Padding(
                  padding: const EdgeInsets.all(20),
                  child: FloatingActionButton(
                  onPressed: () {
                    context.read<ThemechangerCubit>().ChangeTheme();
                  },
                  tooltip: 'Сменить тему',
                  child: const Icon(Icons.brightness_6),
                ),)
               
              ],
            ),
            ),
            
            Expanded(
              child: BlocBuilder<ClickCubit, ClickState>(
                builder: (context, state) {
                  myWidgetList = context.read<ClickCubit>().result;

                  return ListView.builder(
                      itemCount: myWidgetList.length,
                      itemBuilder: (context, index) {
                        if (myWidgetList.isNotEmpty)
                          return ListTile(
                              title: Text(myWidgetList[index].count.toString() +
                                  ", " +
                                  myWidgetList[index].message));
                        else
                          return Text("Лист пуст");
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const String mainpage = 'mainpage';

class AppRouter {
  Route<dynamic>? generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case mainpage:
        {
          return MaterialPageRoute(builder: (_) => MyHomePage());
        }
    }
  }
}
