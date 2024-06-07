import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";

import "./model";
import "./services";

using Http;

@service({
    title: "Softever HR",
})
@useAuth(BearerAuth)
namespace SofteverHR;
