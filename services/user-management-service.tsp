import "@typespec/http";

import "../model/main.tsp";

using Http;

namespace SofteverHR.Services;

@tag("UserManagement")
@route("/api/UserManagement")
interface UserManagement {
    @get
    @route("/Users/List")
    GetUserManagementUsersList(
        ...TableQuery<GetUserManagementUsersListSortBy>,
        @query department?: Department,
        @query searchTerm?: string,
    ): TableResponse<UserManagementUserDTO[]>;

    @get
    @route("/Users")
    GetUserManagementUsersId is GetId<UserManagementUserDTO>;

    @post
    @route("/Users")
    PostUserManagementUsers is PostBody<UserManagementUserDTO>;

    @put
    @route("/Users")
    PutUserManagementUsersId is PutId<UserManagementUserDTO>;

    @post
    @route("/Users/MultipleDelete")
    DeleteUserManagementUsers(
        @body body: {
            @format("uuid") id: string;
        }[],
    ): VoidResponse;

    @get
    @route("/ExportExcel")
    GetUserManagementExportExcel(): Success<FileDTO> | Error;

    @post
    @route("/Import")
    // TODO: check again
    PostUserMangementImport is PostBody<FileDTO>;
}
