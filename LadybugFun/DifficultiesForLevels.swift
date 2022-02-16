//
//  DifficultiesForLevels.swift
//  SpacegameReloaded
//
//  Created by Владимир Ефимов on 20.06.2021.
//  Copyright © 2021 Training. All rights reserved.
//

import Foundation

func nextLevel() {

switch UserDefaults.standard.integer(forKey: "level") {

    case 1:
        print("LEVEL 1")
        let arrayObject1ForLevel = ["Cone1"]
        let arrayObject2ForLevel = ["ExtraLife"]
        let arrayObject3ForLevel = ["Flower1", "Flower2", "Flower3", "Flower4", "Flower5", "Flower6", "Flower7"]

        UserDefaults.standard.set(1.5, forKey: "SKActionDuration")
        UserDefaults.standard.set(10, forKey: "levelScoreToWin")
        UserDefaults.standard.setValue(arrayObject1ForLevel, forKey: "LevelObjects1")
        UserDefaults.standard.setValue(arrayObject2ForLevel, forKey: "LevelObjects2")
        UserDefaults.standard.setValue(arrayObject3ForLevel, forKey: "LevelObjects3")
        UserDefaults.standard.set(4, forKey: "animationDurationObject3Min")
        UserDefaults.standard.set(4, forKey: "animationDurationObject3Max")
        UserDefaults.standard.set(4, forKey: "animationDurationObject2Min")
        UserDefaults.standard.set(4, forKey: "animationDurationObject2Max")
        UserDefaults.standard.set(4, forKey: "animationDurationObject1Min")
        UserDefaults.standard.set(4, forKey: "animationDurationObject1Max")

    case 2:
        print("LEVEL 2")
        let arrayObject1ForLevel = ["Cone1"]
        let arrayObject2ForLevel = ["ExtraLife"]
        let arrayObject3ForLevel = ["Flower1", "Flower2", "Flower3", "Flower4", "Flower5", "Flower6", "Flower7"]
        UserDefaults.standard.set(0.8, forKey: "SKActionDuration")
        UserDefaults.standard.set(15, forKey: "levelScoreToWin")
        UserDefaults.standard.setValue(arrayObject1ForLevel, forKey: "LevelObjects1")
        UserDefaults.standard.setValue(arrayObject2ForLevel, forKey: "LevelObjects2")
        UserDefaults.standard.setValue(arrayObject3ForLevel, forKey: "LevelObjects3")
        UserDefaults.standard.set(2, forKey: "animationDurationObject3Min")
        UserDefaults.standard.set(4, forKey: "animationDurationObject3Max")
        UserDefaults.standard.set(2, forKey: "animationDurationObject2Min")
        UserDefaults.standard.set(4, forKey: "animationDurationObject2Max")
        UserDefaults.standard.set(2, forKey: "animationDurationObject1Min")
        UserDefaults.standard.set(4, forKey: "animationDurationObject1Max")
    case 3:
        print("LEVEL 3")
    let arrayObject1ForLevel = ["Cone1"]
    let arrayObject2ForLevel = ["ExtraLife"]
    let arrayObject3ForLevel = ["Flower1", "Flower2", "Flower3", "Flower4", "Flower5", "Flower6", "Flower7"]
        UserDefaults.standard.set(0.8, forKey: "SKActionDuration")
        UserDefaults.standard.set(20, forKey: "levelScoreToWin")
        UserDefaults.standard.setValue(arrayObject1ForLevel, forKey: "LevelObjects1")
        UserDefaults.standard.setValue(arrayObject2ForLevel, forKey: "LevelObjects2")
        UserDefaults.standard.setValue(arrayObject3ForLevel, forKey: "LevelObjects3")
        UserDefaults.standard.set(1, forKey: "animationDurationObject3Min")
        UserDefaults.standard.set(4, forKey: "animationDurationObject3Max")
        UserDefaults.standard.set(1, forKey: "animationDurationObject2Min")
        UserDefaults.standard.set(4, forKey: "animationDurationObject2Max")
        UserDefaults.standard.set(1, forKey: "animationDurationObject1Min")
        UserDefaults.standard.set(4, forKey: "animationDurationObject1Max")

    case 4:
        print("LEVEL 4")
    let arrayObject1ForLevel = ["Cone1"]
    let arrayObject2ForLevel = ["ExtraLife"]
    let arrayObject3ForLevel = ["Flower1", "Flower2", "Flower3", "Flower4", "Flower5", "Flower6", "Flower7"]
        UserDefaults.standard.set(0.7, forKey: "SKActionDuration")
        UserDefaults.standard.set(25, forKey: "levelScoreToWin")
        UserDefaults.standard.setValue(arrayObject1ForLevel, forKey: "LevelObjects1")
        UserDefaults.standard.setValue(arrayObject2ForLevel, forKey: "LevelObjects2")
        UserDefaults.standard.setValue(arrayObject3ForLevel, forKey: "LevelObjects3")
        UserDefaults.standard.set(2, forKey: "animationDurationObject3Min")
        UserDefaults.standard.set(4, forKey: "animationDurationObject3Max")
        UserDefaults.standard.set(2, forKey: "animationDurationObject2Min")
        UserDefaults.standard.set(3, forKey: "animationDurationObject2Max")
        UserDefaults.standard.set(2, forKey: "animationDurationObject1Min")
        UserDefaults.standard.set(3, forKey: "animationDurationObject1Max")
    
    case 5:
        print("LEVEL 5")
    let arrayObject1ForLevel = ["Cone1"]
    let arrayObject2ForLevel = ["ExtraLife"]
    let arrayObject3ForLevel = ["Flower1", "Flower2", "Flower3", "Flower4", "Flower5", "Flower6", "Flower7"]

        UserDefaults.standard.set(0.7, forKey: "SKActionDuration")
        UserDefaults.standard.set(30, forKey: "levelScoreToWin")
        UserDefaults.standard.setValue(arrayObject1ForLevel, forKey: "LevelObjects1")
        UserDefaults.standard.setValue(arrayObject2ForLevel, forKey: "LevelObjects2")
        UserDefaults.standard.setValue(arrayObject3ForLevel, forKey: "LevelObjects3")
        UserDefaults.standard.set(2, forKey: "animationDurationObject3Min")
        UserDefaults.standard.set(4, forKey: "animationDurationObject3Max")
        UserDefaults.standard.set(2, forKey: "animationDurationObject2Min")
        UserDefaults.standard.set(2, forKey: "animationDurationObject2Max")
        UserDefaults.standard.set(2, forKey: "animationDurationObject1Min")
        UserDefaults.standard.set(2, forKey: "animationDurationObject1Max")

    case 6:
        print("LEVEL 6")
    let arrayObject1ForLevel = ["Cone1"]
    let arrayObject2ForLevel = ["ExtraLife"]
    let arrayObject3ForLevel = ["Flower1", "Flower2", "Flower3", "Flower4", "Flower5", "Flower6", "Flower7"]

        UserDefaults.standard.set(0.7, forKey: "SKActionDuration")
        UserDefaults.standard.set(35, forKey: "levelScoreToWin")
        UserDefaults.standard.setValue(arrayObject1ForLevel, forKey: "LevelObjects1")
        UserDefaults.standard.setValue(arrayObject2ForLevel, forKey: "LevelObjects2")
        UserDefaults.standard.setValue(arrayObject3ForLevel, forKey: "LevelObjects3")
        UserDefaults.standard.set(2, forKey: "animationDurationObject3Min")
        UserDefaults.standard.set(4, forKey: "animationDurationObject3Max")
        UserDefaults.standard.set(2, forKey: "animationDurationObject2Min")
        UserDefaults.standard.set(2, forKey: "animationDurationObject2Max")
        UserDefaults.standard.set(2, forKey: "animationDurationObject1Min")
        UserDefaults.standard.set(2, forKey: "animationDurationObject1Max")

    case 7:
        print("LEVEL 7")
    let arrayObject1ForLevel = ["Cone1"]
    let arrayObject2ForLevel = ["ExtraLife"]
    let arrayObject3ForLevel = ["Flower1", "Flower2", "Flower3", "Flower4", "Flower5", "Flower6", "Flower7"]
        UserDefaults.standard.set(0.4, forKey: "SKActionDuration")
        UserDefaults.standard.set(40, forKey: "levelScoreToWin")
        UserDefaults.standard.setValue(arrayObject1ForLevel, forKey: "LevelObjects1")
        UserDefaults.standard.setValue(arrayObject2ForLevel, forKey: "LevelObjects2")
        UserDefaults.standard.setValue(arrayObject3ForLevel, forKey: "LevelObjects3")
        UserDefaults.standard.set(2, forKey: "animationDurationObject3Min")
        UserDefaults.standard.set(4, forKey: "animationDurationObject3Max")
        UserDefaults.standard.set(2, forKey: "animationDurationObject2Min")
        UserDefaults.standard.set(2, forKey: "animationDurationObject2Max")
        UserDefaults.standard.set(2, forKey: "animationDurationObject1Min")
        UserDefaults.standard.set(2, forKey: "animationDurationObject1Max")

    case 8:
        print("LEVEL 8")
    let arrayObject1ForLevel = ["Cone1"]
    let arrayObject2ForLevel = ["ExtraLife"]
    let arrayObject3ForLevel = ["Flower1", "Flower2", "Flower3", "Flower4", "Flower5", "Flower6", "Flower7"]
        UserDefaults.standard.set(0.4, forKey: "SKActionDuration")
        UserDefaults.standard.set(45, forKey: "levelScoreToWin")
        UserDefaults.standard.setValue(arrayObject1ForLevel, forKey: "LevelObjects1")
        UserDefaults.standard.setValue(arrayObject2ForLevel, forKey: "LevelObjects2")
        UserDefaults.standard.setValue(arrayObject3ForLevel, forKey: "LevelObjects3")
        UserDefaults.standard.set(1, forKey: "animationDurationObject3Min")
        UserDefaults.standard.set(3, forKey: "animationDurationObject3Max")
        UserDefaults.standard.set(2, forKey: "animationDurationObject2Min")
        UserDefaults.standard.set(2, forKey: "animationDurationObject2Max")
        UserDefaults.standard.set(2, forKey: "animationDurationObject1Min")
        UserDefaults.standard.set(2, forKey: "animationDurationObject1Max")

    case 9:
        print("LEVEL 9")
    let arrayObject1ForLevel = ["Cone1"]
    let arrayObject2ForLevel = ["ExtraLife"]
    let arrayObject3ForLevel = ["Flower1", "Flower2", "Flower3", "Flower4", "Flower5", "Flower6", "Flower7"]
        UserDefaults.standard.set(0.4, forKey: "SKActionDuration")
        UserDefaults.standard.set(50, forKey: "levelScoreToWin")
        UserDefaults.standard.setValue(arrayObject1ForLevel, forKey: "LevelObjects1")
        UserDefaults.standard.setValue(arrayObject2ForLevel, forKey: "LevelObjects2")
        UserDefaults.standard.setValue(arrayObject3ForLevel, forKey: "LevelObjects3")
        UserDefaults.standard.set(2, forKey: "animationDurationObject3Min")
        UserDefaults.standard.set(2, forKey: "animationDurationObject3Max")
        UserDefaults.standard.set(2, forKey: "animationDurationObject2Min")
        UserDefaults.standard.set(2, forKey: "animationDurationObject2Max")
        UserDefaults.standard.set(2, forKey: "animationDurationObject1Min")
        UserDefaults.standard.set(2, forKey: "animationDurationObject1Max")

    case 10:
        print("LEVEL 10")
    let arrayObject1ForLevel = ["Cone1"]
    let arrayObject2ForLevel = ["ExtraLife"]
    let arrayObject3ForLevel = ["Flower1", "Flower2", "Flower3", "Flower4", "Flower5", "Flower6", "Flower7"]
        UserDefaults.standard.set(0.2, forKey: "SKActionDuration")
        UserDefaults.standard.set(55, forKey: "levelScoreToWin")
        UserDefaults.standard.setValue(arrayObject1ForLevel, forKey: "LevelObjects1")
        UserDefaults.standard.setValue(arrayObject2ForLevel, forKey: "LevelObjects2")
        UserDefaults.standard.setValue(arrayObject3ForLevel, forKey: "LevelObjects3")
        UserDefaults.standard.set(1, forKey: "animationDurationObject3Min")
        UserDefaults.standard.set(6, forKey: "animationDurationObject3Max")
        UserDefaults.standard.set(1, forKey: "animationDurationObject2Min")
        UserDefaults.standard.set(4, forKey: "animationDurationObject2Max")
        UserDefaults.standard.set(1, forKey: "animationDurationObject1Min")
        UserDefaults.standard.set(4, forKey: "animationDurationObject1Max")

    case 11:
        print("LEVEL 11")
    let arrayObject1ForLevel = ["Cone1"]
    let arrayObject2ForLevel = ["ExtraLife"]
    let arrayObject3ForLevel = ["Flower1", "Flower2", "Flower3", "Flower4", "Flower5", "Flower6", "Flower7"]

        UserDefaults.standard.set(0.2, forKey: "SKActionDuration")
        UserDefaults.standard.set(60, forKey: "levelScoreToWin")
        UserDefaults.standard.setValue(arrayObject1ForLevel, forKey: "LevelObjects1")
        UserDefaults.standard.setValue(arrayObject2ForLevel, forKey: "LevelObjects2")
        UserDefaults.standard.setValue(arrayObject3ForLevel, forKey: "LevelObjects3")
        UserDefaults.standard.set(1, forKey: "animationDurationObject3Min")
        UserDefaults.standard.set(6, forKey: "animationDurationObject3Max")
        UserDefaults.standard.set(1, forKey: "animationDurationObject2Min")
        UserDefaults.standard.set(3, forKey: "animationDurationObject2Max")
        UserDefaults.standard.set(1, forKey: "animationDurationObject1Min")
        UserDefaults.standard.set(3, forKey: "animationDurationObject1Max")

    case 12:
        print("LEVEL 12")
    let arrayObject1ForLevel = ["Cone1"]
    let arrayObject2ForLevel = ["ExtraLife"]
    let arrayObject3ForLevel = ["Flower1", "Flower2", "Flower3", "Flower4", "Flower5", "Flower6", "Flower7"]
        UserDefaults.standard.set(0.2, forKey: "SKActionDuration")
        UserDefaults.standard.set(65, forKey: "levelScoreToWin")
        UserDefaults.standard.setValue(arrayObject1ForLevel, forKey: "LevelObjects1")
        UserDefaults.standard.setValue(arrayObject2ForLevel, forKey: "LevelObjects2")
        UserDefaults.standard.setValue(arrayObject3ForLevel, forKey: "LevelObjects3")
        UserDefaults.standard.set(1, forKey: "animationDurationObject3Min")
        UserDefaults.standard.set(4, forKey: "animationDurationObject3Max")
        UserDefaults.standard.set(1, forKey: "animationDurationObject2Min")
        UserDefaults.standard.set(2, forKey: "animationDurationObject2Max")
        UserDefaults.standard.set(1, forKey: "animationDurationObject1Min")
        UserDefaults.standard.set(2, forKey: "animationDurationObject1Max")

    case 13:
        print("LEVEL 13")
    let arrayObject1ForLevel = ["Cone1"]
    let arrayObject2ForLevel = ["ExtraLife"]
    let arrayObject3ForLevel = ["Flower1", "Flower2", "Flower3", "Flower4", "Flower5", "Flower6", "Flower7"]

        UserDefaults.standard.set(0.1, forKey: "SKActionDuration")
        UserDefaults.standard.set(70, forKey: "levelScoreToWin")
        UserDefaults.standard.setValue(arrayObject1ForLevel, forKey: "LevelObjects1")
        UserDefaults.standard.setValue(arrayObject2ForLevel, forKey: "LevelObjects2")
        UserDefaults.standard.setValue(arrayObject3ForLevel, forKey: "LevelObjects3")
        UserDefaults.standard.set(1, forKey: "animationDurationObject3Min")
        UserDefaults.standard.set(6, forKey: "animationDurationObject3Max")
        UserDefaults.standard.set(1, forKey: "animationDurationObject2Min")
        UserDefaults.standard.set(6, forKey: "animationDurationObject2Max")
        UserDefaults.standard.set(1, forKey: "animationDurationObject1Min")
        UserDefaults.standard.set(6, forKey: "animationDurationObject1Max")

    case 14:
        print("LEVEL 14")
    let arrayObject1ForLevel = ["Cone1"]
    let arrayObject2ForLevel = ["ExtraLife"]
    let arrayObject3ForLevel = ["Flower1", "Flower2", "Flower3", "Flower4", "Flower5", "Flower6", "Flower7"]
            UserDefaults.standard.set(0.1, forKey: "SKActionDuration")
        UserDefaults.standard.set(75, forKey: "levelScoreToWin")
        UserDefaults.standard.setValue(arrayObject1ForLevel, forKey: "LevelObjects1")
        UserDefaults.standard.setValue(arrayObject2ForLevel, forKey: "LevelObjects2")
        UserDefaults.standard.setValue(arrayObject3ForLevel, forKey: "LevelObjects3")
        UserDefaults.standard.set(1, forKey: "animationDurationObject3Min")
        UserDefaults.standard.set(4, forKey: "animationDurationObject3Max")
        UserDefaults.standard.set(1, forKey: "animationDurationObject2Min")
        UserDefaults.standard.set(4, forKey: "animationDurationObject2Max")
        UserDefaults.standard.set(1, forKey: "animationDurationObject1Min")
        UserDefaults.standard.set(4, forKey: "animationDurationObject1Max")

    case 15:
        print("LEVEL 15")
    let arrayObject1ForLevel = ["Cone1"]
    let arrayObject2ForLevel = ["ExtraLife"]
    let arrayObject3ForLevel = ["Flower1", "Flower2", "Flower3", "Flower4", "Flower5", "Flower6", "Flower7"]
        UserDefaults.standard.set(0.1, forKey: "SKActionDuration")
        UserDefaults.standard.set(80, forKey: "levelScoreToWin")
        UserDefaults.standard.setValue(arrayObject1ForLevel, forKey: "LevelObjects1")
        UserDefaults.standard.setValue(arrayObject2ForLevel, forKey: "LevelObjects2")
        UserDefaults.standard.setValue(arrayObject3ForLevel, forKey: "LevelObjects3")
        UserDefaults.standard.set(1, forKey: "animationDurationObject3Min")
        UserDefaults.standard.set(1, forKey: "animationDurationObject3Max")
        UserDefaults.standard.set(1, forKey: "animationDurationObject2Min")
        UserDefaults.standard.set(1, forKey: "animationDurationObject2Max")
        UserDefaults.standard.set(1, forKey: "animationDurationObject1Min")
        UserDefaults.standard.set(1, forKey: "animationDurationObject1Max")

    default:
        print("LEVEL default")
    }
}
