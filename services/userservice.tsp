import "@typespec/http";

import "../model/main.tsp";

using Http;

namespace SofteverHR.Services;
@tag("Users")
@route("/api/Users")
interface UsersService {
    @get
    getUsers(): Success<UserDTO[]> | Error;

    @get
    @route("/list")
    getUsersList(
        @query searchTerm?: string,
        @query department?: Department,
        ...SortBy<GetUserListSortBy>,
        ...Paging<void>,
    ): (Success<UserListDTO[]> & HeadersPaging) | Error;

    @get
    getUsersId(@path id: string): Success<UserDTO> | Error;

    @get
    @route("/info")
    getUserInfo(@path id: string): Success<UserInfoDTO> | Error;

    @post
    createUser(@body param: UserDTO): void | Error;

    @delete
    deleteUsersId(@path id: string): void | Error;
}
