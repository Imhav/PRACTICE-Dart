class Roof {
  String shape;

  Roof(this.shape);
}

class Window {
  String placement;
  double size;
  String color;

  Window(this.placement, this.size, this.color);
}

class Door {
  String placement;
  String color;
  double size;

  Door(this.placement, this.size, this.color);
}

class House {
  String address;

  List<Roof> totalRoof = [];
  List<Window> totalWindow = [];
  List<Door> totalDoor = [];
  House(this.address);

  void addRoof(Roof newRoof) {
    this.totalRoof.add(newRoof);
  }

  void addWindow(Window newWindow) {
    this.totalWindow.add(newWindow);
  }

  void addDoor(Door newDoor) {
    this.totalDoor.add(newDoor);
  }

  void display() {
    print('House Address: $address');
    print('Design:');
    print('Windows:');
    for (var window in totalWindow) {
      print(
          'placement: ${window.placement}, size: ${window.size}, color: ${window.color}');
    }
    print('Door:');
    for (var door in totalDoor) {
      print(
          'placement: ${door.placement}, size: ${door.size}, color: ${door.color}');
    }
    print('Roof:');
    for (var roof in totalRoof) {
      print('placement: ${roof.shape}');
    }
  }
}

void main() {
  House myHouse = House('1092 CADT');

  myHouse.addRoof(Roof('rantangle'));
  myHouse.addWindow(Window('topLeft', 5, 'red'));
  myHouse.addWindow(Window('topRight', 5, 'green'));
  myHouse.addWindow(Window('bottomLeft', 5, 'red'));
  myHouse.addWindow(Window('bottomRight', 5, 'red'));
  myHouse.addDoor(Door('center', 2.5, 'Black'));

  myHouse.display();
}
