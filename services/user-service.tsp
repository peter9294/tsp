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
    ): (Success<UserListDTO[]> & HeadersPaging) | Error;

    @get
    GetUsersId(@path id: string): Success<UserDTO> | Error;

    @get
    @route("/Info")
    GetUserInfo(@path id: string): Success<UserInfoDTO> | Error;

    @post
    CreateUser(@body param: UserDTO): void | Error;

    @delete
    DeleteUsersId(@path id: string): void | Error;
}
