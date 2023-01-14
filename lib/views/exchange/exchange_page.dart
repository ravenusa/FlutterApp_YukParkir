import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yukparkir/utils/components/constans.dart';
import 'package:yukparkir/utils/globalwidgets/rounded_text_field.dart';
import 'package:yukparkir/views/exchange/exchange_provider.dart';

class ExchangePage extends StatefulWidget {
  const ExchangePage({super.key});

  @override
  State<ExchangePage> createState() => _ExchangePageState();
}

class _ExchangePageState extends State<ExchangePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: ColorPallete.primary,
              pinned: true,
              automaticallyImplyLeading: true,
              title: Text('Barang',
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      ?.copyWith(color: ColorPallete.white)),
            ),
            const SliverToBoxAdapter(
              child: RoundedTextField(
                hintText: 'Cari Barang',
                suffixIcon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
            ),
            Consumer<ExchangeProvider>(builder: (context, provider, child) {
              return SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            provider.goodsModel[index].image,
                            height: 100,
                            width: 100,
                          ),
                          Text(
                            provider.goodsModel[index].name,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Text('${provider.goodsModel[index].price} Poin'),
                        ],
                      ),
                    );
                  },
                  childCount: provider.goodsModel.length,
                ),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250,
                  mainAxisSpacing: 15.0,
                  crossAxisSpacing: 15.0,
                  childAspectRatio: 1.2,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
