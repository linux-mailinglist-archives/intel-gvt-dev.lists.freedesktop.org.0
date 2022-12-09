Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E70647E4F
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  9 Dec 2022 08:11:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D38CE10E1F9;
	Fri,  9 Dec 2022 07:11:01 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B345D10E236
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  9 Dec 2022 07:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670569856; x=1702105856;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=X0QvwowBr1kPUtwbXWalv8duloFNbUnS7BTqi9c/C14=;
 b=CSXd2Ga+DnoOTiWJZR1SKtaqYyn0tYlKwv8ztcYpHtrggUcLBZVdar5L
 x+InI7VIa4fBK7PjxbNZh4vl/H/6l/QHzcsN3lEiEUU/zguwd8leLmick
 Zymev1yipoJLKz7H9y/8QBPSLCL2SRQ5dpdo+OgmDpLxEEB4dMSorkz+m
 OEHBYptLoc0ID8jSz79kyp92ZUvsFeoBYyoOxF/s2CRYJgUpUK4YFJm4Z
 8ltUTybtMbP41HNm40B6tBDkfVLBjPmyEGQbR3RbGou32oLm2e2yBan2K
 y1TZ86qfEDQZRnnpu5L4Vk3vJVWVVzEONsfS2I1AfqxGWAcSmODABf8Ls w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="379611110"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; d="scan'208";a="379611110"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2022 23:10:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="771775442"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; d="scan'208";a="771775442"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 08 Dec 2022 23:10:55 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 8 Dec 2022 23:10:55 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 8 Dec 2022 23:10:55 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 8 Dec 2022 23:10:55 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 8 Dec 2022 23:10:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D/V5PppJRyzGTD7beUsZ+1svtv2G1lj85qbjb36AuhJ1MfpqAFr5jIl9UaVEdg3M8Xb2ybK7YLjgzvNryEh14sBs5lHSiFwMvmJINdCaY3paDwdW43tjaFW9SuYKKvzVOW0FRJuOtGlw8wdO/FnpN89q6ARZBBT0bpMg8EpEAtZB9vtQjWjYODkFRHrjHFXsqOl5G176G3M49kTXGa5RolscgKBG6vQJen0lFmt5MPIjtQooB3AR9rm5ZF4Ez46L12C1ORT/9RTzOvuufQNiyzg/hpPczQ/CqHes9ugmd24nZmTjhYbv+PMV/ml5MWSZU0SocuMpx+fNseG9z6BINg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lF6AGJFxjwxC/9CaAIAYP/M33uh1F67LszsnBSquhTk=;
 b=MRSsCdE6EWm4IJUDvq/3vpiIZqbhMxBbaLqq5sY7DOC+mXFQaRrDIhM+VQhkUiykyakuj+ryyeARHigWPtZ91a8slybS8kjGQJjIWEacsCS2rj9Rvrjv81/4bpocOybuYhV/iWZzXWh81ywt1KSF1C2uV1UV2TiL+8xlEciFF5JOPeszlh0ORyZ5NoNTzyns1YBj91bYl0QSEiwOInYllD+Ei+kAHXE+Bul7uI1voVHZ+8HLt3+IP1IG2Ox23HGTnOemohBpaDPa2I1t+vFYavhju0a06p9hP+J3UC54vSdmz/H/nsy+rlLCSJfrxaJ0rbKeBK5B9eoIJYjQAgmF0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5538.namprd11.prod.outlook.com (2603:10b6:610:d5::23)
 by CY5PR11MB6367.namprd11.prod.outlook.com (2603:10b6:930:39::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Fri, 9 Dec
 2022 07:10:53 +0000
Received: from CH0PR11MB5538.namprd11.prod.outlook.com
 ([fe80::8db4:2bd7:1f20:1ff1]) by CH0PR11MB5538.namprd11.prod.outlook.com
 ([fe80::8db4:2bd7:1f20:1ff1%9]) with mapi id 15.20.5880.018; Fri, 9 Dec 2022
 07:10:53 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915/gvt: Replace open coded hash table definition
Thread-Topic: [PATCH] drm/i915/gvt: Replace open coded hash table definition
Thread-Index: AQHZAw56UnwIDW7yck6IJOdsTtsSqq5lNJVQ
Date: Fri, 9 Dec 2022 07:10:53 +0000
Message-ID: <CH0PR11MB553854EF80C8D5FAD1F51F2DCA1C9@CH0PR11MB5538.namprd11.prod.outlook.com>
References: <20221128095645.672028-1-zhenyuw@linux.intel.com>
In-Reply-To: <20221128095645.672028-1-zhenyuw@linux.intel.com>
Accept-Language: en-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5538:EE_|CY5PR11MB6367:EE_
x-ms-office365-filtering-correlation-id: d02ac384-aed4-4bce-927e-08dad9b48279
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZIa8YCpdbBB+qKBkxal9UqA4quhNTuZ7GOOvEpYq5HWZEfvb+v2BzCFsRhuzEuPI36RWvrqpecO8go9pjroPoXCri9IjKJTxgLgeOy1em5w4akC1EIaaJuvPZSiDtvx4gMga6fnBrrVGsnHCGSWGVTssv8zRsf5jqhqKY9LmGJAuOIQw0UKuHJUupOoFd9oAMX2el7/EhGy+3srt+8wLxYPCVUUyP3DGTT9ugHF8RW1YbSX+s3O4LUt0TQOhwHyhp7f+Il9JPAKH8dkbA3GBcOycSMTE80vxVbpJ4vFe0DS/SOpJo/QEThszGEotB9WkvmceU3zJPRDZFfpGJV2ew5iVNA0yYNl/r9fC/uEnLX295F2Ucu5kWSzjbf1fBLQDfjnOCdYlAze6yAzBhVU6v9i1VzXMfGAJTgRFpsVFy/JZV8BQuuZ8DQsnn7yAHNKJKy5F1ARqy/c3dCx5UtUUAHNIr+rDwT4m9AUoCB1AAb4dhDdTW0rNxzHnrjwHlBGlXw9vikPYXok1+Rg3HXlfrWlKgXcwF1Vs9X0dSk9/7OfQD4Hf+NAE0VLqTrgYDhy9MOPguYpyqXRvpLo2HHQ4As6bHIooNKskV7oZ5amTmLcpI5SH9rjGLV2qgnXacG09KdMYsJgzU2v9S2xUYZz9ZfuQH+6OslHYrFKo0fk0D5kPLazuVfUWcWeXCiErEG7q
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5538.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(366004)(136003)(346002)(396003)(376002)(451199015)(33656002)(478600001)(316002)(110136005)(186003)(38070700005)(55016003)(86362001)(26005)(122000001)(9686003)(6506007)(38100700002)(53546011)(7696005)(82960400001)(8676002)(66946007)(66556008)(76116006)(2906002)(71200400001)(41300700001)(4744005)(64756008)(83380400001)(66446008)(66476007)(5660300002)(52536014)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Osl0y6uOQEbp9pXsH81/8V8EujUoshCfpRfL174iBKmSf8mP8fIVoupb1XY6?=
 =?us-ascii?Q?tjD4zJbnw/Nc76ftGw8buuLzKee0ZIVqfLu1FEE+0Pj85Xb8B+5xAzN27kyT?=
 =?us-ascii?Q?eMhu06rnwzkqAmme03sOtKOsqqfJboQLvF1W/rMtsSnlw6hRTbNmqqUMFHeg?=
 =?us-ascii?Q?xLcvXItrLN5Uf0FKIorv3b4fYdkKsJ/5vi34FWc8tHoMHal/DNL1hsDPqcyE?=
 =?us-ascii?Q?cuMF0A84UUhrPMtAB7E/aA153W8ibPhd3We8ULvvxK2wRkWXBcTFxab9ZFTa?=
 =?us-ascii?Q?kIqMsGRc0x3/tFCgW3UVRwosl8hVGAKN41h6KgoRD1NUUIBQynnh9zbekNw/?=
 =?us-ascii?Q?hk0H+O5Rm9+C3powZVdXifGtcg/+49eitpS8bXumn1P98tcusd68Q+ziVW/o?=
 =?us-ascii?Q?175tYQGABkYC0d4pqgJ6Z2lhdRd+z8RUw/SWBHg6mI3uuIH5DDvNdJq1j3ts?=
 =?us-ascii?Q?PiF73v4Qk8gJ6L7mbLLvtqU8AAFPJ/L3LhV1REh0WnwSei/884IJUsTkuwEQ?=
 =?us-ascii?Q?52sXRUfyyZXyM8E+x+91wJb395bPpytAtgX1m48kL0K6vY55+toThOAZMwbs?=
 =?us-ascii?Q?AiTbhpFGWJ27RFo+HZe6kijVHkkPk1I0W2eYBEpqDyArwfVRHCiRonzfyK2A?=
 =?us-ascii?Q?MbnDSGL8MGDgCCq3GF9tIR3/Mp5vGRYX1IwDwdOezUE9XZHYHy2PMCWrWQt3?=
 =?us-ascii?Q?Fjyw5oZy0B8GkLoyKCLSKuPOUezcDseqAJcV2B6LtBGLBHs7SL3uYbi0VT+/?=
 =?us-ascii?Q?shirS6Pq+qJxjKb/DXHcPpZ5o9F4h/1BsYlg4IDB7UbRHmZzlfGMWTOBPs33?=
 =?us-ascii?Q?P/DDMZiuvaiXfTzzOSrMVvLeZ8UTwtV7Yb7LVW3MImy+8xHKiI8A1v4hxUnp?=
 =?us-ascii?Q?Q0/7flmUcJ3IPAQ2yNJs7b0HLoZUBV78rEccRc4HH1bXxRZkFAdE59c7J6Zg?=
 =?us-ascii?Q?BL5FH0vnqIp5QHmZYnW3mmHKF30Dl+B28I16R0X+qAy3b8keJz6SttyhDy7m?=
 =?us-ascii?Q?PHdQzkN/Q68RyMaHphEilCAZeMuMjGym8wPn6JG7FqevbfqGjKqZjte7p/Z2?=
 =?us-ascii?Q?K/1p/MHHSmZlmlfzCFxwEY5WH2rRjcvFL6Cs77al0W5+gTAJe7CxhJE3t0Ac?=
 =?us-ascii?Q?Ow0PRkDsuyXD/0SHldyE2f4PnNziZbVWPwK6Qa5jpUQSXmXTx942ApPrX5cK?=
 =?us-ascii?Q?Zx5ta0DSdoqkfwD6FTY8loY6huSH1UD5n58MM6l1fqNMNgkEg9v5AddE5UbF?=
 =?us-ascii?Q?5yeBgoe1MCpt0MyWQuC+A+6MAZ9N9RCR5DCAucQ6mvVgVnF7uDppUZtUcMzH?=
 =?us-ascii?Q?VcpiDh9HC35sYlWVPdvAT6ZoYOUxkdwvg0HWx8kCtFI37tzYKd0J7TBnjYhQ?=
 =?us-ascii?Q?auoT9ww+kMhJP1cc7QHOSVTmekZRtNgFeHRdQ8Xx+BKWYQQZdhdlQoqZ19kh?=
 =?us-ascii?Q?PEDms4I5ZKldCGSAaTUY+KrrOmu0RobiwkHl7rOoGrkJLzoINV8TJ6lye/U/?=
 =?us-ascii?Q?R3a9ri9JLQ/NXc0tnwAwmFGA41RSDhWPjLVXvLUGLtqGkVDe2EbW24u5mMxa?=
 =?us-ascii?Q?eGXXSXvelmqscjrx6e9YzxqGloVl3BOqNl1T3GcQ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d02ac384-aed4-4bce-927e-08dad9b48279
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2022 07:10:53.2223 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ijDTH308SrAEcPc+9i0tej37JjpfPSE+B+ToDZ0Ido+wrgKpltQ3wpnzhVkFLVEQ5wBsTsZVGS6+jp8PZLC36w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6367
X-OriginatorOrg: intel.com
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

Reviewed-by: Zhi Wang <zhi.a.wang@intel.com>

-----Original Message-----
From: intel-gvt-dev <intel-gvt-dev-bounces@lists.freedesktop.org> On Behalf=
 Of Zhenyu Wang
Sent: Monday, November 28, 2022 11:57 AM
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: Replace open coded hash table definition

Replace open coded vgpu write protect page's internal hash table definition=
 with generic helper.

Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
---
 drivers/gpu/drm/i915/gvt/gvt.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.=
h index dbf8d7470b2c..51aa82445ed7 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -230,9 +230,7 @@ struct intel_vgpu {
 	atomic_t released;
=20
 	struct kvm_page_track_notifier_node track_node; -#define NR_BKT (1 << 18)
-	struct hlist_head ptable[NR_BKT];
-#undef NR_BKT
+	DECLARE_HASHTABLE(ptable, 18);
 };
=20
 /* validating GM healthy status*/
--
2.35.2

