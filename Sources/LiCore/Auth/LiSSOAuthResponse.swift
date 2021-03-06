// Copyright 2018 Lithium Technologies 
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import Foundation
/**
 Model for Auth call response.
 */
public struct LiSSOAuthResponse {
    var authCode: String
    var tenantId: String?
    var userId: String?
    init(data: [String: Any]) throws {
        guard let authCode = data["code"] as? String else {
            throw LiBaseError(errorMessage: LiCoreConstants.ErrorMessages.invalidAuthCode, httpCode: LiCoreConstants.ErrorCodes.forbidden)
        }
        self.authCode = authCode
        if let tenantId = data["tenant-id"] as? String {
            self.tenantId = tenantId
        }
        if let userId = data["user-id"] as? String {
            self.userId = userId
        }
    }
}
