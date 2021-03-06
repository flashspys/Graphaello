import Foundation
import SwiftSyntax

enum Argument: Equatable, Hashable {
    enum QueryArgument: Equatable, Hashable {
        case withDefault(ExprSyntax)
        case forced

        func hash(into hasher: inout Hasher) {
            switch self {
            case .withDefault(let expression):
                expression.description.hash(into: &hasher)
            case .forced:
                1.hash(into: &hasher)
            }
        }

        static func == (lhs: QueryArgument, rhs: QueryArgument) -> Bool {
            switch (lhs, rhs) {
            case (.withDefault(let lhs), .withDefault(let rhs)):
                return lhs.description == rhs.description
            case (.forced, .forced):
                return true
            default:
                return false
            }
        }
    }

    case value(ExprSyntax)
    case argument(QueryArgument)

    func hash(into hasher: inout Hasher) {
        switch self {
        case .value(let expression):
            expression.description.hash(into: &hasher)
        case .argument(let argument):
            argument.hash(into: &hasher)
        }
    }

    static func == (lhs: Argument, rhs: Argument) -> Bool {
        switch (lhs, rhs) {
        case (.value(let lhs), .value(let rhs)):
            return lhs.description == rhs.description
        case (.argument(let lhs), .argument(let rhs)):
            return lhs == rhs
        default:
            return false
        }
    }
}

