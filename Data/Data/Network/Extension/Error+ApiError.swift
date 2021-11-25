//
// Created by Shaban on 04/09/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import Foundation

public extension Swift.Error {

    var apiError: ErrorResponse? {
        if let error = self as? ErrorResponse {
            return error
        }

        if let afError = fromAppError() {
            return afError
        }

        return nil
    }

    private func fromAppError() -> ErrorResponse? {
        guard let appError = self as? AppError else {
            return nil
        }
        switch appError {
        case .underlying(_, _, let error):
            if let apiError = error as? ErrorResponse {
                return apiError
            }
            return nil
        default: return nil
        }
    }

}
