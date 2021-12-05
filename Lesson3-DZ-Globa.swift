//
//  main.swift
//  Dz2_GlobaVS
//
//  Created by Владимир Глоба on 27.11.2021.
//
// Домашнее задание №3

import Foundation

enum EngineStatus {
    case on, off
}

enum WindowsStatus {
    case opened, closed
}

enum TrunkStatus {
    case load (with: Int)
    case unload (with: Int)
}

enum TuningHorsepower {
    case increase (with: Int)
    case decrease (with: Int)
}

enum TrailerStatus {
    case attached, unattached
}

struct SportsCar {
    let brandNameAuto : String
    let manufacturerCounty : String
    let manufactureYear : Int
    var currentPower : Int
    var engine : EngineStatus = .off
    var windows:  WindowsStatus = .closed
    var color : String
    var trunkVolumeMax : Int
    var trunkVolumeUsed = 0
    
    mutating func switchColor (color : String) {
        switch color {
        case "black":
            self .color = "Черный"
            print("Автомобиль покрашен в черный цвет!")
        case "white":
            self .color = "Белый"
            print("Автомобиль покрашен в белый цвет!")
        case "red":
            self .color = "Красный"
            print("Автомобиль покрашен в красный цвет!")
        case "silver":
            self .color = "Серебристый"
            print("Автомобиль покрашен в серебристый цвет!")
        default:
            print("Доступные цвета: Черный, Белый, Красный, Серебристый")
        }
    }
    
    ///Данная функция позволяет изменять объём багажника и показывает количество свободного места.
    
    mutating func changeTrunkVolume(_ spaceInTrunk:TrunkStatus) {
        switch spaceInTrunk {
        case .load (let volume):
            if volume > (trunkVolumeMax - trunkVolumeUsed) {
                print("В автомобиле \(self .brandNameAuto) объём багажника составляет всего \(self .trunkVolumeMax) литров, не осталось свободного места.")
            } else {
                self.trunkVolumeUsed += volume
                print("В багажнике осталось \(self .trunkVolumeMax - self .trunkVolumeUsed) литров cвободного места")
            }
        case .unload (let volume):
            self .trunkVolumeUsed -= volume
            print("В багажнике осталось еще \(self .trunkVolumeUsed) литров cвободного места")
        }
    }
    
    mutating func changeEngineStatus (to status : EngineStatus) {
        self .engine = status
        switch engine {
        case .on:
            print("Двигатель автомобиля запущен!")
        case .off:
            print("Двигатель автомобиля заглушен!")
        }
    }
    
    mutating func changeWindowsStatus (to status : WindowsStatus) {
        self .windows = status
        switch windows {
        case .opened:
            print("Окна автомобиля открыты!")
        case .closed:
            print("Окна автомобиля закрыты!")
        }
    }
    
    /// Данная функция позволяет увеличивать и уменьшать мощность автомобиля.
    
    mutating func tuningHorsepower (_ carPower : TuningHorsepower) {
        switch carPower {
        case .increase (let power):
            self .currentPower += power
            print("Двигатель автомобиля форсирован! Теперь мощность составляет \(self .currentPower) лошадиных сил.")
        case .decrease (let power):
            self .currentPower -= power
            print("Двигатель автомобиля дефорсирован! Теперь мощность составляет \(self .currentPower) лошадиных сил.")
        }
    }
}

struct TrunkCar {
    let brandNameAuto : String
    let manufacturerCounty : String
    let manufactureYear : Int
    var currentPower : Int
    var engine : EngineStatus = .off
    var windows :  WindowsStatus = .closed
    var color : String
    var trunkVolumeMax : Int
    var trunkVolumeUsed = 0
    var trailer : TrailerStatus = .unattached
    
    mutating func switchColor (color : String) {
        switch color {
        case "black":
            self .color = "Черный"
            print("Грузовик покрашен в черный цвет!")
        case "white":
            self .color = "Белый"
            print("Грузовик покрашен в белый цвет!")
        case "red":
            self .color = "Красный"
            print("Грузовик покрашен в красный цвет!")
        case "silver":
            self .color = "Серебристый"
            print("Грузовик покрашен в серебристый цвет!")
        default:
            print("Грузовик цвета: Черный, Белый, Красный, Серебристый")
        }
    }
    
    ///Данная функция проверяет наличие прицепа, позволяет изменять объём багажника и показывает количество свободного места.
    
    mutating func changeTrunkVolume (trailerStatus : TrailerStatus, spaceInTrunk : TrunkStatus) {
        if trailerStatus == .unattached {
            print("Для начала погрузки необходимо присоединить прицеп!")
        } else {
            switch spaceInTrunk {
            case .load (let volume):
                if volume > (trunkVolumeMax - trunkVolumeUsed){
                    print("В грузовике \(self .brandNameAuto) объём прицепа составляет всего \(self .trunkVolumeMax) литров, не осталось свободного места.")
                } else {
                    self .trunkVolumeUsed += volume
                    print("В прицепе осталось \(self .trunkVolumeMax - self .trunkVolumeUsed) литров cвободного места")
                }
            case .unload (let volume):
                self .trunkVolumeUsed -= volume
                print("В прицепе осталось еще \(self .trunkVolumeUsed) литров cвободного места")
            }
        }
    }
    
    mutating func changeEngineStatus (to status : EngineStatus) {
        self .engine = status
        switch engine {
        case .on:
            print("Двигатель грузовика запущен!")
        case .off:
            print("Двигатель грузовика заглушен!")
        }
    }
    
    mutating func changeWindowsStatus (to status : WindowsStatus) {
        self .windows = status
        switch windows {
        case .opened:
            print("Окна грузовика открыты!")
        case .closed:
            print("Окна грузовика закрыты!")
        }
    }
    
    /// Данная функция позволяет увеличивать и уменьшать мощность автомобиля.
    
    mutating func tuningHorsepower(_ carPower : TuningHorsepower) {
        switch carPower {
        case .increase (let power):
            self .currentPower += power
            print("Двигатель грузовика форсирован! Теперь мощность составляет \(self .currentPower) лошадиных сил.")
        case .decrease (let power):
            self .currentPower -= power
            print("Двигатель грузовика дефорсирован! Теперь мощность составляет \(self .currentPower) лошадиных сил.")
        }
    }
}

// Создаем спортивный автомобиль.
var audiSportsCar = SportsCar (brandNameAuto: "Audi A7", manufacturerCounty: "Германия", manufactureYear: 2014, currentPower: 245, color: "Черный", trunkVolumeMax: 1390)

// Выводим в консоль.
// Как правильно выводить большие объёмы текста, чтобы не было нагромождения?
print("Спортивный автомобиль \(audiSportsCar .brandNameAuto) произведен в \(audiSportsCar .manufacturerCounty) в \(audiSportsCar .manufactureYear) году.")
print("Мощность двигателя составляет \(audiSportsCar .currentPower) лошадиных сил.")
print("Цвет автомобиля \(audiSportsCar .color).")
print("Максимальный объём багажника составляет \(audiSportsCar .trunkVolumeMax) литров, свободно еще \(audiSportsCar .trunkVolumeMax - audiSportsCar .trunkVolumeUsed) литров.")
print("Текущее состояние окон: \(audiSportsCar .windows).")

// Тюнингуем автомобиль, заводим и открываем окна
print("")
print("-= Производим тюнинг автомобиля =-")

audiSportsCar .switchColor (color: "red")
audiSportsCar .changeEngineStatus (to: .on)
audiSportsCar .changeWindowsStatus (to: .opened)
audiSportsCar .changeTrunkVolume (.load (with: 1200))
audiSportsCar .tuningHorsepower (.increase (with: 240))

print("-= Тюнинг автомобиля завершён =-")


// Создаем грузовой автомобиль
var freightlinerTrunkCar = TrunkCar (brandNameAuto: "Freightliner", manufacturerCounty: "США", manufactureYear: 2020, currentPower: 322, color: "Желтый", trunkVolumeMax: 11000)

// Выводим в консоль
print("")
print("Второй автомобиль:")
print("Тягач \(freightlinerTrunkCar .brandNameAuto) произведен в \(freightlinerTrunkCar .manufacturerCounty) в \(freightlinerTrunkCar .manufactureYear) году.")
print("Мощность двигателя составляет \(freightlinerTrunkCar .currentPower) лошадиных сил.")
print("Цвет грузовика \(freightlinerTrunkCar .color).")
print("Максимальный объём прицепа составляет \(freightlinerTrunkCar .trunkVolumeMax) литров")
print("Текущее состояние прицепа: \(freightlinerTrunkCar .trailer).")

//Производим изменения
print("")
print("-= Производим изменения =-")

freightlinerTrunkCar .switchColor(color: "silver")
//кейс:забыли присоединить прицеп
freightlinerTrunkCar .changeTrunkVolume(trailerStatus: .unattached, spaceInTrunk: .load(with: 6000))
//присоединяем и нагружаем
freightlinerTrunkCar .changeTrunkVolume(trailerStatus: .attached, spaceInTrunk: .load(with: 6000))
//заведем движок, добавим лошадей и поехали!
freightlinerTrunkCar .changeEngineStatus(to: .on)
freightlinerTrunkCar .tuningHorsepower(.increase(with: 150))

print("-= Изменения завершены. Поехали! =-")
print("")
