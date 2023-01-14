import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yukparkir/delegate/persistent_header.dart';
import 'package:yukparkir/utils/components/constans.dart';
import 'package:yukparkir/views/poin/poin_provider.dart';

class PoinPage extends StatefulWidget {
  const PoinPage({super.key});

  @override
  State<PoinPage> createState() => _PoinPageState();
}

class _PoinPageState extends State<PoinPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                backgroundColor: ColorPallete.primary,
                automaticallyImplyLeading: true,
                title: Text('Poin',
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        ?.copyWith(color: ColorPallete.white)),
              ),
              SliverPersistentHeader(
                pinned: true,
                floating: true,
                delegate: PersistentHeader(
                  minExtentHeight: 40,
                  maxExtentHeight: 50,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(0, 5), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Consumer<PoinProvider>(
                        builder: (context, provider, child) {
                      return TabBar(
                        labelPadding: const EdgeInsets.symmetric(
                          horizontal: Constans.padding,
                        ),
                        // isScrollable: true,
                        indicatorColor: ColorPallete.primary,
                        labelColor: Colors.black,
                        labelStyle: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                        unselectedLabelStyle: const TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 18),
                        tabs: provider.historyPoint
                            .map((item) => Tab(
                                  text: item.title,
                                ))
                            .toList(),
                      );
                    }),
                  ),
                ),
              ),
            ],
            body: Padding(
              padding: const EdgeInsets.all(Constans.padding / 2),
              child:
                  Consumer<PoinProvider>(builder: (context, provider, child) {
                return TabBarView(
                    children: provider.historyPoint
                        .map(
                          (item) => ListView.builder(
                            itemCount: item.listPoin.length,
                            itemBuilder: (context, index) {
                              final history = item.listPoin[index];
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                      title: Text(history.dateToString),
                                      subtitle: Text(history.timeToString),
                                      trailing: Text('${history.points} Poin',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5
                                              ?.copyWith(
                                                color: ColorPallete.semiBlue,
                                              )),
                                      minVerticalPadding: 0,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 10),
                                      visualDensity: const VisualDensity(
                                          horizontal: 0, vertical: -4)),
                                  Divider(
                                    color: Colors.black.withOpacity(0.5),
                                  )
                                ],
                              );
                            },
                          ),
                        )
                        .toList());
              }),
            ),
          ),
        ),
      ),
    );
  }
}
