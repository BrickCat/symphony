<#macro head title><meta charset="utf-8" /><meta http-equiv="X-UA-Compatible" content="IE=edge"><meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" /><title>${title}</title><#nested><link rel="preconnect" href="${staticServePath}"><meta name="copyright" content="B3log" /><meta http-equiv="Window-target" content="_top" /><link rel="stylesheet" href="${staticServePath}/css/responsive.css?${staticResourceVersion}" /><link rel="stylesheet" href="${staticServePath}/css/base.css?${staticResourceVersion}" /><link rel="icon" type="image/png" href="${staticServePath}/images/favicon.png" /><link rel="apple-touch-icon" href="${staticServePath}/images/faviconH.png"><link rel="search" type="application/opensearchdescription+xml" title="BrickCat" href="/opensearch.xml"><!-- //for-mobile-apps --><link href="${staticServePath}/js/mall/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" /><!-- pignose css --><link href="${staticServePath}/js/mall/css/pignose.layerslider.css" rel="stylesheet" type="text/css" media="all" /><!-- //pignose css --><link href="${staticServePath}/js/mall/css/style.css" rel="stylesheet" type="text/css" media="all" /><!-- js --><script src="${staticServePath}/js/mall/js/jquery-2.1.4.min.js"></script><!-- //js --><!-- cart --><script src="${staticServePath}/js/mall/js/simpleCart.min.js"></script><!-- cart --><!-- for bootstrap working --><script type="text/javascript" src="${staticServePath}/js/mall/js/bootstrap-3.1.1.min.js"></script><!-- //for bootstrap working --><script src="${staticServePath}/js/mall/js/jquery.easing.min.js"></script><#if !isAdminLoggedIn>${siteVisitStatCode}</#if></#macro>