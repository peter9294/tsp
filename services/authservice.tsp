import "@typespec/http";

import "../model/main.tsp";

using Http;

namespace SofteverHR.Services;
@route("/api")
@tag("Token")
interface TokenService {
    @route("/Token/login")
    @post
    login(
        @header
        contentType: "application/json" | "text/json" | "application/*+json",

        @body param: LoginParam,
    ): Success<JsonWebToken>;

    @route("/Token/logout")
    @post
    logout(
        @header
        contentType: "application/json" | "text/json" | "application/*+json",

        @body param: {
            refresh_token: string;
        },
    ): BaseResponse.Success | BaseResponse.Unauthorized | BaseResponse.Forbidden;
}
