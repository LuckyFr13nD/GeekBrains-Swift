//
//  Classes.swift
//  lesson5_dz5
//
//  Created by Владимир Глоба on 07.12.2021.
//

import Foundation

// MARK: - CarProtocol
protocol CarProtocol {
    
    var carModel: String { get }
    var countryOfManufacture: String { get }
    var yearOfManufacture: Int { get }
    var engine: Engine { get set }
    var windows: Windows { get set }
    var trunkVolumeMax: Int { get set }
    var trunkVolumeUsed: Int { get set }
    var colorOfCar: String { get set }
    
}

//MARK: - Extension CarProtocol
extension CarProtocol {
    
    //MARK: - Methods
    mutating func switchColor(colorOfCar: String) {
        
        switch colorOfCar {
            
        case "black":
            self.colorOfCar = "Черный"
            print("Автомобиль покрашен в черный цвет!")
            
        case "white":
            self.colorOfCar = "Белый"
            print("Автомобиль покрашен в белый цвет!")
            
        case "red":
            self.colorOfCar = "Красный"
            print("Автомобиль покрашен в красный цвет!")
            
        case "silver":
            self.colorOfCar = "Серебристый"
            print("Автомобиль покрашен в серебристый цвет!")
            
        default:
            print("Доступные цвета: Черный, Белый, Красный, Серебристый")
            
        }
    }
    
    mutating func changeTrunkVolume(_ spaceInTrunk: Trunk) {
        
        switch spaceInTrunk {
            
        case .load (let volume):
            
            print("Попытка загрузить \(volume) литров груза.")
            
            if volume > (trunkVolumeMax - trunkVolumeUsed) {
                
                print("Объём багажника составляет всего \(trunkVolumeMax) литров, нет свободного места.")
                
            } else {
                
                trunkVolumeUsed += volume
                print("Груз успешно загружен.")
                print("Осталось \(trunkVolumeMax - trunkVolumeUsed) литров cвободного места.")
                
            }
            
        case .unload (let volume):
            print("Попытка выгрузить \(volume) литров груза.")
            
            if volume > trunkVolumeUsed {
                
                print("В багажнике находится всего \(volume) литров груза.")
                
            } else {
                
                trunkVolumeUsed -= volume
                print("Груз успешно выгружен.")
                print("Осталось \(trunkVolumeMax - trunkVolumeUsed) литров cвободного места.")
                
            }
        }
    }
    
    mutating func switchEngine(to status: Engine) {
        
        engine = status
        switch engine {
            
        case .on:
            print("Двигатель автомобиля запущен!")
            
        case .off:
            print("Двигатель автомобиля заглушен!")
            
        }
    }
    
    mutating func switchWindows(to status: Windows) {
        
        windows = status
        switch windows {
            
        case.opened:
            print("Окна автомобиля открыты!")
            
        case.closed:
            print("Окна автомобиля закрыты!")
            
        }
    }
}

//MARK: - Extension Car
extension Car: CustomStringConvertible {
    
    var description: String {
        
        return String(describing: "Автомобиль \(carModel) произведен в \(yearOfManufacture) году в \(countryOfManufacture).\nОбъём багажника \(trunkVolumeMax) литров. \nНа текущий момент его двигатель \(engine.rawValue) и окна \(windows.rawValue).\n")
        
    }
}

//MARK: - Extension TrunkCar
extension TrunkCar: CustomStringConvertible {
    
    var description: String {
        
        return String(describing: "Автомобиль \(carModel) произведен в \(yearOfManufacture) году в \(countryOfManufacture).\nОбъём багажника \(trunkVolumeMax) литров. \nНа текущий момент его двигатель \(engine.rawValue) и окна \(windows.rawValue).\n")
        
    }
}
