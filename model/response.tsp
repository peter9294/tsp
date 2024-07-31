import "@typespec/http";

using Http;

model Success<Body extends Reflection.Model> {
    @header contentType: ContentType;
    ...BaseResponse.Success;
    @body body: Body;
}

alias Error = BaseResponse.Unauthorized | BaseResponse.Forbidden | BaseResponse.ServerError;

namespace BaseResponse {
    alias Success = OkResponse; // 200
    alias Unauthorized = UnauthorizedResponse; // 401
    alias Forbidden = ForbiddenResponse; // 403
    model ServerError {
        @statusCode statusCode: 500;
        @header contentType: ContentType;
        @body error: ErrorReponse;
    }
}

alias NormalResponse<SuccessBody extends Reflection.Model> = Success<SuccessBody> | Error;

alias TableResponse<SuccessBody extends Reflection.Model> = (Success<SuccessBody> &
    HeadersPaging) | Error;

alias VoidResponse = void | Error;
