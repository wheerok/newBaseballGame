//
//  main.swift
//  baseballGame
//
//  Created by t2023-m0113 on 6/15/24.
//

// 랜덤한 세 가지 숫자 생성 (배열)

func randomNumSet() {
    
    var randomNumArrBase :[Int] = [0 , 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    randomNumArrBase.shuffle()
    var ramdomNum = [randomNumArrBase[0], randomNumArrBase[1], randomNumArrBase[2]]

    //randomNumArrBase는 Int 값이 배열로 들어가있고, shuffle을 사용해서 이것을
    //배열 내 숫자를 무작위로 섞어서준 다음에 ramdomNum에서 세 자리의 인덱스를 가지고 할당

    if ramdomNum[0] == 0 {
        let moreRandomNum = Int.random(in: 1...9)
        ramdomNum[0] = moreRandomNum
    }
    // 랜덤 번호의 앞자리 수는 0이 오면 안 되기 때문에 ramdomNum[0] 키워드로 ramdomNum의 0번째 자리에 접근하고 그게 0과 같으면 구문을 실행도록 if문을 짠다
    // 먼저 moreRandomNum에 0이 아닌 1부터 9까지의 랜덤값을 넣어준다
    // 그런 다음 ramdomNum의 0번째 자리에 moreRandomNum 값을 넣어 주면! 0이 아닌 랜덤값이 할당된다.
    
    
    print(ramdomNum)
}

randomNumSet()


