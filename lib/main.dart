import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/data/repositories_impl/publications_repository_impl.dart';
import 'app/domain/repositories/publications_repository.dart';
import 'app/presentation/my_app.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      Provider<PublicationsRepository>(create: (_) => PublicationsRepositoryImpl(),),
    ],
    child: const MyApp()),
  );
}
