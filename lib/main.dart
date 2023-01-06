import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:untitled/Controller.dart';
import 'package:untitled/blocs/app_bloc.dart';
import 'package:untitled/blocs/app_events.dart';
import 'package:untitled/blocs/appstates.dart';
import 'package:untitled/second.dart';

import 'Repo/Repositories.dart';

void main() {
  runApp(const MyApp());
}

//Bloc
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: RepositoryProvider(
      create: (BuildContext context) => Repositories(),
      child: const Home(),
    ));
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(
        RepositoryProvider.of<Repositories>(context),
      )..add(LoadUserEvvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Flutter Bloc")),
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (BuildContext context, state) {
            if (state is UserLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is UserLoadedState) {
              return Center(
                child: ListView.builder(
                    itemCount: state.Users.length,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(style: ListTileStyle.drawer,tileColor: Colors.blueGrey.shade300,horizontalTitleGap: 10,shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10)),
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.black,backgroundImage: NetworkImage( state.Users[i].avatar??"",),
                            // child: Image.network(
                            //   state.Users[i].avatar ?? "",
                            //   fit: BoxFit.fill,
                            // ),
                          ),
                          title: Text(
                              "${state.Users[i].firstName} ${state.Users[i].lastName}" ??
                                  ""),
                          subtitle: Text(state.Users[i].email ?? ""),
                        ),
                      );
                    }),
              );
            }
            if (state is ErrorState){
              return const Center(child: Text("Error occured while Loading Data"));
            }
            else {
              return const Center(
                child: Text("Data Loading Failed"),
              );
              ;
            }
          },
        ),
      ),
    );
  }
}

//Getx
class MyApp_Getx extends StatelessWidget {
  const MyApp_Getx({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => controller(), fenix: true);
    return New();
  }
}

class New extends StatelessWidget {
  New({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var con = controller();
    // once(con.a, (_) { con.a.value++;
    //   print(con.a.value);
    // });
    // ever(listener, (callback) => null);
    return GetMaterialApp(
      title: 'Getx & bloc',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("new"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Obx(() => Column(
                    children: [
                      Text(con.a.value.toString()),
                      Obx(
                        () => Text(con.b.value.toString()),
                      ),
                      Text(con.c.value.toString()),
                    ],
                  )),
              Text(
                "Nachiketa",
                style: Theme.of(context).textTheme.headline4,
              ),
              CupertinoButton(
                  child: Container(child: const Text("press")),
                  onPressed: () {
                    con.b.value += con.b.value;
                    con.a.value++;
                  }),
              OutlinedButton(
                  onPressed: () {
                    con.c.value += 0.1;
                  },
                  child: const Text("press")),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            con.a.value++;
          },
          tooltip: 'Increment',
          child: Obx(() => Text(con.a.value.toString())),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
