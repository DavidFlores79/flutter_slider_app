import 'package:flutter/material.dart';

class IntroSlider extends StatefulWidget {
  const IntroSlider({super.key});

  @override
  State<IntroSlider> createState() => _IntroSliderState();
}

class _IntroSliderState extends State<IntroSlider> {
  final _pageController = new PageController();

  int _activePage = 0;

  final List<Widget> _pages = [
    const EachPage(color: Colors.blueGrey, title: 'First Page'),
    const EachPage(color: Colors.red, title: 'Second Page'),
    const EachPage(color: Colors.green, title: 'Last Page!'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Formulario'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // the page view
          PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _activePage = page;
              });
            },
            itemCount: _pages.length,
            itemBuilder: (BuildContext context, int index) {
              return _pages[index % _pages.length];
            },
          ),
          // Display the dots indicator
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 100,
            child: Container(
              color: Colors.black38,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: (_activePage == 0)
                        ? null
                        : () {
                            print('activePage $_activePage');

                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          },
                    child: const Text('Anterior'),
                  ),
                  const SizedBox(width: 15),
                  (_activePage == _pages.length - 1)
                      ? TextButton(
                          onPressed: () {
                            print('Enviar Formulario!!!');
                          },
                          child: const Text('Enviar Form'),
                        )
                      : TextButton(
                          onPressed: () {
                            print('activePage $_activePage');

                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          },
                          child: const Text('Siguiente'),
                        ),
                ],
                // children: List<Widget>.generate(
                //   _pages.length,
                //   (index) => Padding(
                //     padding: const EdgeInsets.symmetric(horizontal: 10),
                //     child: InkWell(
                //       onTap: () {
                //         _pageController.animateToPage(index,
                //             duration: const Duration(milliseconds: 300),
                //             curve: Curves.easeIn);
                //       },
                //       child: CircleAvatar(
                //         radius: 8,
                //         // check if a dot is connected to the activePage
                //         // if true, give it a different color
                //         backgroundColor:
                //             _activePage == index ? Colors.amber : Colors.grey,
                //       ),
                //     ),
                //   ),
                // ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Page One
class EachPage extends StatelessWidget {
  final String title;
  final Color color;

  const EachPage({super.key, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 30, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
