import 'package:final_year_project/models/food_item.dart';

class FoodData {
  static List<FoodItem> fetchFoodItems() {
    // Replace this with actual data fetching logic (e.g., from an API or database)
    return [
      FoodItem(
        imageUrl: 'https://img.freepik.com/free-photo/delicious-burger-with-many-ingredients-isolated-white-background-tasty-cheeseburger-splash-sauce_90220-1266.jpg?w=740&t=st=1694594630~exp=1694595230~hmac=841c152b8472df78f85110779c7d859fd5af4273467d9723e103fd77c56b9e18',
        name: 'King Burger',
        description: 'A mouthwatering burger with fresh ingredients.',
        price: 499,
      ),
      // Add more food items here
    ];
  }
}