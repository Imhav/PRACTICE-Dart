// Enum for City
enum City { SR, BB, Kep, PP, KP, OTHER }

// Enum for Skills
enum Skill { 
  FLUTTER, 
  DART, 
  PHP, 
  PYTHON, 
  HTML, 
  CSS, 
  JAVASCRIPT, 
  OTHER 
}

// Address class with city as enum
class Address {
  final String street;
  final City city;
  final String zipCode;

  Address({required this.street, required this.city, required this.zipCode});

  @override
  String toString() => '$street, $city, $zipCode';
}

// Employee class
class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skills;
  final Address _address;
  final int _yearsOfExperience;
  final String _role;

  // Constructor for mobile developer
  Employee.mobileDeveloper({
    required String name,
    required Address address,
    required int yearsOfExperience,
  })  : _name = name,
        _baseSalary = 40000,
        _skills = [Skill.FLUTTER, Skill.DART],
        _address = address,
        _yearsOfExperience = yearsOfExperience,
        _role = 'Mobile Developer';

  // Constructor for web designer
  Employee.webDesigner({
    required String name,
    required Address address,
    required int yearsOfExperience,
  })  : _name = name,
        _baseSalary = 45000,
        _skills = [Skill.HTML, Skill.CSS, Skill.JAVASCRIPT],
        _address = address,
        _yearsOfExperience = yearsOfExperience,
        _role = 'Web Designer';

  // Method to compute total salary
  double computeSalary() {
    double salary = _baseSalary + (_yearsOfExperience * 2000);
    for (var skill in _skills) {
      salary += {
        Skill.FLUTTER: 5000,
        Skill.DART: 3000,
        Skill.PHP: 4000,
        Skill.PYTHON: 3500,
        Skill.HTML: 2000,
        Skill.CSS: 1500,
        Skill.JAVASCRIPT: 2500,
        Skill.OTHER: 1000,
      }[skill]!;
    }
    return salary;
  }

  // Override toString to display employee details
  @override
  String toString() {
    return 'Role: $_role\n'
           'Employee: $_name\n'
           'Base Salary: \$$_baseSalary\n'
           'Skills: ${_skills.map((skill) => skill.name).join(', ')}\n'
           'Address: $_address\n'
           'Years of Experience: $_yearsOfExperience\n'
           'Total Salary: \$${computeSalary()}\n';
  }
}

void main() {
  // Create Address instances
  var address1 = Address(street: '12101 St', city: City.PP, zipCode: '120801');
  var address2 = Address(street: '123 St', city: City.BB, zipCode: '120901');

  // Use named constructors for mobile developer and web designer
  var mobileDev = Employee.mobileDeveloper(name: 'Sokea', address: address1, yearsOfExperience: 5);
  var webDesigner = Employee.webDesigner(name: 'Ronan', address: address2, yearsOfExperience: 7);

  // Print employee details
  print(mobileDev);
  print(webDesigner);
}
