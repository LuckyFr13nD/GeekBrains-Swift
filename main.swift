import Foundation

carBMW.printAboutTheCar()
carBMW.changeTrunkVolume(.load(with: 15))
carBMW.switchWindows(to: .opened)
carBMW.switchEngine(to: .on)

trunkFreightliner.printAboutTheCar()
trunkFreightliner.switchEngine(to: .on)
trunkFreightliner.attachTrailer(to: .attached)
trunkFreightliner.changeTrunkVolume(.load(with: 1000))
