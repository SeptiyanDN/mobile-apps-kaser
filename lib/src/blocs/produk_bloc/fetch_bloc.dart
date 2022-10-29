import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kaser/src/model/produk.dart';

import '../../repository/repo_produk.dart';

part 'fetch_event.dart';
part 'fetch_state.dart';

class FetchBloc extends Bloc<FetchEvent, FetchState> {
  FetchBloc() : super(FetchInitial()) {
    final RepositoryFetchData _repo_fetch = RepositoryFetchData();
    on<FetchEvent>((event, emit) async {
      List<Produk> produk = await _repo_fetch.FetchProduk();
      emit(FetchSuccess(produk));
    });
  }
}
