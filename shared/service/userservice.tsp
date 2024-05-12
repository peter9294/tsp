import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";
import "../user.tsp";

using Http;
using Rest;
using OpenAPI;

namespace UserService {
    @tag("UserService")
    interface UsersService {
        @route("/user")
        @get
        getUser(): User.UserDTO[];
    }
}
