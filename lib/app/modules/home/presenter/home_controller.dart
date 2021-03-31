import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mobile_challenge_2021/app/modules/home/domain/entities/patient.dart';
import 'package:flutter_mobile_challenge_2021/app/modules/home/domain/usecases/get_patients_usecase.dart';
import 'package:flutter_mobile_challenge_2021/core/consts/network_config.dart';
import 'package:flutter_mobile_challenge_2021/core/failures/failures.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final GetPatientsUsecase _getPatientsUsecase;
  final _seed = NetworkConfig.seed;
  final _results = NetworkConfig.pageResults;
  int _page;
  final double _cardHeight = 148;
  double get cardHeight => _cardHeight;

  @observable
  List<Patient> _patients;

  @computed
  List<Patient> get patients => _patients;

  @observable
  bool _isLoading;

  @computed
  bool get isLoading => _isLoading;

  @observable
  Failure _error;

  @computed
  Failure get error => _error;

  _HomeControllerBase(this._getPatientsUsecase) {
    _init();
  }

  @action
  Future<void> _init() async {
    _error = null;
    _isLoading = false;

    _page = 1;
    _patients = [];

    await fetchData();
  }

  @action
  fetchData() async {
    _isLoading = true;
    _error = null;

    Either<Failure, List<Patient>> result =
        await _getPatientsUsecase(_seed, _page, _results);
    result.fold((l) {
      _error = l;
    }, (r) {
      _patients.addAll(r);
    });
    _isLoading = false;
  }

  @action
  Future refreshList() async {
    _page = 1;
    _patients.clear();
    await fetchData();
  }

  @action
  Future loadNextPage() async {
    _page++;
    await fetchData();
  }
}
