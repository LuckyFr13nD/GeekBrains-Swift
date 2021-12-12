//
//  main.swift
//  DZ7
//
//  Created by Владимир Глоба on 11.12.2021.
//

import Foundation

//MARK: -Enums and structures
enum QrCodeStatus {
    
    case haveQR
    case noQR
    
}

enum TicketMachineError: Error {
    
    case errorInventoryName
    case errorCount
    case errorCoinDeposite
    case errorNoQrCode
    
}

struct Event {
    
    let price: Int
    var count: Int
    let ticket: Ticket
    
}

struct Ticket {
    
    let name: String
}

//MARK: - TicketMachine class announcement
class TicketMachine {
    
    private var inventory = ["Romeo And Jullieta":
                                Event(price: 250, count: 0, ticket: Ticket(name: "Romeo And Jullieta")),
                             
                             "Phantom Of The Opera":
                                Event(price: 250, count: 90, ticket: Ticket(name: "Phantom Of The Opera")),
                             
                             "Evgeny Onegin":
                                Event(price: 250, count: 90, ticket: Ticket(name: "Evgeny Onegin"))]
    
    var coinDeposite = 0
    
    //MARK: - Public Methods
    func errorsPrint(_ error: Error) {
        
        switch error {
            
        case TicketMachineError.errorNoQrCode:
            print("You can't visit this event without QR-code.")
            
        case TicketMachineError.errorInventoryName:
            print("Wrong name.")
            
        case TicketMachineError.errorCount:
            print("No more tickets for sale. Please choose another event.")
            
        case TicketMachineError.errorCoinDeposite:
            print("You don't have enough coins. Insert more coins.")
            
        default:
            print(error)
            
        }
    }
    
    func sell(name: String, qrCodeStatus: QrCodeStatus) throws -> Ticket {
        
        guard qrCodeStatus == QrCodeStatus.haveQR else {
            throw TicketMachineError.errorNoQrCode }
        
        guard let ticket = inventory[name] else {
            throw TicketMachineError.errorInventoryName }
        
        guard ticket.count > 0 else {
            throw TicketMachineError.errorCount }
        
        guard ticket.price < coinDeposite else {
            throw TicketMachineError.errorCoinDeposite }
        
        
        coinDeposite -= ticket.price
        
        var newTicket = ticket
        newTicket.count -= 1
        inventory[name] = newTicket
        print("Выдан билет \(ticket)")
        return newTicket.ticket
        
    }
}

//MARK: -Test zone
let machine = TicketMachine()

machine.coinDeposite = 500


do {
    
    let ticket = try machine.sell(name: "Romeo And Jullieta", qrCodeStatus: .haveQR)
    
    print(ticket.name)
    print("Остаток на счету: \(machine.coinDeposite) рублей")
    
} catch let error {
    
    machine.errorsPrint(error)
    
}


