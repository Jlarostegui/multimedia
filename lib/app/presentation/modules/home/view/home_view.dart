import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../domain/repositories/publications_repository.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_state.dart';
import 'widgets/app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeBloc(HomeState.loading(),
          repository: context.read<PublicationsRepository>())
        ..init(),
      child:  Scaffold(
        appBar: const HomeAppBar(),
        body: Builder(builder: (context){
          
          final HomeBloc bloc = context.watch<HomeBloc>();
          return bloc.value.when(
              loading: () =>  const Center(
                    child: CircularProgressIndicator(),
                  ),
              loaded: (_) => const SizedBox(),
            );
          },
        ), 
      ),
    );
  }
}
