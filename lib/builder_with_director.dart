
import 'package:builder_coffee/builder_without_director.dart';

enum CoffeeMilk { regular, oat, almond, without}
enum CoffeeSugar {white, brown}
enum CoffeeCinnamon { regularPortion, doublePortion}
enum CoffeeCream {low, middle, high}
enum CoffeeSize {regular, double}
enum CoffeeType {brown, black}

class CoffeeBase{
  final CoffeeType coffeeType;
  final CoffeeSize coffeeSize;

  const CoffeeBase(this.coffeeSize, this.coffeeType);

  @override
  String toString() {
    var typeStr = coffeeType.toString().split('.')[1];
    var coffeeSizeStr = coffeeSize.toString().split('.')[1];
    return 'coffee type: $typeStr & $coffeeSizeStr \n';
  }
}

class Coffee {
  String name;
  CoffeeBase typeOfCOffee;
  CoffeeSugar sugar;
 // CoffeeCinnamon cinnamon;
  CoffeeMilk milk;

  Coffee(
  {
    this.name = 'Cappucino Regular',
   // this.cinnamon = CoffeeCinnamon.regularPortion,
    this.milk = CoffeeMilk.regular,
    this.sugar = CoffeeSugar.white,
    this.typeOfCOffee = const CoffeeBase(CoffeeSize.regular, CoffeeType.brown)});

  @override
  String toString() {
    var infoStr = 'Coffee name: $name \n';
    infoStr += typeOfCOffee.toString();
    infoStr += 'milk:  ${milk.toString().split('.')[1]}\n';
    infoStr += 'sugar: ${sugar.toString().split('.')[1]}\n';
    return infoStr;
  }
}

abstract class Builder{
  void prepareCoffeeType();
  void addSugar();
  void addMilk();
  Coffee getCoffee();
}

class CappucinoCoffeeBuilder implements Builder{
 late Coffee _coffee;

  CappucinoCoffeeBuilder(){
    _coffee = Coffee(name: 'Cappucino');
  }

  @override
  void addMilk() {
    _coffee.milk = CoffeeMilk.almond;
  }

  @override
  void addSugar() {
    _coffee.sugar = CoffeeSugar.brown;
  }

  @override
  Coffee getCoffee() {
    return _coffee;
  }

  @override
  void prepareCoffeeType() {
    _coffee.typeOfCOffee = CoffeeBase(CoffeeSize.double, CoffeeType.black);
  }}


class AmerikanoCoffeeBuilder implements Builder{
   late Coffee _coffee;

  AmerikanoCoffeeBuilder(){
    _coffee = Coffee(name: 'Amerikano');
  }

  @override
  void addMilk() {
    _coffee.milk = CoffeeMilk.without;
  }

  @override
  void addSugar() {
    _coffee.sugar = CoffeeSugar.brown;
  }

  @override
  Coffee getCoffee() {
    return _coffee;
  }

  @override
  void prepareCoffeeType() {
    _coffee.typeOfCOffee = CoffeeBase(CoffeeSize.regular, CoffeeType.black);
  }}

class Director{
  Builder? _builder;

  Director([this._builder]);

  void makeCoffee(){
    assert(_builder != null, 'Oo');
    _builder?.prepareCoffeeType();
    _builder?.addMilk();
    _builder?.addMilk();
  }
}

void main(List<String> arguments){
  var director = Director();
  for(var it in <Builder>[CappucinoCoffeeBuilder(), AmerikanoCoffeeBuilder()]){
    director._builder = it;
    director.makeCoffee();
    print(it.getCoffee());
    print('---' * 20);

  }
}
