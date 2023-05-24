import 'builder_with_director.dart'
    show Coffee, CoffeeBase, CoffeeMilk, CoffeeSize, CoffeeSugar, CoffeeType;

class CoffeeBuilder{
  String _name = 'k';
  CoffeeBase _base =
       CoffeeBase(CoffeeSize.regular, CoffeeType.black);
  CoffeeSugar _sugar = CoffeeSugar.white;
  CoffeeMilk _milk = CoffeeMilk.almond;

  CoffeeSugar get sugar => _sugar;
  String get name => _name;
  CoffeeMilk get milk => _milk;
  CoffeeBase get base => _base;

  void setSugar(CoffeeSugar sugar) => _sugar = sugar;
  void setMilk(CoffeeMilk milk) => _milk = milk;
  void setCoffeeBase(CoffeeBase base) => _base = base;
  void setName(String name) => _name = name;

    Coffee build() => Coffee(this);

}

class Coffee{
  late final String name;
  late final CoffeeBase base;
  late final CoffeeMilk milk;
  late final CoffeeSugar sugar;

  Coffee(CoffeeBuilder builder){
    name = builder.name;
    base = builder.base;
    milk = builder.milk;
    sugar = builder.sugar;
  }

  @override
  String toString() {
    var infoStr = 'Coffee name: $name \n';
    infoStr += base.toString();
    infoStr += 'milk:  ${milk.toString().split('.')[1]}\n';
    infoStr += 'sugar: ${sugar.toString().split('.')[1]}\n';
    return infoStr;
  }
  static CoffeeBuilder get builder => CoffeeBuilder();
}

void main (){
  var coffeeBuilder = Coffee.builder;
  coffeeBuilder
  ..setName('cappucino')
  ..setCoffeeBase(CoffeeBase(CoffeeSize.double, CoffeeType.brown))
  ..setMilk(CoffeeMilk.almond)
  ..setSugar(CoffeeSugar.white);
  var cappucino = coffeeBuilder.build();
  print(cappucino);

  print('---' * 20);
  coffeeBuilder
    ..setName('amerikano')
    ..setCoffeeBase(CoffeeBase(CoffeeSize.regular, CoffeeType.black))
    ..setMilk(CoffeeMilk.without)
    ..setSugar(CoffeeSugar.brown);
  var amerikano = coffeeBuilder.build();
  print(amerikano);

  print('---' * 20);
  var doubleAmericano = (coffeeBuilder
    ..setName('Double Amerikano')
    ..setCoffeeBase(CoffeeBase(CoffeeSize.double, CoffeeType.black))
    ..setMilk(CoffeeMilk.without)
    ..setSugar(CoffeeSugar.brown)).build();
  print(doubleAmericano);
  
}