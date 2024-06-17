//
//  BaseballGame.swift
//  baseballGame
//
//  Created by t2023-m0113 on 6/16/24.
//

import Foundation

class GameRecord{
    var gameCount = 0
    var attemptsPerGame = [Int]()
    
    func incrementGameStart(){
        gameCount += 1
    }
    
    func addAttemptsCount(_ attempts : Int) {
        attemptsPerGame.append(attempts)
    }
    
    func showRecord() {
        for (index, attempts) in attemptsPerGame.enumerated() {
            print("\(index + 1)번째 게임: \(attempts)")
        }
    }
}


class BaseballGame {
    
    var answer = [Int]()
    var isPlaying = true
    var gameRecord = GameRecord()
    
    
    func makeAnswer() {
        
        var randomNumArrBase :[Int] = [0 , 1, 2, 3, 4, 5, 6, 7, 8, 9]
        randomNumArrBase.shuffle()
        answer = [randomNumArrBase[0], randomNumArrBase[1], randomNumArrBase[2]]

        //randomNumArrBase는 Int 값이 배열로 들어가있고, shuffle을 사용해서 이것을
        //배열 내 숫자를 무작위로 섞어서준 다음에 answer에서 세 자리의 인덱스를 가지고 할당

        if answer[0] == 0 {
            let moreRandomNum = Int.random(in: 1...9)
            answer[0] = moreRandomNum
        }
        // 랜덤 번호의 앞자리 수는 0이 오면 안 되기 때문에 ramdomNum[0] 키워드로 answer의 0번째 자리에 접근하고 그게 0과 같으면 구문을 실행도록 if문을 짠다
        // 먼저 moreRandomNum에 0이 아닌 1부터 9까지의 수를 랜덤하게 넣은 뒤... answer의 0번째 순서에 넣어준다.

    } //makeAnswer
    
    
    func FirstStep() {
        while isPlaying {
            print("안녕하세요! 원하는 메뉴 번호를 입력해주세요!😃")
            print("1. 게임 시작하기 2. 게임 가록 보기 3. 종료하기")
            
            if let userSelect = readLine() {
                switch userSelect {
                    case "1" :
                    start()
                    
                    case "2" :
                    gameRecord.showRecord()
                    
                    case "3" :
                    endGame()
                    
                    default:
                        print("잘못된 입력입니다. 다시 선택해주세요.")
                }
            }
        } //isPlaying
    } //FirstStep
    
    
    
    func start() {
        
        var currenAttempCount = 0
       makeAnswer()
        
        print("<게임을 시작합니다. 세 자리 숫자를 입력하세요!🤟>")
        
        while true {
            let input = readLine()! // 강제 언래핑
            var userIput :[Int] = []
            
            if input.count != 3 {
                print("<입력한 값이 잘못되었습니다...😥 세 자리 숫자를 입력하세요!>")
                continue //다시 와일문으로 가서 readLine 받기
            }
            
            
            // 입력값 배열화
            for x in input { // input에 들어간 내용 하나하나 빼서 x에 넣고 돌리기
                if let num = Int(String(x)) { // x는 현재 character 타입이기 때문에 문자열 > 정수 순으로 변환이 필요함
                    userIput.append(num)
                }
            }
            
            // 첫 번째 자리에 0이 들었는지 검사
            if userIput.first == 0{
                print("<첫 번째 자리에 0이 들어올 수 없습니다...😢>")
                continue
            }
            
            //중복값 검사
            var setUserInput = [Int]() // 비교한 숫자가 들어갈 공간 만들기
            var duplicationNum = false // 중복 숫자 판별 조건 Bool
            
            for number in userIput { //userIput의 값을 하나하나 대입
                if setUserInput.contains(number) { // contains로 안에 number와 같은 값이 있는지 확인
                    // 예를 들자면 3이 들어와서 이미 자리를 잡았는데 number에 또 3이 들어오면 이는 겹치는 거라 if 구문 조건에 맞아서 실행이 되는 것임
                    duplicationNum = true
                    break
                    // 그러면서 true가 잡히고 break으로 탈출
                }
                
                setUserInput.append(number) // 빈 setUserInput에 검사가 끝난 number 할당
            }
            
            if duplicationNum { //지금 조건이 true인 것으로 받아들어와서 바로 실행
                print("<중복된 숫자가 있습니다...🫠 값을 다시 입력하세요!>")
                continue
            }
            
            
            
            print("입력한 숫자: \(setUserInput)")
            
            
            // 문자 입력 시 알림
            var thisAllDigit =  true //초기값 설정, 일단 모든 값이 숫자라고 설정하기 위함
            
            for char in input { // 사용자가 입력한 값을 하나하나 가져와서 검사할 것임
                
                if !char.isNumber { // isnumber는 character타입이 가진 속성으로 숫자인지 아닌지 판단 여기선 !붙여서 아니라면이 조건임
                    thisAllDigit = false
                    break
                }
                
            }
            
            if !thisAllDigit {
                print("<숫자가 아닌 값이 있습니다...😖 다시 입력해주세요!>")
            }
            
            currenAttempCount += 1
            
            // 스트라이크, 볼
            var strike = 0
            var ball = 0
            
            for (index, number) in userIput.enumerated() {
                if number == answer[index]{
                    strike += 1
                } else if answer.contains(number) {
                    ball += 1
                }
            } // 추후에 이걸 활용해서 게임 횟수 저장
            
            print("⚾️ \(strike) 스트라이크, \(ball)입니다! ⚾️")
            
            if strike == 3 {
                print("<정답입니다! 게임을 종료합니다.🥳>")
                gameRecord.addAttemptsCount(currenAttempCount)
                print("\(gameRecord.gameCount) 게임,  시도 횟수 \(currenAttempCount)")
                break
                
            }
        }
        
        
    } // BaseballGame
    
    func endGame() {
        print("게임을 종료합니다~!😎")
        isPlaying = false
    }
    
}


