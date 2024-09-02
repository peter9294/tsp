import "@typespec/http";

import "../model/main.tsp";

using Http;

namespace SofteverHR.Services;
@tag("Report")
@route("/api/Report")
interface Report {
    // Overall
    @get
    @route("/TotalEmployee")
    GetReportTotalEmployee(): NormalResponse<TotalEmployeeDTO[]>;

    @get
    @route("/TotalLifestyleWallet")
    GetReportTotalLifestyleWallet(): NormalResponse<TotalLifestyleWalletDTO[]>;

    @get
    @route("/Payment")
    GetReportTotalPayment(): NormalResponse<ReportPaymentDTO>;

    @get
    @route("/SkillUpSummaryChart")
    GetReportSkillUpSummaryChart(): NormalResponse<SkillUpSummaryChartDTO>;

    @get
    @route("/FitWalletChart")
    GetReportFitWalletChart(@query year?: string): NormalResponse<FitChartDTO>;

    @get
    @route("/FitPointChart")
    GetReportFitPointChart(@query year?: string): NormalResponse<FitChartDTO>;

    @get
    @route("/Overall/ExportExcel")
    GetReportOverallExportExcel(): NormalResponse<FileDTO>;

    // Employee
    @get
    @route("/Employee/List")
    GetReportEmployeeList(
        @query department?: Department,
        @query searchTerm?: string,
        ...TableQuery<GetReportEmployeeListSortBy>,
    ): TableResponse<ReportEmployeeListDTO[]>;

    @get
    @route("/Employee/RecentActivities/List")
    GetReportEmployeeRecentActivitiesList(
        @query userId: string,
        ...Paging<void>,
    ): TableResponse<ReportRecentActivitiesDTO[]>;

    @get
    @route("/Employee/SkillupStatusChart")
    GetReportEmployeeSkillupStatusChart(
        @query userId: string,
    ): NormalResponse<ReportSkillupStatusChartDTO>;

    @get
    @route("/Employee/WelfareOverallChart")
    GetReportEmployeeWelfareOverallChart(
        @query userId: string,
    ): NormalResponse<ReportWelfareOverallChartDTO>;

    @get
    @route("/Employee/LifestyleWalletOverallChart")
    GetReportEmployeeLifestyleWalletOverallChart(
        @query userId: string,
    ): NormalResponse<ReportLifestyleWalletOverallChartDTO>;
}
