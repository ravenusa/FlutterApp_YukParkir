import 'package:flutter/material.dart';
import 'package:yukparkir/utils/components/constans.dart';
import 'package:yukparkir/utils/globalwidgets/rounded_text_field.dart';
import 'package:yukparkir/views/controller/screen_controller.dart';
import 'package:yukparkir/views/dashboard/dashboard_page.dart';
import 'package:yukparkir/views/login/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorPallete.primary,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icon/app_logo.png'),
            const SizedBox(height: Constans.padding),
            Text(
              'Selamat Datang',
              style: Theme.of(context).textTheme.headline1?.copyWith(
                    color: Colors.white,
                    fontSize: 28,
                  ),
            ),
            Text('Silahkan masuk untuk melanjutkan',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(color: Colors.white)),
            Container(
              margin: const EdgeInsets.all(Constans.padding),
              padding: const EdgeInsets.all(Constans.padding),
              decoration: BoxDecoration(
                color: ColorPallete.lightBlue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(children: [
                const RoundedTextField(hintText: 'Email Aktif Amikom'),
                const SizedBox(height: Constans.padding / 2),
                const RoundedTextField(hintText: 'Nomor Induk Mahasiswa'),
                const SizedBox(height: Constans.padding / 2),
                const RoundedTextField(hintText: 'Kata Sandi'),
                const SizedBox(height: Constans.padding / 2),
                const RoundedTextField(hintText: 'Nomor Plat Kendaraan'),
                const SizedBox(height: Constans.padding),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorPallete.primary,
                        minimumSize: Size(120, 50),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                      ),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const LoginPage())),
                          (route) => false,
                        );
                      },
                      child: Text(
                        'Masuk',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorPallete.semiBlue,
                        minimumSize: Size(120, 50),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                      ),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const ScreenController())),
                          (route) => false,
                        );
                      },
                      child: Text(
                        'Daftar',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
