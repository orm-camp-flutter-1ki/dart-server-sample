class Subway {
  String name;
  int price;
  String bread;
  String meat;
  List<String> vegetables;
  List<String> sauces;

  void printSubway() {
    print('Name: $name');
    print('Price: $price');
    print('Bread: $bread');
    print('Meat: $meat');
    print('Vegetables: $vegetables');
    print('Sauces: $sauces');
  }

//<editor-fold desc="Data Methods">
  Subway({
    required this.name,
    required this.price,
    required this.bread,
    required this.meat,
    required this.vegetables,
    required this.sauces,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Subway &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          price == other.price &&
          bread == other.bread &&
          meat == other.meat &&
          vegetables == other.vegetables &&
          sauces == other.sauces);

  @override
  int get hashCode =>
      name.hashCode ^
      price.hashCode ^
      bread.hashCode ^
      meat.hashCode ^
      vegetables.hashCode ^
      sauces.hashCode;

  @override
  String toString() {
    return 'Subway{' +
        ' name: $name,' +
        ' price: $price,' +
        ' bread: $bread,' +
        ' meat: $meat,' +
        ' vegetables: $vegetables,' +
        ' sauces: $sauces,' +
        '}';
  }

  Subway copyWith({
    String? name,
    int? price,
    String? bread,
    String? meat,
    List<String>? vegetables,
    List<String>? sauces,
  }) {
    return Subway(
      name: name ?? this.name,
      price: price ?? this.price,
      bread: bread ?? this.bread,
      meat: meat ?? this.meat,
      vegetables: vegetables ?? this.vegetables,
      sauces: sauces ?? this.sauces,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'price': this.price,
      'bread': this.bread,
      'meat': this.meat,
      'vegetables': this.vegetables,
      'sauces': this.sauces,
    };
  }

  factory Subway.fromMap(Map<String, dynamic> map) {
    return Subway(
      name: map['name'] as String,
      price: map['price'] as int,
      bread: map['bread'] as String,
      meat: map['meat'] as String,
      vegetables: map['vegetables'] as List<String>,
      sauces: map['sauces'] as List<String>,
    );
  }

//</editor-fold>
}