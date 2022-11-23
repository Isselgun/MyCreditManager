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

// ⭐ 사용자가 종료 메뉴를 선택하기 전까지는 계속해서 사용자의 입력을 받습니다.
while true {
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
        print("2")
    case "3":
        print("3")
    case "4":
        print("4")
    case "5":
        print("5")
    case "x" :
        print("x")
    case "X" :
        print("X")
    default :
        print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
    }
}

// ⭐ 1번 기능. 학생추가를 작성합니다.
// 1-1 메뉴를 선택한 후에도 잘못 입력한 것이 있으면 처리해 주어야합니다. (nil, 공백 - 처리완료)
// 1-2 이미 존재하는 학생은 다시 추가하지 않습니다. (중복 - 처리완료)
func addStudent() {
    print("추가할 학생의 이름을 입력해주세요")
    guard let insert = readLine() else{ print("입력이 잘못되었습니다. 다시 확인해주세요."); return }
    guard !insert.isEmpty else{ print("입력이 잘못되었습니다. 다시 확인해주세요."); return }
    guard !insert.contains(" ") else{ print("입력이 잘못되었습니다. 다시 확인해주세요."); return }
    guard !studentList.contains(insert) else{ print("\(insert)는 이미 존재하는 학생입니다. 추가하지 않습니다."); return }
    studentList.append(insert)
    print("\(insert) 학생을 추가했습니다.")
    print(studentList)
}


// ⭐ 2번 기능. 학생삭제를 작성합니다.
// 2-1 
// 2-2
