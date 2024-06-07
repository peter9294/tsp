import "@typespec/http";

import "../model/auth.tsp";
import "../model/response.tsp";

using Http;
using CustomResponse;

namespace SofteverHR.Services;
@route("/api")
@tag("Token")
interface TokenService {
    @route("/Token/login")
    @post
    login(
        @header
        contentType: "application/json" | "text/json" | "application/*+json",

        @body param: Auth.LoginParam,
    ): Success<Auth.JsonWebToken>;

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
