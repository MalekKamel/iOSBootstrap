//
// Created by Shaban on 04/09/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import Alamofire

public extension Swift.Error {

    var alamofireError: AFError? {
        if let afError = self as? AFError {
            return afError
        }

        if let afError = fromErrorResponse(error: self) {
            return afError
        }

        if let afError = fromAppError() {
            return afError
        }

        return nil
    }

    private func fromAppError() -> AFError? {
        guard let appError = self as? AppError else {
            return nil
        }
        switch appError {
        case .underlying(_, _, let error):
            return fromErrorResponse(error: error)
        default: return nil
        }
    }

    private func fromErrorResponse(error: Swift.Error) -> AFError? {
        guard let errorResponse = error as? ErrorResponse else {
            return nil
        }
        switch errorResponse {
        case .error(_, _, let error):
            guard let afError = error as? AFError else {
                return nil
            }
            return afError
        }
    }
}
