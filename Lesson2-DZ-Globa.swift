//
//  main.swift
//  Less2_DZ_Globa
//
//  Created by Владимир Глоба on 23.11.2021.
//
//
import Foundation
//
// 1. Написать функцию, которая определяет, четное число или нет.

func chetnoeNumber(number: Int) -> Bool {
    number % 2 == 0 ? true : false
}

print("Написать функцию, которая определяет, четное число или нет.")
print(chetnoeNumber(number: 4))

// 2. Написать функцию, которая определяет, делится ли число без остатка на 3.

func kratnoThree(number2: Int) -> Bool {
    number2 % 3 == 0 ? true : false
}

print("Написать функцию, которая определяет, делится ли число без остатка на 3.")
print(kratnoThree(number2: 9))

// 3. Создать возрастающий массив из 100 чисел.

var array = [Int]()
var i = 0

while i < 100 {
    array.append(i + 1)
    i += 1
}
print("3. Создать возрастающий массив из 100 чисел.")
print(array)

// 4. Удалить из массива все четные числа и все числа, которые не делятся на 3

for number3 in array {
    if number3 % 2 == 0 || number3 % 3 != 0 {
        if let index = array.firstIndex(of: number3) {
        array.remove(at: index)
        }
    }
}
print("4. Удалить из массива все четные числа и все числа, которые не делятся на 3")
print(array)

// 5.* Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.
var arrayFibonacci = [1,1]

func addFibonacci (_ array: [Int]) -> [Int] {
    var arrayOne = array
    let arrayLastNumber = array.endIndex
    arrayOne.append(arrayOne[arrayLastNumber - 1] + arrayOne[arrayLastNumber - 2])
    return arrayOne;
}

for _ in (1...50) {
    arrayFibonacci = addFibonacci(arrayFibonacci)
}

print("Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.")
print(arrayFibonacci)
