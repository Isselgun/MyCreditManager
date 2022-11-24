//
//  main.swift
//  MyCreditManager
//
//  Created by home on 2022/11/23.
//

import Foundation

// ⭐ 필요한 전역 변수 선언합니다.
// 1. 학생리스트
var studentList: [String] = []
// 2. 학생데이터
var studentData: [[String:String]] = []
// 3. 작동 스위치
var n: Int = 1

// ⭐ 사용자가 종료 메뉴를 선택하기 전까지는 계속해서 사용자의 입력을 받습니다.
while n == 1 {
    maincode()
}

// ⭐ maincode를 작성합니다.
func maincode() {
    print("원하시는 기능을 입력해주세요 \n1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")
    let insert = String(readLine()!)

    switch insert {
    case "1" :
        addStudent()
    case "2" :
        removeStudent()
    case "3":
        addGrade()
    case "4":
        removeGrade()
    case "5":
        getGrade()
    case "x" :
        print("프로그램을 종료합니다...")
        n = 0
    case "X" :
        print("프로그램을 종료합니다...")
        n = 0
    default :
        print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
    }
}

// ⭐ 1번 기능. 학생추가를 작성합니다.
// 1-1 메뉴를 선택한 후에도 잘못 입력한 것이 있으면 처리해 주어야합니다. (nil, 공백)
// 1-2 이미 존재하는 학생은 다시 추가하지 않습니다. (중복처리)
func addStudent() {
    print("추가할 학생의 이름을 입력해주세요")
    guard let insert = readLine() else{ print("입력이 잘못되었습니다. 다시 확인해주세요."); return }
    guard !insert.isEmpty else{ print("입력이 잘못되었습니다. 다시 확인해주세요."); return }
    guard !insert.contains(" ") else{ print("입력이 잘못되었습니다. 다시 확인해주세요."); return }
    guard !studentList.contains(insert) else{ print("\(insert)는 이미 존재하는 학생입니다. 추가하지 않습니다."); return }
    studentList.append(insert)
    studentData.append(["name" : "\(insert)"])
    print("\(insert) 학생을 추가했습니다.")
    // print(studentList, studentData)
}


// ⭐ 2번 기능. 학생삭제를 작성합니다.
// 2-1 메뉴를 선택한 후에도 잘못 입력한 것이 있으면 처리해 주어야합니다. (nil, 공백)
// 2-2 없는 학생은 삭제하지 않습니다. (없는자료)
func removeStudent() {
    print("삭제할 학생의 이름을 입력해주세요")
    guard let insert = readLine() else{ print("입력이 잘못되었습니다. 다시 확인해주세요."); return }
    guard !insert.isEmpty else{ print("입력이 잘못되었습니다. 다시 확인해주세요."); return }
    guard !insert.contains(" ") else{ print("입력이 잘못되었습니다. 다시 확인해주세요."); return }
    guard studentList.contains(insert) else{ print("\(insert) 학생을 찾지 못했습니다."); return }
    studentList.remove(at: studentList.firstIndex(of: "\(insert)")!)
    studentData.remove(at: studentData.firstIndex { $0["name"] == "\(insert)" }!)
    print("\(insert) 학생을 삭제하였습니다.")
    // print(studentList, studentData)
}


// ⭐ 3번 기능. 성적추가를 작성합니다.
// 3-1 메뉴를 선택한 후에도 잘못 입력한 것이 있으면 처리해 주어야합니다. (nil, 공백)
// 3-2 없는 학생의 성적은 추가하지 않습니다. (없는자료)
func addGrade() {
    print("성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F등)을 띄어쓰기로 구분하여 차례로 작성해주세요. \n입력예) Mickey Swift A+\n만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.")
    let insert = readLine()!.split{$0==" "}
    guard !insert.isEmpty else{ print("입력이 잘못되었습니다. 다시 확인해주세요."); return }
    guard !insert.contains(" ") else{ print("입력이 잘못되었습니다. 다시 확인해주세요."); return }
    guard insert.count == 3 else{ print("입력이 잘못되었습니다. 다시 확인해주세요."); return }
    guard studentList.contains("\(insert[0])") else{ print("\(insert[0]) 학생을 찾지 못했습니다."); return }
    guard insert[2] == "A+" || insert[2] == "A" || insert[2] == "B+" || insert[2] == "B" || insert[2] == "C+" || insert[2] == "C" || insert[2] == "D+" || insert[2] == "D" || insert[2] == "F" else { print("성적 입력이 잘못되었습니다. 다시 확인해주세요."); return }
    studentData[studentData.firstIndex { $0["name"] == "\(insert[0])" }!]["\(insert[1])"] = "\(insert[2])"
    print("\(insert[0]) 학생의 \(insert[1]) 과목이 \(insert[2])로 추가(변경)되었습니다.")
}


// ⭐ 4번 기능. 성적삭제를 작성합니다.
// 4-1 메뉴를 선택한 후에도 잘못 입력한 것이 있으면 처리해 주어야합니다. (nil, 공백)
// 4-2 없는 학생의 성적은 삭제하지 않습니다.
func removeGrade() {
    print("성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요. \n입력예) Mickey Swift")
    let insert = readLine()!.split{$0==" "}
    guard !insert.isEmpty else{ print("입력이 잘못되었습니다. 다시 확인해주세요."); return }
    guard !insert.contains(" ") else{ print("입력이 잘못되었습니다. 다시 확인해주세요."); return }
    guard insert.count == 2 else{ print("입력이 잘못되었습니다. 다시 확인해주세요."); return }
    guard studentList.contains("\(insert[0])") else{ print("\(insert[0]) 학생을 찾지 못했습니다."); return }
    studentData[studentData.firstIndex { $0["name"] == "\(insert[0])" }!]["\(insert[1])"] = nil
    print("\(insert[0]) 학생의 \(insert[1]) 과목의 성적이 삭제되었습니다.")
}


// ⭐ 5번 기능. 평점보기를 작성합니다.
// 5-1 메뉴를 선택한 후에도 잘못 입력한 것이 있으면 처리해 주어야합니다. (nil, 공백)
// 5-2 해당 학생의 과목과 성적을 모두 출력한 후 마지막 줄에 평점을 출력합니다.
// 5-3 없는 학생의 평점은 보여주지 않습니다.
func getGrade() {
    print("평점을 알고싶은 학생의 이름을 입력해주세요.")
    guard let insert = readLine() else{ print("입력이 잘못되었습니다. 다시 확인해주세요."); return }
    guard !insert.isEmpty else{ print("입력이 잘못되었습니다. 다시 확인해주세요."); return }
    guard !insert.contains(" ") else{ print("입력이 잘못되었습니다. 다시 확인해주세요."); return }
    guard studentList.contains(insert) else{ print("\(insert) 학생을 찾지 못했습니다."); return }
    var seting = studentData[studentData.firstIndex { $0["name"] == "\(insert)" }!]
    seting["name"] = nil
    var sum = 0.0
    var count = 0.0
    let seting1 = seting.sorted(by: <)
    seting1.forEach {
        print("\($0.key) : \($0.value)")
    }
    seting.forEach {
        switch $0.value {
        case "A+" :
            sum += 4.5
            count += 1
        case "A" :
            sum += 4
            count += 1
        case "B+" :
            sum += 3.5
            count += 1
        case "B" :
            sum += 3
            count += 1
        case "C+" :
            sum += 2.5
            count += 1
        case "C" :
            sum += 2
            count += 1
        case "D+" :
            sum += 1.5
            count += 1
        case "D" :
            sum += 1
            count += 1
        case "F" :
            sum += 1
            count += 1
        default :
            sum += 0
        }
    }
    print("평점 : \(sum/count)")
}



// 성적

//## 성적별 점수
//
//- A+ (4.5점) / A (4점)
//- B+ (3.5점) / B (3점)
//- C+ (2.5점) / C (2점)
//- D+ (1.5점) / D (1점)
//- F (0점)



//// 학생 삽입
//studentData.append(["name" : "Mickey"])
//studentData.append(["name" : "a"])
//print(studentData)
//print("--삽입끝--")
//
//// 학생 삭제
//// 데이터에서 학생을 특정해야함. 위치를? 특정해야함.
//studentData.remove(at: studentData.firstIndex { $0["name"] == "a" }!)
//print(studentData)
//print("--삭제끝--")
//
//// 성적 추가
//studentData[studentData.firstIndex { $0["name"] == "Mickey" }!]["swift"] = "A+"
//print(studentData)
//print("--성적만 추가끝--")
//
//// 성적 삭제
//studentData[studentData.firstIndex { $0["name"] == "Mickey" }!]["swift"] = nil
//print(studentData)
//print("--성적만 삭제끝--")

// 평점


// 종료
// break

//
//
//studentData.remove(at: <#T##Int#>)
//studentList.remove(at: studentData.firstIndex(of: "\(insert)")!)
//
//// 2.
//
//// - 배열을 만든다
//// - 배열안에 딕셔너리를 넣는다
//// - 배열안에 임의의 값을 넣는다.
//var nickNames : [[String:String]] =  [
//    ["mame" : "Mickey","foba" : "Foo Bar","jodo" : "John Doe"],
//    ["mame" : "Mary Mean","foba" : "Foo Bar","jodo" : "John Doe"]
//]
//
////nickNames.forEach{print($0["mame"])}
//
//// - let value = 배열.filter{$0["name"] == "Mickey"}인것만 프린트가 되는지 확인하기.
//let value = nickNames.filter { $0["mame"] == "Mickey" }
//
//print(value[0]["mame"])
//
//


