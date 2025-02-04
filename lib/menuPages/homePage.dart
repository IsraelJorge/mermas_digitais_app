// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mermas_digitais_app/menuPages/comunicadosPage.dart';
import 'package:mermas_digitais_app/menuPages/frequenciaPage.dart';
import 'package:mermas_digitais_app/menuPages/oficinasPage.dart';
import 'package:mermas_digitais_app/menuPages/perfilPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; //default index

  final List<IconData> _widgetIcons = [
    Iconsax.home,
    Iconsax.book,
    Iconsax.chart,
    Iconsax.profile_2user,
  ];

  final List<Widget> _widgetOptions = [
    const ComunicadosPage(),
    const OficinasPage(),
    const FrequenciaPage(),
    const PerfilPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Material(
        elevation: 3,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        color: const Color.fromARGB(255, 51, 0, 67),
        child: Container(
          alignment: Alignment.center,
          height: 68,
          width: double.infinity,
          child: ListView.builder(
            itemCount: _widgetOptions.length,
            padding: const EdgeInsets.only(left: 35, top: 8, bottom: 5),
            itemBuilder: (ctx, i) => Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = i;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: AnimatedContainer(
                    curve: Curves.elasticInOut,
                    duration: const Duration(milliseconds: 250),
                    width: 42,
                    decoration: BoxDecoration(
                        border: i == _selectedIndex
                            ? const Border(
                                bottom: BorderSide(
                                    width: 1.0,
                                    color: Color.fromARGB(255, 221, 199, 248)))
                            : null),
                    child: Column(
                      children: [
                        Icon(
                          _widgetIcons[i],
                          size: 42,
                          color: i == _selectedIndex
                              ? const Color.fromARGB(255, 221, 199, 248)
                              : const Color.fromARGB(150, 221, 199, 248),
                        ),
                        const SizedBox(height: 0.1),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }
}

//OLD BOTTOM NAVBAR

      /*CustomLineIndicatorBottomNavbar(
        selectedColor: const Color.fromARGB(255, 221, 199, 248),
        unSelectedColor: const Color.fromARGB(255, 221, 199, 248),
        backgroundColor: const Color.fromARGB(255, 51, 0, 67),
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        enableLineIndicator: true,
        lineIndicatorWidth: 3,
        indicatorType: IndicatorType.Bottom,
        // gradient: LinearGradient(
        //   colors: kGradients,
        // ),

        customBottomBarItems: [
          CustomBottomBarItems(
            label: 'Comunicados',
            icon: Icons.home,
          ),
          CustomBottomBarItems(
            label: 'Oficinas',
            icon: Icons.account_box_outlined,
          ),
          CustomBottomBarItems(
              label: 'Frequência', icon: Icons.calendar_today_outlined),
          CustomBottomBarItems(
            label: 'Perfil',
            icon: Icons.person,
          ),
        ],
      ),*/
