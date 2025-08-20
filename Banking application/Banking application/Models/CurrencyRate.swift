//
//  CurrencyRate.swift
//  Banking application
//
//  Created by Илья Степаненко on 13.08.25.
//

struct CurrencyRate: Decodable {
    let Cur_ID: Int
    let Cur_Abbreviation: String
    let Cur_Scale: Double
    let Cur_Name: String
    let Cur_OfficialRate: Double
}
