//
//  Codegen.swift
//  GraphQLCLI
//
//  Created by Mathias Quintero on 04.12.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation
import SwiftFormat
import Stencil

struct Codegen {
    let apis: [API]
    let structs: [GraphQLStruct]
}

extension Codegen {

    func generate() throws -> String {
        let file = try Environment
            .custom
            .renderTemplate(name: "GraphQL.swift.stencil", context: ["apis" : apis])
        
        return try format(file)
    }

}
