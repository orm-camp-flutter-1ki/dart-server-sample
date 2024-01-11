import 'subway.dart';

class DataRepository {
  Future<List<Subway>> getSubwayList() async {
    // Mock Data
    await Future.delayed(Duration(seconds: 1));

    return List.generate(
      20,
      (index) => Subway(
          name: 'name',
          price: 100,
          bread: 'bread',
          meat: 'meat',
          vegetables: [],
          sauces: []),
    );
  }
}
