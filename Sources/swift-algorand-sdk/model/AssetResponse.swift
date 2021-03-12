//
//  File.swift
//  
//
//  Created by Jesulonimi on 3/1/21.
//

import Foundation
public class  AssetResponse:Codable{
    public var asset:AssetData?;
    public var currentRound:Int64;

    
    enum CodingKeys:String,CodingKey{
        case asset="asset"
        case currentRound="current-round"
    }
}
