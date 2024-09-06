import "@typespec/http";

import "../model/main.tsp";

using Http;

namespace SofteverHR.Services;
@tag("Users")
@route("/api/Users")
interface Users {
    @get
    GetUsers(): NormalResponse<UserDTO[]>;

    @get
    @route("/List")
    GetUsersList(
        @query searchTerm?: string,
        @query department?: Department,
        ...TableQuery<GetUserListSortBy>,
    ): TableResponse<UserListDTO[]>;

    @get
    GetUsersId is GetId<UserDTO>;

    @get
    @route("/Info")
    GetUserInfo is GetId<UserInfoDTO>;

    @post
    CreateUser is PostBody<UserDTO>;

    @delete
    DeleteUsersId is DeleteId;

    @get
    @route("/Position")
    GetUsersPosition(@query searchTerm?: string): NormalResponse<string[]>;
}
