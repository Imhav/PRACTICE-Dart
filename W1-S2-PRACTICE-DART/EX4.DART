void main() {
  const pizzaPrices = {
    'pepperoni': 7.5,
    'vegetarian': 6.5,
    'margherita': 5.5,
  };

  const order = ['margherita', 'pepperoni'];
  
  double total = 0;
  bool isNotOnMenu = false;

  for (var pizza in order) {
    if (pizzaPrices.containsKey(pizza)) {
      double price = pizzaPrices[pizza]!;
      total += price;
    } else {
      print('$pizza pizza is not on the menu');
      isNotOnMenu = true;
    }
  }

  if (!isNotOnMenu) {
    print('Total: \$${total.toStringAsFixed(0)}');
  }
}
