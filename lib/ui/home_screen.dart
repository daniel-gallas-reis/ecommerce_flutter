import 'package:e_commerce_flutter/ui/tabs/contract_tab.dart';
import 'package:e_commerce_flutter/ui/tabs/courses_tab.dart';
import 'package:e_commerce_flutter/ui/tabs/home_tab.dart';
import 'package:e_commerce_flutter/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController pageController = PageController();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
          pageController, selectedIndex), //_customBottomNavigationBar(),
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const Scaffold(
            body: HomeTab(),
          ),
          Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 58, 76, 128),
              centerTitle: true,
              title: const Text(
                'Cursos e Treinamentos',
                style: TextStyle(fontSize: 22),
              ),
            ),
            body: CoursesTab(),
          ),
          Scaffold(
            appBar: AppBar(
              title: const Text('Contrato de Serviço'),
              centerTitle: true,
              backgroundColor: const Color.fromARGB(255, 182, 201, 50),
              actions: [
                IconButton(onPressed: (){}, icon: const Icon(Icons.share,),),
              ],
            ),
            body: ContractTab(),
          ),
          Scaffold(
            body: Container(
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
