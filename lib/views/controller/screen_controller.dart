import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yukparkir/utils/components/constans.dart';
import 'package:yukparkir/views/blank_page.dart';
import 'package:yukparkir/views/dashboard/dashboard_page.dart';
import 'package:yukparkir/views/dashboard/dashboard_provider.dart';
import 'package:yukparkir/views/his/his_page.dart';
import 'package:yukparkir/views/his/his_provider.dart';
import 'package:yukparkir/views/scanner/scanner_page.dart';
import 'package:yukparkir/views/scanner/scanner_provider.dart';
import 'package:yukparkir/views/act/act_page.dart';
import 'package:yukparkir/views/act/act_provider.dart';

enum SelectedPage { home, history, scanner, profile, menu }

class ScreenController extends StatefulWidget {
  const ScreenController({Key? key}) : super(key: key);

  @override
  State<ScreenController> createState() => _ScreenControllerState();
}

class _ScreenControllerState extends State<ScreenController> {
  SelectedPage _selectedPage = SelectedPage.home;

  final double iconBig = 40;
  final double iconSmall = 30;

  late Widget currentPage;

  final List<Widget> _pages = [
    ChangeNotifierProvider(
        create: (_) => DashboardProvider(), child: const DashboardPage()),
    ChangeNotifierProvider(
        create: (_) => hisProvider(), child: const hisPage()),
    // const BlankPage(),
    ChangeNotifierProvider(
        create: (_) => ScannerViewModel(), child: const ScannerPage()),
    const BlankPage(),
    const BlankPage(),
  ];

  void navigatePage(SelectedPage page) {
    setState(() {
      _selectedPage = page;
      currentPage = _pages[SelectedPage.values.indexOf(page)];
    });
  }

  @override
  void initState() {
    currentPage = _pages[0];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: currentPage,
        floatingActionButton: SizedBox(
          height: 80,
          width: 80,
          child: FloatingActionButton(
            onPressed: () => navigatePage(SelectedPage.scanner),
            child: const Icon(
              Icons.qr_code_scanner_sharp,
              size: 50,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          color: ColorPallete.primary,
          child: SizedBox(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      GestureDetector(
                        onTap: () => navigatePage(SelectedPage.home),
                        child: Icon(
                          Icons.home,
                          color: ColorPallete.white,
                          size: _selectedPage == SelectedPage.home
                              ? iconBig
                              : iconSmall,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => navigatePage(SelectedPage.history),
                        child: Icon(
                          Icons.history,
                          color: ColorPallete.white,
                          size: _selectedPage == SelectedPage.history
                              ? iconBig
                              : iconSmall,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => navigatePage(SelectedPage.profile),
                        child: Icon(
                          Icons.person,
                          color: ColorPallete.white,
                          size: _selectedPage == SelectedPage.profile
                              ? iconBig
                              : iconSmall,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => navigatePage(SelectedPage.menu),
                        child: Icon(
                          Icons.menu,
                          color: ColorPallete.white,
                          size: _selectedPage == SelectedPage.menu
                              ? iconBig
                              : iconSmall,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
