import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'domain/repositories/patient_repository.dart';
import 'domain/usecases/get_patients_usecase.dart';
import 'external/patient_server_datasource_impl.dart';
import 'infra/datasources/patient_datasource.dart';
import 'infra/repositories/patient_repository_impl.dart';
import 'presenter/home_controller.dart';
import 'presenter/page/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        // controllers
        Bind((i) => HomeController(i<GetPatientsUsecase>())),

        // stores

        // usecases
        Bind((i) => GetPatientsUsecaseImpl(i<PatientRepository>())),

        // repositories
        Bind((i) => PatientRepositoryImpl(
              i<Connectivity>(),
              i<PatientServerDatasource>(),
            )),

        // datasourcers
        Bind((i) => PatientServerDatasourceImpl(i<Dio>())),

        // others
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
