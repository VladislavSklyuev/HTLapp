//
//  ReservationViewModel.swift
//  Hotel
//
//  Created by Владислав Склюев on 20.12.2023.
//

import Foundation

class ReservationViewModel: ObservableObject {
    @Published var reservation: Reservation?
    @Published var mail = ""
    @Published var phone: String = ""
    @Published var myPhone: String = "+7(***)***-**-**"
    @Published var i = 3
    @Published var numberPhone = ""
    
    @Published var checkTextField: [Int:[Int:String]] = [0:[0:"",1:"0",2:"0",3:"0",4:"0",5:"0",6:"0"], 1:[0:"",1:"0",2:"0",3:"0",4:"0",5:"0",6:"0"]]
    
    @Published var tourists: [Tourist] = [Tourist(showContent: true, position: "Первый турист", name: "", lastName: "", dateOfBirth: "", citizenship: "", passportNumber: "", passportDate: ""), Tourist(showContent: false, position: "Второй турист", name: "", lastName: "", dateOfBirth: "", citizenship: "", passportNumber: "", passportDate: "")]
    
    @Published var inputErrorPhone = false
    @Published var inputErrorMail = false
    @Published var inputErrorTF = false
    @Published var inputSuccessfully = false
    @Published var totalAmount: Int = 0
    
    init() {
        fetchReservation()
    }
    
    func fetchReservation() {
        Task {
            do {
                let reservation: Reservation = try await NetworkService.shared.fetchingData(url: currentURL.reservation.rawValue)
                DispatchQueue.main.async {
                    self.reservation = reservation
                    self.calculateTheTotal()
                }
            } catch {
                print(error)
            }
        }
    }
    
    func indexSearch(id: UUID) -> Int? {
        let arr = self.tourists
        if let index = arr.firstIndex(where: { $0.id == id }) {
            return index
        }
        return nil
    }
    
    func changeVisibility(id: UUID) {
        if let index = indexSearch(id: id) {
            self.tourists[index].showContent.toggle()
        }
    }
    
    func addTourist() {
        switch tourists.count {
        case 2:
            let tourist = Tourist(showContent: false, position: "Третий турист", name: "", lastName: "", dateOfBirth: "", citizenship: "", passportNumber: "", passportDate: "")
            
            self.tourists.append(tourist)
            self.checkTextField[tourists.count - 1] = [0:"",1:"0",2:"0",3:"0",4:"0",5:"0",6:"0"]
        case 3:
            let tourist = Tourist(showContent: false, position: "Четвертый турист", name: "", lastName: "", dateOfBirth: "", citizenship: "", passportNumber: "", passportDate: "")
            self.tourists.append(tourist)
            self.checkTextField[tourists.count - 1] = [0:"",1:"0",2:"0",3:"0",4:"0",5:"0",6:"0"]
        case 4:
            let tourist = Tourist(showContent: false, position: "Пятый турист", name: "", lastName: "", dateOfBirth: "", citizenship: "", passportNumber: "", passportDate: "")
            self.tourists.append(tourist)
            self.checkTextField[tourists.count - 1] = [0:"",1:"0",2:"0",3:"0",4:"0",5:"0",6:"0"]
        case 5:
            let tourist = Tourist(showContent: false, position: "Шестой турист", name: "", lastName: "", dateOfBirth: "", citizenship: "", passportNumber: "", passportDate: "")
            self.tourists.append(tourist)
            self.checkTextField[tourists.count - 1] = [0:"",1:"0",2:"0",3:"0",4:"0",5:"0",6:"0"]
        case 6:
            let tourist = Tourist(showContent: false, position: "Седьмой турист", name: "", lastName: "", dateOfBirth: "", citizenship: "", passportNumber: "", passportDate: "")
            self.tourists.append(tourist)
            self.checkTextField[tourists.count - 1] = [0:"",1:"0",2:"0",3:"0",4:"0",5:"0",6:"0"]
        case 7:
            let tourist = Tourist(showContent: false, position: "Восьмой турист", name: "", lastName: "", dateOfBirth: "", citizenship: "", passportNumber: "", passportDate: "")
            self.tourists.append(tourist)
            self.checkTextField[tourists.count - 1] = [0:"",1:"0",2:"0",3:"0",4:"0",5:"0",6:"0"]
        case 8:
            let tourist = Tourist(showContent: false, position: "Девятый турист", name: "", lastName: "", dateOfBirth: "", citizenship: "", passportNumber: "", passportDate: "")
            self.tourists.append(tourist)
            self.checkTextField[tourists.count - 1] = [0:"",1:"0",2:"0",3:"0",4:"0",5:"0",6:"0"]
        case 9:
            let tourist = Tourist(showContent: false, position: "Десятый турист", name: "", lastName: "", dateOfBirth: "", citizenship: "", passportNumber: "", passportDate: "")
            self.tourists.append(tourist)
            self.checkTextField[tourists.count - 1] = [0:"",1:"0",2:"0",3:"0",4:"0",5:"0",6:"0"]
        default:
            let tourist = Tourist(showContent: false, position: "Ещё один турист", name: "", lastName: "", dateOfBirth: "", citizenship: "", passportNumber: "", passportDate: "")
            self.tourists.append(tourist)
            self.checkTextField[tourists.count - 1] = [0:"",1:"0",2:"0",3:"0",4:"0",5:"0",6:"0"]
        }
    }
    
    func checkMail(mail: String) {
        let string = mail
        let invalidCharacters = CharacterSet.alphanumerics.inverted
        
        guard string.contains("@") else { print("Нет собачки")
            inputErrorMail = true
            self.mail = ""
            return
        }
        
        guard string.range(of: "[А-Яа-яЁё]", options: .regularExpression) == nil else { print("Русский символ недопустим!")
            inputErrorMail = true
            self.mail = ""
            return
        }
        
        let range = string.range(of: "@")
        let suffix = string.suffix(from: range!.upperBound)
        let prefix = string.prefix(upTo: range!.lowerBound)
        
        guard prefix.count >= 2 && suffix.count >= 5 else { print("Короткий префикс или суфикс")
            inputErrorMail = true
            self.mail = ""
            return
        }
        
        guard prefix.rangeOfCharacter(from: invalidCharacters) == nil else { print("Некорректный символ")
            inputErrorMail = true
            self.mail = ""
            return
        }
        
        guard suffix.contains(".") else { print("Нет точки")
            inputErrorMail = true
            self.mail = ""
            return
        }
        

        
        let smallString = String(suffix)
        let rangeSuffix = smallString.range(of: ".")

        let smallSuffix = smallString.suffix(from: rangeSuffix!.upperBound)
        let smallPrefix = smallString.prefix(upTo: rangeSuffix!.lowerBound)
        guard smallPrefix.count >= 2 && smallSuffix.count >= 2 else { print("Короткий подсуффикс или подпреффикс")
            inputErrorMail = true
            self.mail = ""
            return
        }
        
        guard smallSuffix.allSatisfy({$0.isLetter}) && smallPrefix.allSatisfy({$0.isLetter}) else { print("Некорректный символ")
            inputErrorMail = true
            self.mail = ""
            return
        }

        print("p2: \(smallPrefix) s2: \(smallSuffix)")
        inputErrorMail = false
        self.mail = string
        print(mail)
    }
    
    func checkTF() {
        for i in 0..<tourists.count {
                checkTextField[i]![1] = tourists[i].name
                checkTextField[i]![2] = tourists[i].lastName
                checkTextField[i]![3] = tourists[i].dateOfBirth
                checkTextField[i]![4] = tourists[i].citizenship
                checkTextField[i]![5] = tourists[i].passportNumber
                checkTextField[i]![6] = tourists[i].passportDate
        }
    }
    
    func calculateTheTotal() {
        guard reservation != nil else { return }
        
        let total = reservation!.tourPrice + reservation!.fuelCharge + reservation!.serviceCharge
        self.totalAmount = total
    }
    
    func format(with mask: String, phone: String) -> String {
        let numbers = phone
        //print(numbers)
        var result = "\(numbers)"
        
        guard let last = result.last else { return self.myPhone }
        
        guard last.isNumber else { return self.myPhone }
        var resArray = result.map { "\($0)" }
        //print(resArray)
        guard i < resArray.endIndex - 1 else { return self.myPhone }
        
        let valChar = resArray.removeLast()

        if resArray[i] == "*" {

            resArray[i] = "\(valChar)"
            i = resArray.index(after: i)
            
        } else {
            i = resArray.index(after: i)
            resArray[i] = "\(valChar)"
            i = resArray.index(after: i)
        }
        var myPhone = ""
        resArray.forEach { char in
            
            myPhone += char
        }
        result = myPhone
        
        var numPhone = ""
        myPhone.forEach { char in
            if char.isNumber {
                numPhone.append(char)
            }
        }
        
        self.numberPhone = numPhone
        
//        if numberPhone.count > 1 && numberPhone.count != 11 {
//            inputErrorPhone = true
//        }
////        guard numberPhone.count < 1 || numberPhone.count == 11 else {
////            print("Сотик полностью не заполнен")
////            inputErrorPhone = true
////            return ""
////        }
        self.myPhone = myPhone
        return result
    }
    
    func pay() {
        checkTF()
        checkMail(mail: self.mail)
        if numberPhone.count != 11 {
            inputErrorPhone = true
        } else {
            inputErrorPhone = false
        }
        for i in 0..<tourists.count {
            guard tourists[i].name != "" && tourists[i].lastName != "" && tourists[i].dateOfBirth != "" && tourists[i].citizenship != "" && tourists[i].passportDate != "" && tourists[i].passportNumber != "" && mail != "" && numberPhone.count == 11 else {
                inputErrorTF = true
                return
            }
        }
        self.inputSuccessfully = true
        }
}
