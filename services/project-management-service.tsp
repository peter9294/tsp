import "@typespec/http";

import "../model/main.tsp";

using Http;

namespace SofteverHR.Services;

@tag("ProjectManagement")
@route("/api/ProjectManagement")
interface ProjectManagement {
    @get
    @route("/Project/List")
    GetProjectList(
        @query year?: string,
        @query searchTerm?: string,
        @query userId?: string,
    ): NormalResponse<ProjectDTO[]>;

    @get
    @route("/Project/List")
    GetProjectListId is GetId<ProjectDTO>;

    @post
    @route("/Project")
    PostProject is PostBody<ProjectDTO>;

    @put
    @route("/Project")
    PutProjectId is PutId<ProjectDTO>;

    @get
    @route("/Project/Company")
    GetProjectCompany(@query searchTerm?: string): NormalResponse<CompanyDTO[]>;

    @get
    @route("/Project/Tag")
    GetProjectTag(@query searchTerm?: string): NormalResponse<TagDTO[]>;

    @get
    @route("/Project/DropdownList")
    GetProjectDropdownList(
        @query searchTerm?: string,
    ): NormalResponse<ProjectNameDTO[]>;
}
