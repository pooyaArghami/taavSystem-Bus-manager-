import 'dart:io';

import 'package:bus/DefineBus.dart';

void main() {
  List<Travel> allTravels = [];

  while (true) {
    print('''

<= *** (choose from the menu below)*** =>-------------------------

  1- Define Bus:(normal and VIP)
  2- Define travel : 
  3- Preview available trips :
  4- reserve a ticket :
  5- buy a ticket :
  6- cancel a ticket :
  7- report of the trip :
  8- exit the program :

  ----------------------------------------------------------------
  ''');
    try {
      int input = int.parse(stdin.readLineSync()!);

      if (input == 8) {
        print("\n ***  program stopped ***\n");
        break;
      } else if (input == 1) {
        while (true) {
          print("enter name of Bus :    ( cancel => enter 0 )  ");
          String nameOfBusInput = stdin.readLineSync()!;
          if (nameOfBusInput.isEmpty) {
            print(
                "you didn't enter anything .please try again.\n------------------------------\n\n");
            continue;
          }

          if (nameOfBusInput == "0") {
            break;
          }

          print(
              "enter type of Bus : (normal=> 1  , VIP=> 2) :\n choose between 1 or 2\n ( cancel => enter 0 ):\n---------------------------------------\n");
          String typeOfBusInput = stdin.readLineSync()!;
          int typeBus;
          if (typeOfBusInput == "0") {
            break;
          }

          if (typeOfBusInput.isEmpty) {
            print(
                "you didn't enter anything .please try again.\n------------------------------\n\n");
            continue;
          }

          if (int.tryParse(typeOfBusInput) != null) {
            typeBus = int.parse(typeOfBusInput);
            if (typeBus == 1 || typeBus == 2) {
              print(
                  " ***************( successfully Bus added )********************** ");
              print(" \n \n  ");
              print(
                  "______________________________________________________________________________________");

              Bus bus = Bus(nameBus: nameOfBusInput, typeBus: typeBus);
              Terminal.add_bus(bus);
            } else {
              print(
                  "********  Invalid input. enter again .\n\n-----------------------------------\n\n");
              continue;
            }
          } else {
            print(
                "********  Invalid input type of bus. enter again .\nchoose between 1 or 2 : (normal=> 1  , VIP=> 2)\n\n");
            continue;
          }
          break;
        }
      } else if (input == 2) {
        while (true) {
          print(
              "enter type of Bus : (normal=> 1  , VIP=> 2) :\n ( cancel => enter 0 )  :");
          String typeOfBusTripInput = stdin.readLineSync()!;
          int typeBusTrip;
          if (typeOfBusTripInput == "0") {
            break;
          }

          if (typeOfBusTripInput.isEmpty) {
            print(
                "**** type of bus cannot be empty. Please enter a valid String. ***\n -----------------------------");
            continue;
          }

          if (int.tryParse(typeOfBusTripInput) != null) {
            typeBusTrip = int.parse(typeOfBusTripInput);
            if (typeBusTrip == 1) {
              print(
                  "choose one of the buses : (enter number)  ( cancel => enter 0 ) ");
              Terminal.show_normalBus_list();
              String chooseBusTripInput = stdin.readLineSync()!;
              if (chooseBusTripInput == "0") {
                break;
              }

              if (chooseBusTripInput.isEmpty) {
                print(
                    "**** choose of bus cannot be empty. Please enter a valid integer. ***\n -----------------------------");
                continue;
              }

              if (int.tryParse(chooseBusTripInput) != null) {
                int chooseBusTrip = int.parse(chooseBusTripInput);
                if (chooseBusTrip > Terminal.normalList.length) {
                  print("your selected bus is not in the range of list");
                  continue;
                } else {
                  print("enter origin of Trip :    ( cancel => enter 0 )  ");
                  String origin = stdin.readLineSync()!;
                  if (origin == "0") {
                    break;
                  }
                  if (origin.isEmpty) {
                    print(
                        "you didn't enter anything .please try again.\n------------------------------\n\n");
                    continue;
                  }

                  print("enter destination of Trip : ( cancel => enter)  ");
                  String destination = stdin.readLineSync()!;
                  if (destination.isEmpty) {
                    print(
                        "you didn't enter anything .please try again.\n------------------------------\n\n");
                    continue;
                  }

                  if (destination == "0") {
                    break;
                  }

                  print(
                      "enter price of BusTicket : ( cancel => enter 0 ):\n---------------------------------------\n");
                  String priceOfBusTicket = stdin.readLineSync()!;
                  double priceOfTrip;
                  if (priceOfBusTicket.isEmpty) {
                    print(
                        "you didn't enter anything .please try again.\n------------------------------\n\n");
                    continue;
                  }

                  if (priceOfBusTicket == "0") {
                    break;
                  }
                  if (double.tryParse(priceOfBusTicket) != null) {
                    priceOfTrip = double.parse(priceOfBusTicket);

                    Travel travel1 = Travel(
                        nameBus: Terminal.normalList
                            .elementAt(chooseBusTrip - 1)
                            .nameBus,
                        typeBus: Terminal.normalList
                            .elementAt(chooseBusTrip - 1)
                            .typeBus,
                        origin: origin,
                        destination: destination,
                        priceTicket: priceOfTrip);
                    allTravels.add(travel1);
                  }
                }
              }
            } else if (typeBusTrip == 2) {
              print(
                  "choose one of the buses : (enter number)  ( cancel => enter 0 ) ");
              Terminal.show_vipBus_list();
              String chooseBusTripInput = stdin.readLineSync()!;
              if (chooseBusTripInput == "0") {
                break;
              }

              if (chooseBusTripInput.isEmpty) {
                print(
                    "**** choose of bus cannot be empty. Please enter a valid integer. ***\n -----------------------------");
                continue;
              }

              if (int.tryParse(chooseBusTripInput) != null) {
                int chooseBusTrip = int.parse(chooseBusTripInput);
                if (chooseBusTrip > Terminal.vipList.length) {
                  print("your selected bus is not in the range of list");
                  continue;
                } else {
                  print("enter origin of Trip :    ( cancel => enter 0 )  ");
                  String origin = stdin.readLineSync()!;
                  if (origin == "0") {
                    break;
                  }
                  if (origin.isEmpty) {
                    print(
                        "you didn't enter anything .please try again.\n------------------------------\n\n");
                    continue;
                  }

                  print("enter destination of Trip : ( cancel => enter)  ");
                  String destination = stdin.readLineSync()!;
                  if (destination.isEmpty) {
                    print(
                        "you didn't enter anything .please try again.\n------------------------------\n\n");
                    continue;
                  }

                  if (destination == "0") {
                    break;
                  }

                  print(
                      "enter price of BusTicket : ( cancel => enter 0 ):\n---------------------------------------\n");
                  String priceOfBusTicket = stdin.readLineSync()!;
                  double priceOfTrip;
                  if (priceOfBusTicket.isEmpty) {
                    print(
                        "you didn't enter anything .please try again.\n------------------------------\n\n");
                    continue;
                  }

                  if (priceOfBusTicket == "0") {
                    break;
                  }
                  if (double.tryParse(priceOfBusTicket) != null) {
                    priceOfTrip = double.parse(priceOfBusTicket);

                    Travel travel2 = Travel(
                        nameBus: Terminal.vipList
                            .elementAt(chooseBusTrip - 1)
                            .nameBus,
                        typeBus: Terminal.vipList
                            .elementAt(chooseBusTrip - 1)
                            .typeBus,
                        origin: origin,
                        destination: destination,
                        priceTicket: priceOfTrip);
                    allTravels.add(travel2);
                  }
                }
              }
            } else {
              print(
                  "invalid input enter between 1 (normal buses) or 2(vip buses)");
              continue;
            }
          }
        }
      } else if (input == 3) {
        while (true) {
          print(
              "Preview available trips are below: \n -----------------------------------");
          Travel.showTravelList(allTravels);
          print(
              "enter to preview the selected travel: ( cancel => enter 0 ):\n---------------------------------------\n");
          String selectPreviewInput = stdin.readLineSync()!;
          int? selectPreview;
          if (selectPreviewInput.isEmpty) {
            print(
                "you didn't enter anything .please try again.\n------------------------------\n\n");
            continue;
          }

          if (selectPreviewInput == "0") {
            break;
          }
          if (int.tryParse(selectPreviewInput) != null) {
            selectPreview = int.parse(selectPreviewInput);
          }
          if (selectPreview! > allTravels.length) {
            print("your selected input is larger than list of travels");
            continue;
          } else {
            Bus.showSeatsOfNormalBus(allTravels[selectPreview - 1].seat);
            break;
          }
        }
      } else if (input == 4) {
        while (true) {
          print(
              "Preview available trips are below: \n -----------------------------------");
          Travel.showTravelList(allTravels);
          print(
              "enter to preview the selected travel: ( cancel => enter 0 ):\n---------------------------------------\n");
          String selectPreviewInput = stdin.readLineSync()!;
          int? selectPreview;
          if (selectPreviewInput.isEmpty) {
            print(
                "you didn't enter anything .please try again.\n------------------------------\n\n");
            continue;
          }

          if (selectPreviewInput == "0") {
            break;
          }
          if (int.tryParse(selectPreviewInput) != null) {
            selectPreview = int.parse(selectPreviewInput);
          }
          if (selectPreview! > allTravels.length) {
            print("your selected input is larger than list of travels");
            continue;
          } else {
            Bus.showSeatsOfNormalBus(allTravels[selectPreview - 1].seat);
            print("\n ----------------enter a number to reserve ticket");
            String reserveTicketInput = stdin.readLineSync()!;
            int reserveTicket;
            if (reserveTicketInput.isEmpty) {
              print(
                  "you didn't enter anything .please try again.\n------------------------------\n\n");
              continue;
            }
            if (reserveTicketInput == "0") {
              break;
            }
            if (int.tryParse(reserveTicketInput) != null) {
              reserveTicket = int.parse(reserveTicketInput);

              Ticket ticket = Ticket();
              ticket.reserveTicket(Terminal.normalList[1], reserveTicket);
            }
            break;
          }
        }
        print("enter a number to reserve ticket");
      } else if (input == 1) {}
    } catch (e) {
      print("invalid input $e");
      print("Please enter again.");
      continue;
    }
  }
}
