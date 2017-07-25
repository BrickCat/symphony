<#include "macro-admin.ftl">
<@admin "index">
<div class="content admin-index">
    <link rel="stylesheet" href="${staticServePath}/js/lib/trends/baguetteBox/css/bootstrap.css">
    <div class="content">
            <style>
                .quick-actions{
                    height: 80px;margin: 5px 5px 5px 5px;border-radius:5px;text-align: center;line-height: 80px;overflow:hidden;
                }
                .quick-actions a{
                    text-align: center;text-decoration:none;color: white;font-size: 14px;line-height: 38px;font-weight: bold;
                }
                .yellow{
                    background-color: #985f0d;
                }
                .bule{
                    background-color: #1b6d85;
                }
                .green{
                    background-color: green;
                }
                .red{
                    background-color: red;
                }
                .orange{
                    background-color: orangered;
                }
                .purple{
                    background-color: #5c2699;
                }
            </style>
            <div class="module">
                <div class="row">
                    <div class="col-xs-3 quick-actions yellow" >
                        <a href="#">
                            成交额：1000（元）
                        </a>
                    </div>
                    <div class="col-xs-3 quick-actions bule">
                        <a href="#">
                            退款额：1000（元）
                        </a>
                    </div>
                    <div class="col-xs-3 quick-actions green">
                        <a href="#">
                            总收益：1000（元）
                        </a>
                    </div>
                    <div class="col-xs-3 quick-actions red">
                        <a href="#">
                            成交量：1000（元）
                        </a>
                    </div>
                    <div class="col-xs-3 quick-actions orange">
                        <a href="#">
                            退款量：1000（元）
                        </a>
                    </div>
                    <div class="col-xs-3 quick-actions purple">
                        <a href="#">
                            同比增长：59 %
                        </a>
                    </div>

                </div>
            </div>
            <div class="module">
                <h2 class="sub-head">${dataStatLabel}
                <span class="ft-gray ft-13">${dataStatSubLabel}</span>
            </h2>
            <div class="fn-content content-reset">
                <br><br>
                <div id="chart30" style="height:400px"></div>
                <br><br>
                <div id="chartHistory" style="height:400px"></div>
            </div>
        </div>
    </div>
</div>
<script src="${staticServePath}/js/lib/echarts-2.2.7/echarts.js"></script>
<script type="text/javascript">
    require.config({
        paths: {
            echarts: '${staticServePath}/js/lib/echarts-2.2.7'
        }
    });

    require(
            [
                'echarts',
                'echarts/chart/line'
            ],
            function (ec) {
                var fontFamily = '"Helvetica Neue", "Luxi Sans", "DejaVu Sans", Tahoma, "Hiragino Sans GB", "Microsoft Yahei", sans-serif';

                var chart30 = ec.init(document.getElementById('chart30'), 'infographic');
                option30 = {
                    title: {
                        text: '${last30DaysLabel}',
                        textStyle: {
                            fontFamily: fontFamily
                        },
                    },
                    tooltip: {
                        trigger: 'axis'
                    },
                    legend: {
                        data: ['${statUserLabel}', '${statPostLabel}', '${statCmtLabel}']
                    },
                    xAxis: [
                        {
                            type: 'category',
                            boundaryGap: false,
                            data: [
                                <#list monthDays as day>
                                    '${day}'<#if day?has_next>,</#if>
                                </#list>
                            ]
                        }
                    ],
                    yAxis: [
                        {
                            type: 'value'
                        }
                    ],
                    series: [
                        {
                            name: '${statUserLabel}',
                            type: 'line',
                            smooth: true,
                            itemStyle: {normal: {areaStyle: {type: 'default'}}},
                            data: [
                                <#list userCnts as userCnt>
                                    '${userCnt?c}'<#if userCnt?has_next>,</#if>
                                </#list>
                            ]
                        },
                        {
                            name: '${statPostLabel}',
                            type: 'line',
                            smooth: true,
                            itemStyle: {normal: {areaStyle: {type: 'default'}}},
                            data: [
                                <#list articleCnts as articleCnt>
                                    '${articleCnt?c}'<#if articleCnt?has_next>,</#if>
                                </#list>
                            ]
                        },
                        {
                            name: '${statCmtLabel}',
                            type: 'line',
                            smooth: true,
                            itemStyle: {normal: {areaStyle: {type: 'default'}}},
                            data: [
                                <#list commentCnts as commentCnt>
                                    '${commentCnt?c}'<#if commentCnt?has_next>,</#if>
                                </#list>
                            ]
                        }
                    ]
                };

                chart30.setOption(option30);

                var chartHistory = ec.init(document.getElementById('chartHistory'), 'infographic');
                optionHistory = {
                    title: {
                        text: '${historyLabel}',
                        textStyle: {
                            fontFamily: fontFamily
                        },
                    },
                    tooltip: {
                        trigger: 'axis'
                    },
                    legend: {
                        data: ['${statUserLabel}', '${statPostLabel}', '${statCmtLabel}']
                    },
                    xAxis: [
                        {
                            type: 'category',
                            boundaryGap: false,
                            data: [
                                <#list months as month>
                                    '${month}'<#if month?has_next>,</#if>
                                </#list>
                            ]
                        }
                    ],
                    yAxis: [
                        {
                            type: 'value'
                        }
                    ],
                    series: [
                        {
                            name: '${statUserLabel}',
                            type: 'line',
                            smooth: true,
                            itemStyle: {normal: {areaStyle: {type: 'default'}}},
                            data: [
                                <#list historyUserCnts as userCnt>
                                    '${userCnt?c}'<#if userCnt?has_next>,</#if>
                                </#list>
                            ]
                        },
                        {
                            name: '${statPostLabel}',
                            type: 'line',
                            smooth: true,
                            itemStyle: {normal: {areaStyle: {type: 'default'}}},
                            data: [
                                <#list historyArticleCnts as articleCnt>
                                    '${articleCnt?c}'<#if articleCnt?has_next>,</#if>
                                </#list>
                            ]
                        },
                        {
                            name: '${statCmtLabel}',
                            type: 'line',
                            smooth: true,
                            itemStyle: {normal: {areaStyle: {type: 'default'}}},
                            data: [
                                <#list historyCommentCnts as commentCnt>
                                    '${commentCnt?c}'<#if commentCnt?has_next>,</#if>
                                </#list>
                            ]
                        }
                    ]
                };

                chartHistory.setOption(optionHistory);
            }
    );
</script>
</@admin>