import 'models.dart';

String? defaultImageFor(PartCategory category) {
  switch (category) {
    case PartCategory.cpu:
      return 'https://cdn-icons-png.freepik.com/512/9872/9872447.png?ga=GA1.1.1521886003.1755247158';
    case PartCategory.mainboard:
      return 'https://img.icons8.com/color/48/motherboard.png';
    case PartCategory.gpu:
      return 'https://img.icons8.com/color/48/vga.png';
    case PartCategory.memory:
      return 'https://cdn-icons-png.freepik.com/512/15639/15639056.png?ga=GA1.1.1521886003.1755247158';
    case PartCategory.storage:
      return 'https://img.icons8.com/color/48/hdd.png';
    case PartCategory.m2:
      return 'https://img.icons8.com/color/48/ssd.png';
    case PartCategory.casePc:
      return 'https://img.icons8.com/color/48/desktop.png';
    case PartCategory.psu:
      return 'https://cdn-icons-png.freepik.com/512/2507/2507427.png?ga=GA1.1.1521886003.1755247158';
    case PartCategory.cpuCooler:
      return 'https://img.icons8.com/color/48/fan.png';
    case PartCategory.monitor:
      return 'https://img.icons8.com/color/48/monitor.png';
    case PartCategory.keyboard:
      return 'https://img.icons8.com/color/48/keyboard.png';
    case PartCategory.mouse:
      return 'https://img.icons8.com/color/48/mouse.png';
  }
}


