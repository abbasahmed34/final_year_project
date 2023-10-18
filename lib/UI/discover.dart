//lib/screens/discover.dart
import 'package:flutter/material.dart';

class DiscoverScreen extends StatefulWidget {
  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {



  Widget categoriesContainer({required String image, required String name}) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10),
          width: width * 0.16,
          height: width * 0.16,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(image),
            ),
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Text(
          name,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Theme.of(context).primaryColor,
              height: height * 0.24,
              child: Padding(
                padding: EdgeInsets.only(top: height * 0.07 , left: width * 0.04),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[400],
                          ),
                          width: width * 0.15,
                          height: width * 0.15,
                          child: const Center(child: Text('AA')),
                        ),
                        SizedBox(
                          width: width * 0.03,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Deliver to Current Location',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(
                              height: height * 0.005,
                            ),
                            const Text(
                              'Select Delivery Time Slot',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.019,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: width * 0.05),
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                          Colors.white, // Set the background color to white
                          borderRadius:
                          BorderRadius.circular(10), // Add rounded corners
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.02,
                            vertical: height * 0.002,
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            hintText: 'Search for dishes...',
                            border: InputBorder.none, // Remove the border
                            suffixIcon: Icon(Icons.search,
                                color: Colors
                                    .grey), // Customize the search icon color
                          ),
                          // Implement search logic
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'View Dish Collections',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  categoriesContainer(
                      image: 'assets/images/logo.png', name: 'Item 1'),
                  categoriesContainer(
                      image: 'assets/images/logo.png', name: 'Item 2'),
                  categoriesContainer(
                      image: 'assets/images/logo.png', name: 'Item 3'),
                  categoriesContainer(
                      image: 'assets/images/logo.png', name: 'Item 4'),
                  categoriesContainer(
                      image: 'assets/images/logo.png', name: 'Item 5'),
                  categoriesContainer(
                      image: 'assets/images/logo.png', name: 'Item 6'),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 8),
                        width: width * 0.9,
                        height: height * 0.175,
                        child: const Card(
                          color: Colors.orangeAccent,
                          child: Center(child: Text('DISCOVER MEAL PLANS')),
                        ),
                      ),
                      Container(
                        width: width * 0.9,
                        height: height * 0.175,
                        child: const Card(
                          color: Colors.blueAccent,
                          child: Center(
                            child: Text('TRY TRENDING ITEMS'),
                          ),
                        ),
                      ),
                      Container(
                        width: width * 0.9,
                        height: height * 0.175,
                        child: const Card(
                          color: Colors.deepPurpleAccent,
                          child: Center(
                            child: Text('YUMMY & TASTY ITEMS'),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Explore Dishes',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: () {
                          },
                          child: Text('Mains'),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('Sides'),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('Dessert'),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('Snack'),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('Drinks'),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        TextButton(
                          onPressed: () {

                          },
                          child: Text('Condiments'),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
