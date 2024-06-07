import 'package:flutter/material.dart';
import 'package:food_app/pages/food_details_page.dart';

import '../utils/food_static_data.dart';
import 'food_product_card.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  final List<String> filters = const [
    'Foods',
    'Snacks',
    'Drinks',
    'Sauces',
    'Cuisine',
    'Meal',
  ];
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  int currentPage = 0;
  List<String> pages = const ['Home', 'Share', 'Cart', 'History'];

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(211, 211, 211, 1)),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(90),
        right: Radius.circular(90),
      ),
    );

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.menu),
                    iconSize: 30,
                  ),
                  const Spacer(flex: 1),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/images/profile.png',
                      height: 50,
                      width: 50,
                    ),
                    alignment: Alignment.topRight,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Text(
                'Delicious\nfood for you',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 30),
              const TextField(
                decoration: InputDecoration(
                  fillColor: Color.fromRGBO(220, 218, 218, 1.0),
                  filled: true,
                  hintText: 'Search',
                  hintStyle: TextStyle(
                      color: Color.fromRGBO(106, 106, 106, 1.0), fontSize: 20),
                  prefixIcon: Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 8, 0),
                    child: Icon(
                      Icons.search,
                      size: 30,
                    ),
                  ),
                  border: border,
                  enabledBorder: border,
                  focusedBorder: border,
                ),
              ),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  itemCount: filters.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final filter = filters[index];

                    return Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedFilter = filter;
                          });
                        },
                        child: Chip(
                          surfaceTintColor: selectedFilter == filter
                              ? Theme.of(context).colorScheme.primary
                              : Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          side: const BorderSide(color: Colors.white),
                          elevation: 10,
                          label: Text(filter),
                          labelStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: selectedFilter == filter
                                ? Colors.red
                                : Colors.grey,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('see more'),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final foodItem = products[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return ItemDetail(item: foodItem);
                            },
                          ),
                        );
                      },
                      child: ProductCard(
                        image: foodItem['imageUrl'] as String,
                        title: foodItem['title'] as String,
                        price: foodItem['price'] as int,
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPage,
          onTap: (value) {
            setState(() {
              currentPage = value;
            });
          },
          iconSize: 30,
          elevation: 0,
          selectedFontSize: 0,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
              tooltip: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.send),
              label: '',
              tooltip: 'Share',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: '',
              tooltip: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: '',
              tooltip: 'History',
            ),
          ],
        ),
      ),
    );
  }
}
