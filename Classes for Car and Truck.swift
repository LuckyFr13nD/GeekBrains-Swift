import Foundation


class Car {
    
    enum Engine: String {
        case on = "Заведен"
        case off = "Заглушен"
    }
    
    enum Windows: String {
        case opened = "Открыты"
        case closed = "Закрыты"
    }
    
    enum Trunk {
        case load (with: Int)
        case unload (with: Int)
    }
    
    enum Power {
        case increase (with: Int)
        case decrease (with: Int)
    }
    
    fileprivate let carModel: String
    fileprivate let countryOfManufacture: String
    fileprivate let yearOfManufacture: Int
    fileprivate var engine: Engine = .off
    fileprivate var windows:  Windows = .closed
    fileprivate var colorOfCar: String
    fileprivate var powerOfCar: Int
    fileprivate var trunkVolumeMax: Int
    fileprivate var trunkVolumeUsed = 0
    
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
    
    func printAboutTheCar() {
        
        print("Автомобиль \(self.carModel) произведен в \(self.yearOfManufacture) году в \(self.countryOfManufacture).")
        print("Его мощность составляет \(self.powerOfCar) лошадиных сил.")
        print("Объём багажника \(self.trunkVolumeMax) литров.")
        print("На текущий момент его двигатель \(self.engine.rawValue) и окна \(self.windows.rawValue).")
        print()
    }
    
    func switchColor(colorOfCar: String) {
        
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
    
    func changeTrunkVolume(_ spaceInTrunk: Trunk) {
        
        switch spaceInTrunk {
            
        case.load (let volume):
            
            print("Попытка загрузить \(volume) литров груза.")
            
            if volume > (trunkVolumeMax - trunkVolumeUsed) {
                
                print("Объём багажника составляет всего \(self.trunkVolumeMax) литров, нет свободного места.")
                
            } else {
                
                self.trunkVolumeUsed += volume
                print("Груз успешно загружен.")
                print("Осталось \(self.trunkVolumeMax - self.trunkVolumeUsed) литров cвободного места.")
            }
            
        case.unload (let volume):
            print("Попытка выгрузить \(volume) литров груза.")
            
            if volume > trunkVolumeUsed {
                
                print("В багажнике находится всего \(volume) литров груза.")
                
            } else {
                
                self .trunkVolumeUsed -= volume
                print("Груз успешно выгружен.")
                print("Осталось \(self.trunkVolumeMax - self.trunkVolumeUsed) литров cвободного места.")
                
            }
        }
    }
    
    func switchEngine (to status: Engine) {
        
        engine = status
        switch engine {
            
        case.on:
            print("Двигатель автомобиля запущен!")
            
        case.off:
            print("Двигатель автомобиля заглушен!")
            
        }
    }
    
    func switchWindows (to status: Windows) {
        
        windows = status
        switch windows {
            
        case.opened:
            print("Окна автомобиля открыты!")
            
        case.closed:
            print("Окна автомобиля закрыты!")
            
        }
    }
    
    func switchCarPower (_ power: Power) {
        
        switch power {
            
        case.increase (let power):
            powerOfCar += power
            print("Мощность автомобиля увеличена на \(self.powerOfCar) лошадиных сил.")
            
        case.decrease (let power):
            powerOfCar -= power
            print("Мощность автомобиля уменьшена на\(self.powerOfCar) лошадиных сил.")
            
        }
    }
}

final class TrunkCar: Car {
    
    enum Trailer{
        case attached
        case unattached
    }
    
    fileprivate var trailer: Trailer = .unattached
    
    override init(carModel: String,
                  countryOfManufacture: String,
                  yearOfManufacture: Int,
                  powerOfCar: Int,
                  colorOfCar: String,
                  trunkVolumeMax: Int) {
        
        super.init(carModel: carModel,
                   countryOfManufacture: countryOfManufacture,
                   yearOfManufacture: yearOfManufacture,
                   powerOfCar: powerOfCar,
                   colorOfCar: colorOfCar,
                   trunkVolumeMax: trunkVolumeMax)
        
    }
    
    override func printAboutTheCar() {
        
        print("Автомобиль \(self.carModel) произведен в \(self.yearOfManufacture) году в \(self.countryOfManufacture).")
        print("Его мощность составляет \(self.powerOfCar) лошадиных сил.")
        print("Объём багажника \(self.trunkVolumeMax) литров.")
        print("На текущий момент его двигатель \(self.engine.rawValue) и окна \(self.windows.rawValue).")
        print()
        
    }
    
    func attachTrailer(to status: Trailer){
        trailer = status
        switch trailer {
        case .attached:
            print("Прицеп прикреплен!")
        case .unattached:
            print("Прицеп откреплен!")
        }
    }
    
    
    override func changeTrunkVolume(_ spaceInTrunk : Trunk) {
        
        if trailer == .unattached {
            
            print("Для начала погрузки необходимо присоединить прицеп!")
            
        } else {
            
            switch spaceInTrunk {
                
            case.load (let volume):
                
                print("Попытка загрузить \(volume) литров груза.")
                
                if volume > (trunkVolumeMax - trunkVolumeUsed){
                    
                    print("В грузовике \(self.carModel) объём прицепа составляет всего \(self.trunkVolumeMax) литров, не осталось свободного места.")
                    
                } else {
                    
                    self.trunkVolumeUsed += volume
                    
                    print("Груз успешно загружен.")
                    print("В прицепе осталось \(self.trunkVolumeMax - self .trunkVolumeUsed) литров cвободного места")
                }
                
            case.unload (let volume):
                
                print("Попытка выгрузить \(volume) литров груза.")
                
                if volume > trunkVolumeUsed {
                    print("Недостаточно груза для выгрузки.")
                    
                } else {
                    
                    self.trunkVolumeUsed -= volume
                    print("Груз успешно выгружен.")
                    print("В прицепе осталось еще \(self.trunkVolumeUsed) литров cвободного места")
                    
                    
                }
            }
        }
        
    }
}

var carBMW = Car(carModel: "BMW", countryOfManufacture: "German", yearOfManufacture: 1988, powerOfCar: 240, colorOfCar: "Pink", trunkVolumeMax: 250)
var trunkFreightliner = TrunkCar(carModel: "Freightliner", countryOfManufacture: "USA", yearOfManufacture: 2020, powerOfCar: 346, colorOfCar: "Black", trunkVolumeMax: 19000)
