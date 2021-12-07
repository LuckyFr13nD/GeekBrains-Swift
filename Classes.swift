//
//  Classes.swift
//  lesson5_dz5
//
//  Created by Владимир Глоба on 07.12.2021.
//

import Foundation

// MARK: - TCar class announcement
class Car: CarProtocol {
    
    //MARK: - Private properties
    var carModel: String
    var countryOfManufacture: String
    var yearOfManufacture: Int
    var engine: Engine
    var windows: Windows
    var trunkVolumeMax: Int
    var trunkVolumeUsed: Int
    var colorOfCar: String
    
    var powerOfCar: Int
    
    //MARK: - Initialisation
    init(carModel: String,
         countryOfManufacture: String,
         yearOfManufacture: Int,
         powerOfCar: Int,
         colorOfCar: String,
         trunkVolumeMax: Int) {
        
        self.carModel = carModel
        self.countryOfManufacture = countryOfManufacture
        self.yearOfManufacture = yearOfManufacture
        self.powerOfCar = powerOfCar
        self.trunkVolumeMax = trunkVolumeMax
        self.colorOfCar = colorOfCar
        self.engine = .off
        self.windows = .closed
        self.trunkVolumeMax = trunkVolumeMax
        self.trunkVolumeUsed = 0
        
    }
    
    //MARK: - Method switchPower
    func switchPower(_ power: Power) {
        
        switch power {
            
        case .increase (let power):
            powerOfCar += power
            print("Мощность автомобиля увеличена на \(power) и составляет \(powerOfCar) лошадиных сил.")
            
        case .decrease (let power):
            powerOfCar -= power
            print("Мощность автомобиля уменьшена на \(power) и составляет \(powerOfCar) лошадиных сил.")
            
        }
    }
}

// MARK: - TrunkCar class announcement
final class TrunkCar: CarProtocol {
    
    //MARK: - Private properties
    var carModel: String
    var countryOfManufacture: String
    var yearOfManufacture: Int
    var engine: Engine
    var windows: Windows
    var trunkVolumeMax: Int
    var trunkVolumeUsed: Int
    var colorOfCar: String
    
    var trailer: Trailer = .unattached
    
    //MARK: - Initialisation
    init(carModel: String,
         countryOfManufacture: String,
         yearOfManufacture: Int,
         powerOfCar: Int,
         colorOfCar: String,
         trunkVolumeMax: Int) {
        
        self.carModel = carModel
        self.countryOfManufacture = countryOfManufacture
        self.yearOfManufacture = yearOfManufacture
        self.trunkVolumeMax = trunkVolumeMax
        self.colorOfCar = colorOfCar
        self.engine = .off
        self.windows = .closed
        self.trunkVolumeMax = trunkVolumeMax
        self.trunkVolumeUsed = 0
        
    }
    
    //MARK: - Method attachTrailer
    func attachTrailer(to status: Trailer){
        
        trailer = status
        switch trailer {
        case .attached:
            print("Прицеп прикреплен!")
        case .unattached:
            print("Прицеп откреплен!")
            
        }
    }
    
    //MARK: - Method changeTrunkVolume
    func changeTrunkVolume(_ spaceInTrunk : Trunk) {
        
        if trailer == .unattached {
            
            print("Для начала погрузки необходимо присоединить прицеп!")
            
        } else {
            
            switch spaceInTrunk {
                
            case .load (let volume):
                
                print("Попытка загрузить \(volume) литров груза.")
                
                if volume > (trunkVolumeMax - trunkVolumeUsed){
                    
                    print("В грузовике \(carModel) объём прицепа составляет всего \(trunkVolumeMax) литров, не осталось свободного места.")
                    
                } else {
                    
                    trunkVolumeUsed += volume
                    
                    print("Груз успешно загружен.")
                    print("В прицепе осталось \(trunkVolumeMax - trunkVolumeUsed) литров cвободного места")
                }
                
            case .unload (let volume):
                
                print("Попытка выгрузить \(volume) литров груза.")
                
                if volume > trunkVolumeUsed {
                    print("Недостаточно груза для выгрузки.")
                    
                } else {
                    
                    trunkVolumeUsed -= volume
                    print("Груз успешно выгружен.")
                    print("В прицепе осталось еще \(trunkVolumeUsed) литров cвободного места")
                    
                }
            }
        }
    }
}
