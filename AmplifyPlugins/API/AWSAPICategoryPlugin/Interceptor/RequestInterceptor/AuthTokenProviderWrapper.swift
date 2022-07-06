//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Amplify
import AWSPluginsCore
import Foundation

class AuthTokenProviderWrapper: AuthTokenProvider {

    let wrappedAuthTokenProvider: AmplifyAuthTokenProvider

    init(tokenAuthProvider: AmplifyAuthTokenProvider) {
        self.wrappedAuthTokenProvider = tokenAuthProvider
    }

    func getToken() async throws -> String {
        let result = wrappedAuthTokenProvider.getLatestAuthToken()
        switch result {
        case .success(let result):
            return result
        case .failure(let error):
            throw error
        }
    }
}
