import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaser/src/blocs/produk_bloc/fetch_bloc.dart';

import '../base/api_base.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FetchBloc _bloc = FetchBloc();

  @override
  void initState() {
    super.initState();
    _bloc.add(GetData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Data Produk'), centerTitle: true),
      body: BlocProvider(
        create: (context) => _bloc,
        child: BlocBuilder(
            bloc: _bloc,
            builder: (context, state) {
              if (state is FetchSuccess) {
                return ListView.builder(
                    itemCount: state.produk.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.white10,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 10),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 20),
                          title: Text('Produk SKU :${state.produk[index].sku} '
                              ' Stock Produk : ${state.produk[index].qty}'),
                          subtitle:
                              Text('Harga : ${state.produk[index].price}'),
                        ),
                      );
                    });
              }

              return const Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
