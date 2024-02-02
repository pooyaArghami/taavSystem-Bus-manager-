import 'dart:core';
import 'dart:io';

class Bus {
  final String nameBus;
  final int typeBus;
  static String typeOfBus = "";
  Map<int, String> seat = {};

  Bus({required this.nameBus, required this.typeBus}) {
    if (typeBus == 1) {
      typeOfBus = "normal";

      Map<int, String> normalSeat = Map.fromIterable(
        List.generate(44, (index) => index + 1),
        key: (item) => item,
        value: (item) => item.toString().padLeft(2, '0'),
      );
      seat.addAll(normalSeat);
    } else if (typeBus == 2) {
      typeOfBus = "vip";

      Map<int, String> vipSeat = Map.fromIterable(
        List.generate(33, (index) => index + 1),
        key: (item) => item,
        value: (item) => item.toString().padLeft(2, '0'),
      );
      seat.addAll(vipSeat);
    }
  }

  static void showSeatsOfNormalBus(Map<int, String> seat) {
    if (seat.length == 44) {
      print('''
    ${seat[1]}  ${seat[2]}      ${seat[3]}  ${seat[4]}
    ${seat[5]}  ${seat[6]}      ${seat[7]}  ${seat[8]}
    ${seat[9]}  ${seat[10]}      ${seat[11]}  ${seat[12]}
    ${seat[13]}  ${seat[14]}      ${seat[15]}  ${seat[16]}  
    ${seat[17]}  ${seat[18]}      ${seat[19]}  ${seat[20]}
    ${seat[21]}  ${seat[22]}
    ${seat[23]}  ${seat[24]}
    ${seat[25]}  ${seat[26]}      ${seat[27]}  ${seat[28]}
    ${seat[29]}  ${seat[30]}      ${seat[31]}  ${seat[32]}
    ${seat[33]}  ${seat[34]}      ${seat[35]}  ${seat[36]}
    ${seat[37]}  ${seat[38]}      ${seat[39]}  ${seat[40]}
    ${seat[41]}  ${seat[42]}      ${seat[43]}  ${seat[44]}
          ''');
    } else {
      print('''
    ${seat[1]}      ${seat[2]}  ${seat[3]} 
    ${seat[4]}      ${seat[5]}  ${seat[6]} 
    ${seat[7]}      ${seat[8]}  ${seat[9]} 
    ${seat[10]}      ${seat[11]}  ${seat[12]} 
    ${seat[13]}      ${seat[14]}  ${seat[15]}
    ${seat[16]}
    ${seat[17]}
    ${seat[18]} 
    ${seat[19]}      ${seat[20]}  ${seat[21]} 
    ${seat[22]}      ${seat[23]}  ${seat[24]}
    ${seat[25]}      ${seat[26]}  ${seat[27]}
    ${seat[28]}      ${seat[29]}  ${seat[30]}
          ''');
    }
  }

  @override
  String toString() {
    if (typeBus == 1) {
      return " $nameBus in type of normal is available \n";
    } else {
      return "  $nameBus in type of vip is available \n";
    }
  }
}

class Terminal {
  // final List<Bus> myBusList;

  static List<Bus> normalList = [];
  static List<Bus> vipList = [];
  static List<Bus> allBusList = [];

  static void add_bus(Bus bus) {
    if (bus.typeBus == 1) {
      normalList.add(bus);
      allBusList.add(bus);
    } else if (bus.typeBus == 2) {
      vipList.add(bus);
      allBusList.add(bus);
    }
  }

  static void show_normalBus_list() {
    print(
        "------------------------------------------------------------------------------------\n ");
    print("List of all normal buses are below : ");
    for (int k = 0; k < normalList.length; k++) {
      print("${k + 1} _ ${normalList[k]}");
    }
  }

  static void show_vipBus_list() {
    print(
        "------------------------------------------------------------------------------------\n ");
    print("List of all vip buses are below : ");
    for (int z = 0; z < vipList.length; z++) {
      print("${z + 1} _ ${vipList[z]}");
    }

    print(
        "-------------------------------------------------------------------------------------\n ");
  }
}

class Travel extends Bus {
  static List<Bus> allBusesOfTravels = [];

  late final String origin;
  late final String destination;
  late final double priceTicket;

  Travel(
      {required super.nameBus,
      required super.typeBus,
      required this.origin,
      required this.destination,
      required this.priceTicket}) {
    if (super.typeBus == 1) {
      print(
          "a travel with Bus $nameBus and type ${Bus.typeOfBus} origin: $origin to destination: $destination in price $priceTicket created");
    } else if (super.typeBus == 2) {
      print(
          "a travel with Bus $nameBus and type ${Bus.typeOfBus} origin: $origin to destination: $destination in price $priceTicket created");
    }
  }

  static void showTravelList(List<Travel> myTravelList) {
    print(
        "------------------------------------------------------------------------------------\n ");
    print("List of all Travels are below : ");
    // for (int x = 0; x < myTravelList.length; x++) {
    // }
    for (int k = 0; k < myTravelList.length; k++) {
      print("${k + 1} _ ${myTravelList[k]}");
    }

    print(
        "-------------------------------------------------------------------------------------\n ");
  }

  @override
  String toString() {
    if (typeBus == 1) {
      return " $nameBus   -    type ${typeBus} ==>normal    -   origin: $origin   -   destination: $destination    -   price:  $priceTicket .\n";
    } else {
      return " $nameBus   -    type ${typeBus} ==>vip    -   origin: $origin   -   destination: $destination    -   price:  $priceTicket .\n";
    }
  }
}

class Ticket {
  late final int seatNumber;

  // static late final double income;
  //
  // static late final double customerPayment;
  // static late final double customerDemand;

  void reserveTicket(Bus bus, int seatNumber) {
    if (bus.seat.containsKey(seatNumber)) {
      bus.seat[seatNumber] = "rr";
      print("seat $seatNumber has been reserved.");
    } else {
      print("seat $seatNumber is not exists on this bus");
    }
    // customerPayment = (30/100)*priceTicket;
    // income += customerPayment;
  }
}
