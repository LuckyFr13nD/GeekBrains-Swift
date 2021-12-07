//
//  main.swift
//  lesson5_dz5
//
//  Created by Владимир Глоба on 07.12.2021.
//

var carBMW = Car(carModel: "BMW",
                 countryOfManufacture: "Германия",
                 yearOfManufacture: 1988,
                 powerOfCar: 240,
                 colorOfCar: "Розовый",
                 trunkVolumeMax: 250)

print(carBMW)

carBMW.changeTrunkVolume(.load(with: 15))
carBMW.switchWindows(to: .opened)
carBMW.switchEngine(to: .on)
carBMW.switchColor(colorOfCar: "black")
carBMW.switchPower(.increase(with: 60))

print()


var trunkFreightliner = TrunkCar(carModel: "Freightliner",
                                 countryOfManufacture: "США",
                                 yearOfManufacture: 2020,
                                 powerOfCar: 346,
                                 colorOfCar: "Черный",
                                 trunkVolumeMax: 19000)

print(trunkFreightliner)

trunkFreightliner.switchEngine(to: .on)
trunkFreightliner.attachTrailer(to: .attached)
trunkFreightliner.changeTrunkVolume(.load(with: 1000))

