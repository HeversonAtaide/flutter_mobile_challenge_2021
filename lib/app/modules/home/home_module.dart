import 'package:flutter_modular/flutter_modular.dart';

import 'domain/repositories/patient_repository.dart';
import 'domain/usecases/get_patients_usecase.dart';
import 'presenter/home_controller.dart';
import 'presenter/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $HomeController,

        // controllers

        // stores

        // usecases
        Bind((i) => GetPatientsUsecaseImpl(i<PatientRepository>())),

        // repositories

        // datasourcers

        // others
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
