
class Meal {
  final String mealTime, name, imagePath, kiloCaloriesBurnt, timeTaken;

  Meal({
    this.mealTime,
    this.imagePath,
    this.kiloCaloriesBurnt,
    this.name,
    this.timeTaken,
  });
}

final meals = [
  Meal(
    mealTime: "BREAKFAST 1",
    name: "EGGS",
    kiloCaloriesBurnt: "298",
    timeTaken: "10",
    imagePath: '‪lib/assets/images/eggs.jpg',
  ),
  Meal(
    mealTime: "BREAKFAST 2",
    name: "OATS",
    kiloCaloriesBurnt: "258",
    timeTaken: "20",
    imagePath: 'lib/assets/images/oats.jpg',
  ),
  Meal(
    mealTime: "LUNCH 1",
    name: "SALAD",
    kiloCaloriesBurnt: "344",
    timeTaken: "20",
    imagePath: 'lib/assets/images/chickpeasalad.jpg',
  ),
  Meal(
    mealTime: "LUNCH 2",
    name: "PANCAKES",
    kiloCaloriesBurnt: "358",
    timeTaken: "20",
    imagePath: 'lib/assets/images/pancakes.jpg',
  ),
  Meal(
    mealTime: "DINNER 1",
    name: "SPAGHETTI",
    kiloCaloriesBurnt: "628",
    timeTaken: "20",
    imagePath: 'lib/assets/images/spaghettisquash.jpg',
  ),
  Meal(
    mealTime: "DINNER 2",
    name: "VEG TACOS",
    kiloCaloriesBurnt: "640",
    timeTaken: "20",
    imagePath: 'lib/assets/images/vegtaco.jpg',
  ),
];
