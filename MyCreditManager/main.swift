//
//  main.swift
//  MyCreditManager
//
//  Created by home on 2022/11/23.
//

import Foundation

// 1. 사용자가 종료 메뉴를 선택하기 전까지는 계속해서 사용자의 입력을 받습니다.
while true {
    maincode()
    
    
    
}

func maincode() {
    print("원하시는 기능을 입력해주세요 \n1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")
    let insert = readLine()!
    
    switch insert {
    case "1" :
        print("1")
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
