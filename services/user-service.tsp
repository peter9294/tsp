import "@typespec/http";

import "../model/main.tsp";

using Http;

namespace SofteverHR.Services;
@tag("Users")
@route("/api/Users")
interface Users {
    @get
    GetUsers(): Success<UserDTO[]> | Error;

    @get
    @route("/List")
    GetUsersList(
        @query searchTerm?: string,
        @query department?: Department,
        ...SortBy<GetUserListSortBy>,
        ...Paging<void>,
    ): TableResponse<UserListDTO[]>;

    @get
    GetUsersId(@format("uuid") @path id: string): NormalResponse<UserDTO>;

    @get
    @route("/Info")
    GetUserInfo(@format("uuid") @path id: string): NormalResponse<UserInfoDTO>;

    @post
    CreateUser(@body param: UserDTO): VoidResponse;

    @delete
    DeleteUsersId is DeleteId;
}
