import "@typespec/http";

import "../model/user.tsp";
import "../model/response.tsp";
import "../model/headers.tsp";
import "../model/main.tsp";

using Http;
using User;
using CustomResponse;

namespace SofteverHR.Services;
@tag("UserService")
@route("/api/Users")
interface UsersService {
    @get
    getUsers(): Success<UserDTO[]> | Error;

    @get
    @route("/list")
    getUsersList(
        @query searchTerm?: string,
        @query department?: Department,
        ...CustomQuery.SortBy<GetUserListSortBy>,
        ...CustomQuery.Paging,
    ): (Success<UserListDTO[]> & Headers.Paging) | Error;

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
