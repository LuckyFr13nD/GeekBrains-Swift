//
//  main.swift
//  L1_GlobaVS_DZ
//
//  Created by Владимир Глоба on 19.11.2021.
//

import Foundation

//1. Квадратное уравнение

//let numberOne:Double = 1 // 1 (d=0); 1 (d>0);
//let numberTwo:Double = -8 // -6 (d=0; -8 (d>0);
//let numberThree:Double = 12 // 9 (d=0); 12 (d>0);
//let x1:Double
//let x2:Double
//var diskriminant:Double
//
//if (numberOne==0) {
//    if (numberTwo==0) {
//        print ("Это не уравнение вообще")
//    } else {
//        let x1 = -(numberThree) / numberTwo
//        print(x1)
//    }
//} else {
//diskriminant = pow(numberTwo,2) - (4 * numberOne * numberThree) // pow(,) - квадрат числа
//if (diskriminant >= 0) {
//    diskriminant = sqrt(diskriminant) // sqrt() - корень из числа
//    x1 = (-numberTwo + diskriminant) / (2 * numberOne)
//    x2 = (-numberTwo - (diskriminant)) / (2 * numberOne)
//    print (x1, x2)
//} else {
//    print("Дискриминант равен:")
//    print(diskriminant)
//    print("Дискриминант < 0, нет корней")
//}
//}
//2. Найти площадь, периметр и гипотенузу прямоугольного треугольника, если даны катеты.

//let katetOne:Double = 3
//let katetTwo:Double = 6
//let squareTriangle = (katetOne*katetTwo)/2
//let gipotenuzaTriangle = sqrt(pow(katetOne,2)+pow(katetTwo,2))
//let perimetrTriangle = katetOne + katetTwo + gipotenuzaTriangle
//
//print("Площадь треугольника равна",squareTriangle)
//print("Гипотенуза треугольника равна",gipotenuzaTriangle)
//print("Периметр треугольника равен",perimetrTriangle)

//3. Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.
//
//var deposit:Double = 1000
//var yearPercent:Double = 20
//var years:Int = 5
//var yearsDepositSimple:Double
//
////простой процент
//yearPercent = yearPercent/100
//yearsDepositSimple = deposit + (deposit * yearPercent * Double(years))
//
//print("По математике простого процента, сумма составит: " + String(yearsDepositSimple))
//
////сложный процент
//var yearOneDeposit = deposit + (deposit * yearPercent)
//var yearTwoDeposit = yearOneDeposit + (yearOneDeposit*yearPercent)
//var yearThreeDeposit = yearTwoDeposit + (yearTwoDeposit*yearPercent)
//var yearFourDeposit = yearThreeDeposit + (yearThreeDeposit*yearPercent)
//var yearFiveDeposit = yearFourDeposit + (yearFourDeposit*yearPercent)
//
//var yearsDepositHard = [yearOneDeposit, yearTwoDeposit,yearThreeDeposit, yearFourDeposit, yearFiveDeposit]
//
//print("По математике сложного процента, сумма составит: " + String(yearsDepositHard[years-1]))

