//
// Created by Shaban on 04/09/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

public extension Swift.Error {

    var apiErrorMessage: String? {
        guard let apiError = apiError else {
            return nil
        }

        switch apiError {
        case let .error(_, response, error):
            guard let response = response else {
                return error.localizedDescription
            }
            let apiResponse = try? JSONDecoder().decode(BasicApiResponse.self, from: response)

            guard let message = apiResponse?.message else {
                return error.localizedDescription
            }

            return message
        }
    }

}

