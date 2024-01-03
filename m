Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A51822683
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  3 Jan 2024 02:23:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC5A410E1EA;
	Wed,  3 Jan 2024 01:23:32 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04olkn2107.outbound.protection.outlook.com [40.92.45.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B5810E185;
 Wed,  3 Jan 2024 01:23:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c7GIwa3PU6zzXGwFlCUC6MQ/YXoVr98ikGPp/8dWec8445sTSBVVpRQzVMBRrNKUK3p3NrzyR3KeUFfjJsoPquAC0ieT/gMQcJd+VOt5M6HlGVlkAABHX3Bj36Z6jbs+5mp2oz7RqlCYhQ1EtKy5aKBWFGzjp9w76SVxmRtfYf1T188hpIF4iSMPgk5z/HZlqbJ7nW6zDGnyX2F68bfTAd+e9pauJqLE3VFIYy5A31MPcZuLZhhifBWTGA9w3MrQj7xSb+8DzclHlGC8Y3Rqqz7vL5CSG1WSkYwuwxMB5gIIq18akt0F1J/jk33HvjNlqqDKuBs4uK95yr/68t3cWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rqhzsq0ssxpBP2UvAAT8gMJT2BnxnAjz9sxEhFAP6IQ=;
 b=jy+poUD1xn6qEfoGww7X78NSrCwqinT9BSL0Z7uZK48M0+mqAjMxqvDKYMVKz65xc1Ft1oSmTjKRv5kvJi1RtshYAt89tjH66e31YERhaTSlu29/t3fQRSM5mDS6HLgaBJYfQgAMqGeuGLu1z+OvZz+5gOW9xEhcEWc5Q/quNqvl8oVS6oI5lmIrcyqML0seVQzdCWKrsan9hMfb0vz5YJeCEMkPn/RLSAmnari2Rd3wUveyCDEqpaa2TZ8DBWFqwy2Dm0nTno7pHFrifwHcr4iCct09xRecCN8nvWB2W4JWOwfgFMunYTUCw/GsmAwracTERXSmnorHQLDA+eiZ+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rqhzsq0ssxpBP2UvAAT8gMJT2BnxnAjz9sxEhFAP6IQ=;
 b=HPz8QRAYLCrtlQjM6CSpLufQmIXAzze8CMmUYTCwJmNs87wyNhUoal9DwDpKZqSUuyTcCmwTwzu29HUfBMumDj91DuYD3cX6YVR0TSv7CWOYnfof8NOTg5pf99JMohP+dZnWOCvTXyaQOXghVcZg1LeiODnxNel1zIGsWR5sdlZMQon4mmyOJrwkad5wGS0mJECnXFy3Oauq9DwiZsKTjX+/c79fQ3i9WESOPWmjxuInagE0et3D9zUmA35UPN+b4PCkP70lrxpZWgXcLHD1k9VFq23B71nZFe41ISbxcd+I66nCIwvbDg9Jyuq9PdJ8B5vuQcR38NK/bOUGuSwJHw==
Received: from MW3PR12MB4347.namprd12.prod.outlook.com (2603:10b6:303:2e::10)
 by SJ1PR12MB6265.namprd12.prod.outlook.com (2603:10b6:a03:458::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Wed, 3 Jan
 2024 01:23:25 +0000
Received: from MW3PR12MB4347.namprd12.prod.outlook.com
 ([fe80::c25e:7c8b:9561:be4d]) by MW3PR12MB4347.namprd12.prod.outlook.com
 ([fe80::c25e:7c8b:9561:be4d%7]) with mapi id 15.20.7159.013; Wed, 3 Jan 2024
 01:23:24 +0000
From: Cecil Jason <jason_cecilnno3@hotmail.com>
To: "insuranceunhiversal@msn.com" <insuranceunhiversal@msn.com>
Subject: =?iso-2022-jp?B?GyRCQzRFdjxUTU0hKhsoQg==?=
Thread-Topic: =?iso-2022-jp?B?GyRCQzRFdjxUTU0hKhsoQg==?=
Thread-Index: AQHaPeNxCvV3rBkqUECJ4n7EYOzuAw==
Date: Wed, 3 Jan 2024 01:23:24 +0000
Message-ID: <MW3PR12MB43474BEB4A78FBB7EC842349D560A@MW3PR12MB4347.namprd12.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [zxCdBjcDQzGTzlziuFS6A7pfPnjWh8p4]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR12MB4347:EE_|SJ1PR12MB6265:EE_
x-ms-office365-filtering-correlation-id: 6a9a3fc0-1d78-4c6d-6117-08dc0bfa9490
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cCOCXuORZjHh9LwtVshdpBqvC5nOCMvQVOjaoiHcvA03cHKsnKheQ/O/1DCK55lwP1u1xuFUwjde6lSEPOjAd6lUL6uaVgsEGPg+qENPQ6cZr90G8CllSfCSf/7TjRUs82g7kWhj6b1+HjLfsCPgxYFhMTk6R0Fy6Ggye83+3v22eJS5rxIsMdh/9CX0Ej5L6GFvjuyiU4jrYgBPVYTSxFir3bQleupCXZFSHBi15Z1R39WCMWQfD7G7DVfZ44KrSCmrEBq0zE0zR7N+sX/VIESP+blGArswYoI2G4/HxBMeo48BQkbrvE29IvfmSFjjP48NHipVT0tTOvT4p+83FLbaggDzSQFhfDk22mvkRF2HvuqSYcOzpBfAhzflvIy29mhm08hjH6lHcKNUCCiReRWx/zqO67uB69ZHofpHaLfATDIerkHG/wfLg06FsAsFA7YgxgOo8cvVX5gluJbG/l6Z+5GoYdb4kb+xjz3DlplwDsnSvVxdgJLYWH9goD1Da+GW+sIeyt1o5Q1Snz2QLEoZ1mlvb1gkgGMtEsGgZzSO18uHLccR1zvI4TKnOh+0ILeMIgal34ZjqsPK8m6O0Lhh0dGJqAXzT9QtUYWLPWDwnEx5k9i0LiWe3MTlsHUaIFYXgeP/86mMLZ1wYx4uWc6Nag/Oi2tJyUtVNwfvhQ8=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?WHZ4ZFRKVmZGVkdDbHhSZE5wWjk2V0dGU0hhYXNwYTY1MElFSEd1NE9U?=
 =?iso-2022-jp?B?czd2VDVtMVRuMkJ5UGQvV3QrZXN5MmhoL1JmUkowMGRLR1V2QnpiZ1kz?=
 =?iso-2022-jp?B?bkFQY05FN2pmNVc4ZWJFMTZtQ1VnbDJ3dFQ1MEhiZmZCNldIZElzd0RB?=
 =?iso-2022-jp?B?Q1g0Z3lvQURRN0hnTk5LTjV3Y2dCc3hiNUd3UGxEU2E5dElZckVGSVhj?=
 =?iso-2022-jp?B?emVZQTZmOUxkenhYZUlVYlNhaHpVdlVFS2dZRmZGeWp0d2FZWllNVUwz?=
 =?iso-2022-jp?B?V3QwcWNoVU14eWN6SERoNFdMSGsybmRiR0lMWkhDbTdOMmdXNDY1MmYr?=
 =?iso-2022-jp?B?OHZ3TC9VdU96bG5PaE52OEx4cS9SR2dqNnRWa2hZRFB6UzYzUEZwWUhT?=
 =?iso-2022-jp?B?ZzNLeXpRMkVZNlVLbjNSeGZtUW5RWjM4M0k5N29BYlB2eFpBMXZ5anQ5?=
 =?iso-2022-jp?B?aUcvb01IWHdBcmo2eklsTElKenlpSEFvZWliTDgzcWx5V3laWWJKUjR2?=
 =?iso-2022-jp?B?UCtMQXoyWEJpekVQaEhvaGg5UFZVOTFEZTZyYzdIVk9tV1Ira3ExSC8z?=
 =?iso-2022-jp?B?ODZBM05OZjlVTzc0QjJTQndneEhEWlJRdzVCejBsTUw1V0FkK2RZT21N?=
 =?iso-2022-jp?B?TUNFdGlkb1RoZjFiUHJRbnVJVG5yOXFhRU5hNUJTQjVGWWVNL25MTVZl?=
 =?iso-2022-jp?B?WVlIaTVQekVEbmtwdVZRRExXbElmRVZoakdKK3FycS80dW1ZV3NjZlNz?=
 =?iso-2022-jp?B?SDg0WTdxZDBjWVJwdVBLbE5sOUNEWFBPaFNkZlc0d3p6RFRJR0VQMHlY?=
 =?iso-2022-jp?B?Ylc0Z3cxTjloUjg1Z2d0dlUyVFlES1REMEtRNkh1Sm9FQjRSWTdHQm1M?=
 =?iso-2022-jp?B?bExvN0hkMW41TkRkK0pmS3pqY0poSkV0ajZyeHIrZ3Zac1hocjVzVDFI?=
 =?iso-2022-jp?B?RHNRckFtUTd5NThEN0RyVlppcFJHZzFWNXRmdjRCc0h5Q295REVBK0RP?=
 =?iso-2022-jp?B?R0d4Y3pvTXliakFEdkY1MGtna1UzUzdINlQ0eXk4NTRMWFZOdDZQNXJO?=
 =?iso-2022-jp?B?bzllcWtjOFBkQ0twbkNWbjlFT3l5RXlzZHdlYy9ZS2JtcWRJbmpZYi96?=
 =?iso-2022-jp?B?TnNRRkwyRDI2VWMyeFBDU0tweGlSbmorWDlIRm1ZSkZqaW8xNHh6VlhU?=
 =?iso-2022-jp?B?emRQa2lHUEdibGdGbTlrMkk2bHRRY01oOVFPcUh6RkpzaUdHTWNoc0Jo?=
 =?iso-2022-jp?B?ZEhWYWpMOTdMQ2QxVHB5aTVNTFBBRlMyY2tKQVJoUUY0V2lraHhzVStL?=
 =?iso-2022-jp?B?ekdrQVJkWklQUHBLZ0VSc0FiaHcwano3Mmh0RXhRN1JRSGJiUEtoL2dW?=
 =?iso-2022-jp?B?U3pLQ25VTU5kbldtSTZza2Z4S2ZDN0ZqeWZkcHNSR1VQcmFrNjkzVGJU?=
 =?iso-2022-jp?B?eVYrUlptUTNPYzVFKzk3VW1RYXk1RzNVamlNZ1dpb1UwVDRZbkVOSUsy?=
 =?iso-2022-jp?B?bG5waWIzU3ZvNWU2KzZublM3S014RDlpb2RZYjNjcE1TUkQ0QTBpNmhC?=
 =?iso-2022-jp?B?QUdmaVl1aDQ2Y0ZqRkVTdnRjY01aVnoxSG5sR0FzemVCOGZPZDlodWZp?=
 =?iso-2022-jp?B?SmlLL2ZJTnl3MVdYamlUNFFFUWw1eVFUTy9rdXdndVN4Z0g4ZGFrQmlD?=
 =?iso-2022-jp?B?akRtM01zYktPOEJoeG9pa2pnRDhzeUh2T3ZwV2NPcVdnSmxCb0F3UVhh?=
 =?iso-2022-jp?B?ZFlkaFpwSFlYZ1M0M3h3MFpPR1laRjZ1V0MyYUs5Y0NGU1NBRGZqNTQ9?=
Content-Type: multipart/alternative;
 boundary="_000_MW3PR12MB43474BEB4A78FBB7EC842349D560AMW3PR12MB4347namp_"
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-5183d.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4347.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a9a3fc0-1d78-4c6d-6117-08dc0bfa9490
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2024 01:23:24.1662 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6265
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--_000_MW3PR12MB43474BEB4A78FBB7EC842349D560AMW3PR12MB4347namp_
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

2023=1B$BG/?M5$:G9bIJ<A%9!<%Q!<%3%T!<%V%i%s%I;~7WA4?7EP>l=1B(B!
=1B$B:G9bIJ<A$N%m%l%C%/%9;~7W%3%T!<!"%+%k%F%#%(;~7W%3%T!<=1B(B
=1B$B%V%i%$%H%j%s%0;~7W%3%T!<!"%Q%M%i%$;~7W%3%T!<7c0BHNCf=1B(B
=1B$B>&IJ$N?tNL$OB?$$!"IJ<A$O$h$$!#3$30D>1DE9D>@\Gc$$IU$1=1B(B
=1B$B0B?4!"?WB.!"3N<B$K$*5RMM$N<j85$K$*FO$1CW$7$^$9!#=1B(B
=1B$B<BJ*<L??!"IUB0IJ$r40Hw$9$k!#=1B(B
100%=1B$B$r87<i$9$k!#=1B(B
=1B$BAwNA$OL5NA$G$9=1B(B(=1B$BF|K\A49q=1B(B)!
=1B$B$*5R$5$s$?$A$bBg9%I>$G$9=1B(B.

=1B$BEv<R=1B(BURL:https://0rz.tw/Og6XH

=1B$B$h$m$7$/$*4j$$$$$?$7$^$9!#=1B(B

--_000_MW3PR12MB43474BEB4A78FBB7EC842349D560AMW3PR12MB4347namp_
Content-Type: text/html; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-2022-=
jp">
</head>
<body>
<p>2023=1B$BG/?M5$:G9bIJ<A%9!<%Q!<%3%T!<%V%i%s%I;~7WA4?7EP>l=1B(B!<br>
=1B$B:G9bIJ<A$N%m%l%C%/%9;~7W%3%T!<!"%+%k%F%#%(;~7W%3%T!<=1B(B<br>
=1B$B%V%i%$%H%j%s%0;~7W%3%T!<!"%Q%M%i%$;~7W%3%T!<7c0BHNCf=1B(B<br>
=1B$B>&IJ$N?tNL$OB?$$!"IJ<A$O$h$$!#3$30D>1DE9D>@\Gc$$IU$1=1B(B<br>
=1B$B0B?4!"?WB.!"3N<B$K$*5RMM$N<j85$K$*FO$1CW$7$^$9!#=1B(B<br>
=1B$B<BJ*<L??!"IUB0IJ$r40Hw$9$k!#=1B(B <br>
100%=1B$B$r87<i$9$k!#=1B(B <br>
=1B$BAwNA$OL5NA$G$9=1B(B(=1B$BF|K\A49q=1B(B)!<br>
=1B$B$*5R$5$s$?$A$bBg9%I>$G$9=1B(B.</p>
<p>=1B$BEv<R=1B(BURL:<a href=3D"https://0rz.tw/Og6XH">https://0rz.tw/Og6XH<=
/a></p>
<p></p>
<p>=1B$B$h$m$7$/$*4j$$$$$?$7$^$9!#=1B(B</p>
</body>
</html>

--_000_MW3PR12MB43474BEB4A78FBB7EC842349D560AMW3PR12MB4347namp_--
