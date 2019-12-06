//
//  GraphQLFragment.swift
//  GraphQLCLI
//
//  Created by Mathias Quintero on 06.12.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

struct GraphQLFragment {
    let name: String
    let api: API
    let target: Schema.GraphQLType
    let object: GraphQLObject
}

extension GraphQLFragment {
    
    static func ~= (lhs: GraphQLFragment, rhs: GraphQLFragment) -> Bool {
        return lhs.api.name == rhs.api.name && lhs.api.name == rhs.api.name && lhs.target.name == rhs.target.name
    }
    
    static func + (lhs: GraphQLFragment, rhs: GraphQLFragment) -> GraphQLFragment {
        assert(lhs ~= rhs)
        return GraphQLFragment(name: lhs.name,
                               api: lhs.api,
                               target: lhs.target,
                               object: lhs.object + rhs.object)
    }
    
}
