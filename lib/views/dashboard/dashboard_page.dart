import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yukparkir/utils/components/constans.dart';
import 'package:yukparkir/views/act/act_page.dart';
import 'package:yukparkir/views/act/act_provider.dart';
import 'package:yukparkir/views/dashboard/components/dashboard_header.dart';
import 'package:yukparkir/views/dashboard/components/plate_number_card.dart';
import 'package:yukparkir/views/dashboard/components/points_card.dart';
import 'package:yukparkir/views/dashboard/dashboard_provider.dart';
import 'package:yukparkir/views/exchange/exchange_page.dart';
import 'package:yukparkir/views/exchange/exchange_provider.dart';
import 'package:yukparkir/views/poin/poin_page.dart';
import 'package:yukparkir/views/poin/poin_provider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        Consumer<DashboardProvider>(builder: (context, provider, child) {
          return DashboardHeader(greetings: provider.getGreetings());
        }),
        Consumer<DashboardProvider>(builder: (context, provider, child) {
          return SliverToBoxAdapter(
              child: PointsCard(points: provider.userModel.points));
        }),
        SliverToBoxAdapter(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChangeNotifierProvider(
                            create: (_) => PoinProvider(),
                            child: const PoinPage()),
                      ));
                },
                child: Container(
                  padding: const EdgeInsets.all(Constans.padding / 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: ColorPallete.orange,
                  ),
                  child: Image.asset('assets/icon/Coins.png'),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChangeNotifierProvider(
                            create: (_) => ExchangeProvider(),
                            child: const ExchangePage()),
                      ));
                },
                child: Container(
                  padding: const EdgeInsets.all(Constans.padding / 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: ColorPallete.orange,
                  ),
                  child: Image.asset('assets/icon/Wallet.png'),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChangeNotifierProvider(
                            create: (_) => ActProvider(),
                            child: const ActPage()),
                      ));
                },
                child: Container(
                  padding: const EdgeInsets.all(Constans.padding / 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: ColorPallete.orange,
                  ),
                  child: Image.asset('assets/icon/Bill.png'),
                ),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.all(Constans.padding / 2),
            margin: const EdgeInsets.symmetric(
                horizontal: Constans.padding * 2, vertical: Constans.padding),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10)),
            child: AspectRatio(
                aspectRatio: 1,
                child:
                    Image.asset('assets/image/person.jpg', fit: BoxFit.cover)),
          ),
        ),
        Consumer<DashboardProvider>(builder: (context, provider, child) {
          return SliverToBoxAdapter(
              child:
                  PlateNumberCard(plateNumber: provider.userModel.plateNumber));
        }),
        const SliverToBoxAdapter(
            child: SizedBox(
          height: Constans.padding * 2,
        ))
      ],
    );
  }
}
