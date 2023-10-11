//lib/screens/discover.dart
import 'package:flutter/material.dart';

class DiscoverScreen extends StatefulWidget {
  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  Widget categoriesContainer({required String image, required String name}) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10),
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(image),
            ),
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const SizedBox(
          height: 10,
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Theme.of(context).primaryColor,
              height: 200,
              child: Padding(
                padding: const EdgeInsets.only(top: 70, left: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey,
                          ),
                          width: 50,
                          height: 50,
                          child: Center(child: Text('AA')),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Deliver to Current Location',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
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
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              Colors.white, // Set the background color to white
                          borderRadius:
                              BorderRadius.circular(10), // Add rounded corners
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16), // Add padding to the container
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
                        width: 375,
                        height: 160,
                        child: const Card(
                          color: Colors.orangeAccent,
                          child: Center(child: Text('DISCOVER MEAL PLANS')),
                        ),
                      ),
                      Container(
                        width: 375,
                        height: 160,
                        child: const Card(
                          color: Colors.blueAccent,
                          child: Center(
                            child: Text('TRY TRENDING ITEMS'),
                          ),
                        ),
                      ),
                      Container(
                        width: 375,
                        height: 160,
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
                          onPressed: () {},
                          child: Text('Button 1'),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('Button 2'),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('Button 3'),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('Button 4'),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('Button 5'),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('Button 6'),
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
