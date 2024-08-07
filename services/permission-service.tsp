import "@typespec/http";

import "../model/main.tsp";

using Http;

namespace SofteverHR.Services;

@tag("Permission")
@route("/api/Permission")
interface Permission {
    @get
    @route("/UserRole/List")
    GetPermissionUserRoleList(
        ...TableQuery<GetPermissionUserRoleListSortBy>,
    ): TableResponse<UserRoleListDTO[]>;

    @put
    @route("/UserRole")
    PutPermissionUserRole(@body body: UserRoleListDTO[]): VoidResponse;

    @get
    @route("/Permission")
    GetPermissionPermission(): Success<PermissionDTO> | Error;

    @post
    @route("/Permission")
    PostPermissionPermission is PostBody<PermissionDTO>;

    @get
    @route("/Permission/Role")
    GetUserRole(): Success<RoleDTO[]> | Error;

    @post
    @route("/Permission/Role")
    PostPermissionPermissionRole is PostBody<RoleDTO>;

    @put
    @route("/Permission/Role")
    PutPermissionPermissionRole is PutId<RoleDTO>;

    @delete
    @route("/Permission/Role")
    DeletePermissionPermissionRole is DeleteId;
}
