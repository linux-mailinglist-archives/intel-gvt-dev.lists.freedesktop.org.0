Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA43D6CFC44
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 30 Mar 2023 09:10:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9744010ECE2;
	Thu, 30 Mar 2023 07:10:04 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01CF210ECE2;
 Thu, 30 Mar 2023 07:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680160203; x=1711696203;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Qx4uCV4cDurGqU7EAaUbQfLdnzQCwhkcfG8EEtySWl4=;
 b=EACeJu1wJKPOQPaNxqS1IK0keczRwHqJ3IyLDwEcC0T1V1x3EHAw3+8b
 zAbi5tMx6aqO30BpQSbZX8Mr82XKePRTtcVumEJ1Ptmi8kGbOLjakxB/5
 JzX4cnADyOd14hbnr+J+wLlAItTyugNgZMEhDdaTcH5iQa0t4fJZ7mOv5
 Ixy/jsEdW2VhW3HqeN4Np45dypQ6II6VWEa2oOhvKGE9jxhLsY3sl344o
 K1KPJy9ZylsU4xg905w7xgLE38gwWGZYKsd0Bjp46Lw7EUI5MPfrHOB3k
 sKtAq91OjNDzFt2H8i3jgUN4S6ye7sZfFtsj0wrUdDeiK+PYPL1Zg4xLF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="342700920"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; d="scan'208";a="342700920"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 00:09:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="808525057"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; d="scan'208";a="808525057"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 30 Mar 2023 00:09:35 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 30 Mar 2023 00:09:35 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 30 Mar 2023 00:09:34 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 30 Mar 2023 00:09:34 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 30 Mar 2023 00:09:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X2DRfaLjT0QTpfbbJlMpGCQL74bVtL3IrDITKoTedHrQ1Q7xbWiryv2w6DT/xODi8Wkcrxz/DolqN0ZaR2H3WrroMgM9EbAJf81ui+M2rJU5j/8dGmgHfldeUacU2iskq+U2vB0rEt4bwAMVq22jGCLJDsQAN+thQgRcQgLjXuWRru02IotdiXrJs+UgjeeOPm4LTS8BWQCnX21g9PeY7Wk+vCunsasOp16s5uqp4dTGLzNC0Yv4DhGIbPi6ySM2Y1s27OakfOmw9Aq2lPZkbmYsP/9l6PUQpvRoaPj1s9y3p4kIna3fiArZNUt6v5zDXJQJviTICtrG1MGdX6FJhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qx4uCV4cDurGqU7EAaUbQfLdnzQCwhkcfG8EEtySWl4=;
 b=INgz/Yipzk+tI0dUzvOXl3hhHSZltNyh7NctAFgOUcswFlGvEd5nyr0WnV4nvh0fALU3pYZXOQbMfZ23F5DKtWNDy6yS/Sl9DWtaJRjU+xgf8UGm2aZ6U4Zc9HwC7ybleRWxODlQ0jxlMrMlnCh44F18z5CmQ8huPKUUyCmsv58VXTlGyBmwGd1DFq+5J3hNO6y9szPFiae0Abd6U53Mn458JAVVEYY9DOP12kDYlTysfHD12RxXKhTRRv5xm0qd7GLqWSPFdkKUKFebVvZZg7DBijLPDbrVUMSahyROQDYSCP/uLnQWwPR120VcVaev7ygIKCAa2FXG7RAiLLnALQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by MN0PR11MB6086.namprd11.prod.outlook.com (2603:10b6:208:3ce::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.29; Thu, 30 Mar
 2023 07:09:32 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::ca24:b399:b445:a3de]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::ca24:b399:b445:a3de%4]) with mapi id 15.20.6254.020; Thu, 30 Mar 2023
 07:09:32 +0000
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: RE: [PATCH v8 21/24] vfio: Add VFIO_DEVICE_BIND_IOMMUFD
Thread-Topic: [PATCH v8 21/24] vfio: Add VFIO_DEVICE_BIND_IOMMUFD
Thread-Index: AQHZYJBFW/d43vElu0ifua7qv0EiF68SQfqAgAChOOA=
Date: Thu, 30 Mar 2023 07:09:31 +0000
Message-ID: <DS0PR11MB7529A19B0368DA4769444B84C38E9@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230327094047.47215-1-yi.l.liu@intel.com>
 <20230327094047.47215-22-yi.l.liu@intel.com>
 <20230329150055.3dee2476.alex.williamson@redhat.com>
In-Reply-To: <20230329150055.3dee2476.alex.williamson@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7529:EE_|MN0PR11MB6086:EE_
x-ms-office365-filtering-correlation-id: bf7ed9d1-19ea-466f-b0ef-08db30edb5cb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yaceRVGrwf9ChWBa3/nggZaww0intZCmJHniEFuIv+arl+Md0h9BbqOSVONBbWJBYdnndxIspffCONxSIGGjEerTYjO1R/tQEjJwXpcsaHhQaE82zj9zybjIiB4EwVEqd5nBU8ur63OwL7HsIiSTlDYj7QbAMBx5H8JNaDuEJnmTAnwCxw7noOt6gj2VW8JcvVg2ggqht/DtZWEZ3Gj/WRJKwAZDWk3YG49xBMzTx+7AUimFw/tI6IZWsxbKPpYXE4VZ9LqvT9JdHulaA2RA2j/jjUf0EEzxfBn65gNIKPQbX1KbnHZ1bW5XDNK8gezJqDhvfPEvoObHBGfILcWtXdgrGxPcQ2Cz1rc3XfNq0wLvO1BbiESJObWrheAGXBumx8KMnA5f+kCEceoYE16TejggCUsnNQiWoi4On4+0tfEY1eRp/L0OLyYTaUkhWd/kSqMtYw/gifFKwaoclPPVRPGa3wJuFNrPyARUXiAoQajpUqHVCPJapHXWthmgTDOT4Q1ux2GnooAKo2l4ntJxWhuBNYIZEEvtJqtZOLeZV/GOXTNvCQKNHuLsUDd0V1gclNnp9HImJThfedKHNPLLfyirJ9oR9DNKE1PnBNlJzTYfzlZSUczKj7CQxQxDF9EkuHCY/ZmFtf4cE9kDwve9vA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(39860400002)(366004)(396003)(346002)(451199021)(2906002)(83380400001)(6916009)(54906003)(64756008)(8676002)(76116006)(66946007)(66476007)(4326008)(7696005)(966005)(478600001)(66556008)(71200400001)(26005)(38070700005)(316002)(9686003)(6506007)(55016003)(7416002)(186003)(30864003)(52536014)(38100700002)(33656002)(86362001)(66446008)(122000001)(82960400001)(5660300002)(41300700001)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UDVDMjFqa2czSEZMdDVLWmVEL1R0VVJ5YnViaHF0SDdJWGFqZ3pzaTVxRE85?=
 =?utf-8?B?cFEyZ1ZkTDBZelIvT2JwSndVaGMvOGpNaXJqNVJWbnduRkhIdlIvRWg3MHJF?=
 =?utf-8?B?dlZRdjJ4Sk0yUDEzemRXWmV5eGZEODhCUkFNK2ljelNvbXNNL2xONHZINmFK?=
 =?utf-8?B?Uk5XaEZHbEFFcjZwVUZIYlNrRW9oaHlOeVJPVnR3cFQ2RVlOeWdTcWFZSnd6?=
 =?utf-8?B?dzNua3ZrRG5NdVNvbTl3OVdaR3k1alpEejhUd1JFWC94UXhRdkJ4MHZPRllF?=
 =?utf-8?B?bWFvWUpxNHJoRXpGb2c0R2FraU9JMytwdjZldHVOMVpIaXJPSjlXMkljR3du?=
 =?utf-8?B?c2pVU3JULytKSHpqQVk4ckdmS3JEdVk2eE9QbjcreWZzVjVvTHF5NXd4aXV2?=
 =?utf-8?B?ak1RTFBXazRtWWZXNm5CRUFUcldlWk1kc1lBYmh4ekpNckZhVW1xcWc0dVV0?=
 =?utf-8?B?eGdoaWViMXBpMmNRN29NK1lYdVBNdVJMSC9HbXdLcWFiRHdQd0hXendOM3VQ?=
 =?utf-8?B?UWpaU0doMDVCQzVPMGdnWHVWc1ZQd0tTa1QyMzhSd241YnVtMXVNN1VxMGpq?=
 =?utf-8?B?RTdUYkpXU0o1TEdjYzRBZ1NkZnpGOEtKMmE2ZUQxaTZqWkxoSzlLdSt1Q0kz?=
 =?utf-8?B?aWM4ZFBSbng0QlVVajZobmVhMi90T1hDQjlkY3B6QUFOTCt5ZjUzZFBYdEpT?=
 =?utf-8?B?UjBuU0xjK2wxU1NYN01vZ2RHYldqVGs2UmpYQUhaNENRT3JWVGR1OGdhNnVX?=
 =?utf-8?B?TzVPUXVDek8vRzZhZXJCaXl1VkM0R2lvc05Ja0xlWm4vbXlmOHJWaEJ5Z2lJ?=
 =?utf-8?B?S0xLS1ZSbEoxUnFkTTBTb0lkRnZtWFFxekJRcWJTMVR3U0FyM1JpSlByWjBm?=
 =?utf-8?B?TlpkU2FSQ3RjTDZpL1p4d1FCWEE5Z3BuaXpXU2kwNHFGdEpkNCtScHRKK2hH?=
 =?utf-8?B?TzRQN2Mwc004Mmd4eWtHT2VScUxRdlQzL2g5dExmWVNSTGRqWHNXZlBuU05h?=
 =?utf-8?B?aUlvc3h0ZjZRU2kxYWxNVXdjQzJTcDZ4KzUvTzhrTnNUU0tIRDNCR1ljTUxa?=
 =?utf-8?B?b0dZZ2ZZcWFITHNYT0I2MWJHSndCcmUrM3ZFbi9xY0k2MHN4TzVmY3g5Q1lC?=
 =?utf-8?B?STk4YXZnUHU2UDh4cVJnU3hWcGs0eEwxMThoOCtza0hBVVJSODJ0UlB0ZWRP?=
 =?utf-8?B?NEtFVkt4cFQ2K041OGpkM1BxbDljbHk2TlpNeUFpWDN1d2NmMnZUcXB6R1Zm?=
 =?utf-8?B?azBza2pSMUw3emo2VlBseXZoWnAxODQ4UkFxVFBNWStuaG9pTTFtTGFtRW1S?=
 =?utf-8?B?MWZWcmxlRDlUYnB3YlVFdW9BOGRROWJDdnFDZ1oram5vYnJ6RHNRbUJ0QjVs?=
 =?utf-8?B?ZDdraDROTnNQY1JsRWZSNE83Q25vbkI3aWtqMFBlKzJ0S1JUdVV3YXpacXMz?=
 =?utf-8?B?cmR5NXcrYkJHRzNEUDBvQ3VQS2prOG1mRlhWVExvOS94eW9sREFXUDBEb3Js?=
 =?utf-8?B?cjl3RktNbjV6K2JyaVZpbnlFdkFrNGNkdzcrcHhUWjVCM3VyTXo4S290T3lQ?=
 =?utf-8?B?S3BjeG14MTRiQVNRS01EYjJwRVIrV05vdzFXVlVFUTdVenhEVWszMnoyYVpD?=
 =?utf-8?B?ZXRaK3FuU2xmTEtLNno0M0p4QXQxaVh6T1NpdVI2ZWtuaTQ3L1IrblIyR09V?=
 =?utf-8?B?a1ZtYmhNVDZvbmhXVStmUm9WSDFyeHpaQmJZNVVnUFN2d1h5ay8xZHVIQ0Ix?=
 =?utf-8?B?QmErRVFTeEd4aFp4VzJ0Znl0WnRFR3Y4SFlOeGRTWU90YVh4Rnd1OUpJYklO?=
 =?utf-8?B?Sy9DUUlFMEVYQ3FyWlViY2JQSHhDSUh1RnAzcEFNdEVDM3pBRmgzSmhMVlVL?=
 =?utf-8?B?UHUzalFoZFNLME10YzhBczZESmF5OXlwOGFBSnlBOTNycHplQyt0L3ZWV0Rr?=
 =?utf-8?B?VWFiK3ZTKzNFYktIQndmZERUdjJST1k0Y0grWHBRYlRaWnJ6Q2RMZ0NmSlZr?=
 =?utf-8?B?QzhtOGJiZmExR2doMTZvdW5rZTNubThCckRMQ0FaaUFkNWxLUnh5bXUyU0VV?=
 =?utf-8?B?cDJNSk8zWU1WOUlPL1M5QXNHNXpnUHdVSTE4ZGlKUHNCVjJxY2FJa3U5c2pK?=
 =?utf-8?Q?Xo6JaS5cVqPF3nuud8NyWJ13h?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf7ed9d1-19ea-466f-b0ef-08db30edb5cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2023 07:09:31.8425 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: StltP780seLiC09O7vZHuOcBM6lGOCAziwzKHgRuirKE5xCKGfMdRuDhSzy73Y900l4P6CTw/SFdTCkR+6f2/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6086
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
Cc: "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>, "Hao,
 Xudong" <xudong.hao@intel.com>, "peterx@redhat.com" <peterx@redhat.com>, "Xu,
 Terrence" <terrence.xu@intel.com>,
 "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "lulu@redhat.com" <lulu@redhat.com>, "Jiang,
 Yanting" <yanting.jiang@intel.com>, "joro@8bytes.org" <joro@8bytes.org>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "Tian, Kevin" <kevin.tian@intel.com>, "Zhao, Yan Y" <yan.y.zhao@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

PiBGcm9tOiBBbGV4IFdpbGxpYW1zb24gPGFsZXgud2lsbGlhbXNvbkByZWRoYXQuY29tPg0KPiBT
ZW50OiBUaHVyc2RheSwgTWFyY2ggMzAsIDIwMjMgNTowMSBBTQ0KPiANCj4gT24gTW9uLCAyNyBN
YXIgMjAyMyAwMjo0MDo0NCAtMDcwMA0KPiBZaSBMaXUgPHlpLmwubGl1QGludGVsLmNvbT4gd3Jv
dGU6DQo+IA0KPiA+IFRoaXMgYWRkcyBpb2N0bCBmb3IgdXNlcnNwYWNlIHRvIGJpbmQgZGV2aWNl
IGNkZXYgZmQgdG8gaW9tbXVmZC4NCj4gPg0KPiA+ICAgICBWRklPX0RFVklDRV9CSU5EX0lPTU1V
RkQ6IGJpbmQgZGV2aWNlIHRvIGFuIGlvbW11ZmQsIGhlbmNlIGdhaW4gRE1BDQo+ID4gCQkJICAg
ICAgY29udHJvbCBwcm92aWRlZCBieSB0aGUgaW9tbXVmZC4gb3Blbl9kZXZpY2UNCj4gPiAJCQkg
ICAgICBvcCBpcyBjYWxsZWQgYWZ0ZXIgYmluZF9pb21tdWZkIG9wLg0KPiA+IAkJCSAgICAgIFZG
SU8gbm8gaW9tbXUgbW9kZSBpcyBpbmRpY2F0ZWQgYnkgcGFzc2luZw0KPiA+IAkJCSAgICAgIGEg
bmVnYXRpdmUgaW9tbXVmZCB2YWx1ZS4NCj4gPg0KPiA+IFJldmlld2VkLWJ5OiBLZXZpbiBUaWFu
IDxrZXZpbi50aWFuQGludGVsLmNvbT4NCj4gPiBUZXN0ZWQtYnk6IFRlcnJlbmNlIFh1IDx0ZXJy
ZW5jZS54dUBpbnRlbC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogWWkgTGl1IDx5aS5sLmxpdUBp
bnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvdmZpby9kZXZpY2VfY2Rldi5jIHwgMTUz
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgZHJpdmVycy92Zmlv
L3ZmaW8uaCAgICAgICAgfCAgMTMgKysrKw0KPiA+ICBkcml2ZXJzL3ZmaW8vdmZpb19tYWluLmMg
ICB8ICAgNSArKw0KPiA+ICBpbmNsdWRlL3VhcGkvbGludXgvdmZpby5oICB8ICAzNyArKysrKysr
KysNCj4gPiAgNCBmaWxlcyBjaGFuZ2VkLCAyMDggaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvdmZpby9kZXZpY2VfY2Rldi5jIGIvZHJpdmVycy92ZmlvL2Rldmlj
ZV9jZGV2LmMNCj4gPiBpbmRleCAxYzY0MDAxNmE4MjQuLjJiNTYzYmFjNTBiOSAxMDA2NDQNCj4g
PiAtLS0gYS9kcml2ZXJzL3ZmaW8vZGV2aWNlX2NkZXYuYw0KPiA+ICsrKyBiL2RyaXZlcnMvdmZp
by9kZXZpY2VfY2Rldi5jDQo+ID4gQEAgLTMsNiArMyw3IEBADQo+ID4gICAqIENvcHlyaWdodCAo
YykgMjAyMyBJbnRlbCBDb3Jwb3JhdGlvbi4NCj4gPiAgICovDQo+ID4gICNpbmNsdWRlIDxsaW51
eC92ZmlvLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9pb21tdWZkLmg+DQo+ID4NCj4gPiAgI2lu
Y2x1ZGUgInZmaW8uaCINCj4gPg0KPiA+IEBAIC00NCw2ICs0NSwxNTggQEAgaW50IHZmaW9fZGV2
aWNlX2ZvcHNfY2Rldl9vcGVuKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdA0KPiBmaWxlICpm
aWxlcCkNCj4gPiAgCXJldHVybiByZXQ7DQo+ID4gIH0NCj4gPg0KPiA+ICtzdGF0aWMgdm9pZCB2
ZmlvX2RldmljZV9nZXRfa3ZtX3NhZmUoc3RydWN0IHZmaW9fZGV2aWNlX2ZpbGUgKmRmKQ0KPiA+
ICt7DQo+ID4gKwlzcGluX2xvY2soJmRmLT5rdm1fcmVmX2xvY2spOw0KPiA+ICsJaWYgKGRmLT5r
dm0pDQo+ID4gKwkJX3ZmaW9fZGV2aWNlX2dldF9rdm1fc2FmZShkZi0+ZGV2aWNlLCBkZi0+a3Zt
KTsNCj4gPiArCXNwaW5fdW5sb2NrKCZkZi0+a3ZtX3JlZl9sb2NrKTsNCj4gPiArfQ0KPiA+ICsN
Cj4gPiArdm9pZCB2ZmlvX2RldmljZV9jZGV2X2Nsb3NlKHN0cnVjdCB2ZmlvX2RldmljZV9maWxl
ICpkZikNCj4gPiArew0KPiA+ICsJc3RydWN0IHZmaW9fZGV2aWNlICpkZXZpY2UgPSBkZi0+ZGV2
aWNlOw0KPiA+ICsNCj4gPiArCS8qDQo+ID4gKwkgKiBBcyBkZi0+YWNjZXNzX2dyYW50ZWQgd3Jp
dGVyIGlzIHVuZGVyIGRldl9zZXQtPmxvY2sgYXMgd2VsbCwNCj4gPiArCSAqIHNvIHRoaXMgcmVh
ZCBubyBuZWVkIHRvIHVzZSBzbXBfbG9hZF9hY3F1aXJlKCkgdG8gcGFpciB3aXRoDQo+IA0KPiBO
aXQsICJubyBuZWVkIHRvIHVzZSIgLT4gImRvZXMgbm90IG5lZWQgdG8gdXNlIg0KDQpnb3QgaXQu
DQoNCj4gDQo+ID4gKwkgKiBzbXBfc3RvcmVfcmVsZWFzZSgpIGluIHRoZSBjYWxsZXIgb2YgdmZp
b19kZXZpY2Vfb3BlbigpLg0KPiA+ICsJICovDQo+ID4gKwlpZiAoIWRmLT5hY2Nlc3NfZ3JhbnRl
ZCkNCj4gPiArCQlyZXR1cm47DQo+ID4gKw0KPiANCj4gSXNuJ3QgdGhlIGxvY2sgd2UncmUgYWNx
dWlyaW5nIGJlbG93IHRoZSBvbmUgdGhhdCB3ZSBjbGFpbSB0byBoYXZlIGluDQo+IHRoZSBjb21t
ZW50IGFib3ZlIHRvIG1ha2UgdGhlIG5vbi1zbXBfbG9hZF9hY3F1aXJlKCkgdGVzdCBzYWZlPw0K
DQp0aGUgY29tbWVudCBtYXkgYmUgbm90IGFjY3VyYXRlIGVub3VnaC4gVGhlIHRoZSBub24tc21w
X2xvYWRfYWNxdWlyZSgpDQphbmQgbm8gbG9jayB0ZXN0IHdlcmUgYWNjb3JkaW5nIHRvIHRoZSBi
ZWxvdyB0d28gcmVtYXJrcyBpbiB2NCBhbmQgdjUuDQoNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2t2bS9ZJTJGWVJ4N2pMdXlFb0x4WmdAbnZpZGlhLmNvbS8NCmh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2t2bS9ZJTJGMENWMUswWU5IQStvbGZAbnZpZGlhLmNvbS8NCg0KUGVyaGFwcyB0aGUgY29t
bWVudCBzaG91bGQgYmU6DQoNCiJJbiB0aGUgdGltZSBvZiBjbG9zZSwgdGhlcmUgaXMgbm8gY29u
dGVudGlvbiB3aXRoIGFub3RoZXIgb25lDQogIGNoYW5naW5nIHRoaXMgZmxhZy4gU28gdGVzdCBk
Zi0+YWNjZXNzX2dyYW50ZWQgd2l0aG91dCBsb2NrDQogIG5vciBzbXBfbG9hZF9hY3F1aXJlKCkg
aXMgb2suIg0KDQo+ID4gKwltdXRleF9sb2NrKCZkZXZpY2UtPmRldl9zZXQtPmxvY2spOw0KPiA+
ICsJdmZpb19kZXZpY2VfY2xvc2UoZGYpOw0KPiA+ICsJdmZpb19kZXZpY2VfcHV0X2t2bShkZXZp
Y2UpOw0KPiA+ICsJaWYgKGRmLT5pb21tdWZkKQ0KPiA+ICsJCWlvbW11ZmRfY3R4X3B1dChkZi0+
aW9tbXVmZCk7DQo+ID4gKwltdXRleF91bmxvY2soJmRldmljZS0+ZGV2X3NldC0+bG9jayk7DQo+
ID4gKwl2ZmlvX2RldmljZV91bmJsb2NrX2dyb3VwKGRldmljZSk7DQo+ID4gK30NCj4gPiArDQo+
ID4gK3N0YXRpYyBpbnQgdmZpb19kZXZpY2VfY2Rldl9lbmFibGVfbm9pb21tdShzdHJ1Y3QgdmZp
b19kZXZpY2UgKmRldmljZSkNCj4gPiArew0KPiA+ICsJaWYgKCFjYXBhYmxlKENBUF9TWVNfUkFX
SU8pKQ0KPiA+ICsJCXJldHVybiAtRVBFUk07DQo+ID4gKw0KPiA+ICsJaWYgKCFkZXZpY2UtPm5v
aW9tbXUpDQo+ID4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ID4gKw0KPiA+ICsJcmV0dXJuIDA7DQo+
ID4gK30NCj4gDQo+IFRoaXMgaXMgdGVzdGluZywgbm90IGVuYWJsaW5nLiBpZS4gbmFtaW5nIG5p
dC4NCg0KaG93IGFib3V0IHByb2JlX25vaW9tbXUgb3IgdGVzdF9ub2lvbW11Pw0KDQo+IA0KPiA+
ICsNCj4gPiArc3RhdGljIHN0cnVjdCBpb21tdWZkX2N0eCAqdmZpb19nZXRfaW9tbXVmZF9mcm9t
X2ZkKGludCBmZCkNCj4gPiArew0KPiA+ICsJc3RydWN0IGZkIGY7DQo+ID4gKwlzdHJ1Y3QgaW9t
bXVmZF9jdHggKmlvbW11ZmQ7DQo+ID4gKw0KPiA+ICsJZiA9IGZkZ2V0KGZkKTsNCj4gPiArCWlm
ICghZi5maWxlKQ0KPiA+ICsJCXJldHVybiBFUlJfUFRSKC1FQkFERik7DQo+ID4gKw0KPiA+ICsJ
aW9tbXVmZCA9IGlvbW11ZmRfY3R4X2Zyb21fZmlsZShmLmZpbGUpOw0KPiA+ICsNCj4gPiArCWZk
cHV0KGYpOw0KPiA+ICsJcmV0dXJuIGlvbW11ZmQ7DQo+ID4gK30NCj4gPiArDQo+ID4gK2xvbmcg
dmZpb19kZXZpY2VfaW9jdGxfYmluZF9pb21tdWZkKHN0cnVjdCB2ZmlvX2RldmljZV9maWxlICpk
ZiwNCj4gPiArCQkJCSAgICBzdHJ1Y3QgdmZpb19kZXZpY2VfYmluZF9pb21tdWZkIF9fdXNlciAq
YXJnKQ0KPiA+ICt7DQo+ID4gKwlzdHJ1Y3QgdmZpb19kZXZpY2UgKmRldmljZSA9IGRmLT5kZXZp
Y2U7DQo+ID4gKwlzdHJ1Y3QgdmZpb19kZXZpY2VfYmluZF9pb21tdWZkIGJpbmQ7DQo+ID4gKwlz
dHJ1Y3QgaW9tbXVmZF9jdHggKmlvbW11ZmQgPSBOVUxMOw0KPiA+ICsJdW5zaWduZWQgbG9uZyBt
aW5zejsNCj4gPiArCWludCByZXQ7DQo+ID4gKw0KPiA+ICsJc3RhdGljX2Fzc2VydChfX3NhbWVf
dHlwZShhcmctPm91dF9kZXZpZCwgYmluZC5vdXRfZGV2aWQpKTsNCj4gDQo+IFRoZXkncmUgdGhl
IHNhbWUgZmllbGQgaW4gdGhlIHNhbWUgc3RydWN0dXJlLCBob3cgY291bGQgdGhleSBiZQ0KPiBv
dGhlcndpc2U/DQoNCkBKYXNvbiwgc2hvdWxkIEkgcmVtb3ZlIHRoaXMgY2hlY2s/DQoNCj4gPiAr
DQo+ID4gKwltaW5zeiA9IG9mZnNldG9mZW5kKHN0cnVjdCB2ZmlvX2RldmljZV9iaW5kX2lvbW11
ZmQsIG91dF9kZXZpZCk7DQo+ID4gKw0KPiA+ICsJaWYgKGNvcHlfZnJvbV91c2VyKCZiaW5kLCBh
cmcsIG1pbnN6KSkNCj4gPiArCQlyZXR1cm4gLUVGQVVMVDsNCj4gPiArDQo+ID4gKwlpZiAoYmlu
ZC5hcmdzeiA8IG1pbnN6IHx8IGJpbmQuZmxhZ3MpDQo+ID4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+
ID4gKw0KPiA+ICsJaWYgKCFkZXZpY2UtPm9wcy0+YmluZF9pb21tdWZkKQ0KPiA+ICsJCXJldHVy
biAtRU5PREVWOw0KPiANCj4gVGhpcyB0ZXN0IHNlZW1zIGJleW9uZCBub3JtYWwgcGFyYW5vaWEg
c2luY2Ugd2UgdGVzdCBpbg0KPiBfX3ZmaW9fcmVnaXN0ZXJfZGV2KCkNCg0KeWVzLiBUaGUgd2hv
bGUgYyBmaWxlIGRlcGVuZHMgb24gVkZJT19ERVZJQ0VfQ0RFViB3aGljaA0KZGVwZW5kcyBvbiBJ
T01NVUZELCBhbmQgaWYgSU9NTVVGRCBpcyBlbmFibGVkLA0KX192ZmlvX3JlZ2lzdGVyX2Rldigp
IGFscmVhZHkgY2hlY2tzIHRoaXMgY2FsbGJhY2suDQoNCj4gDQo+ID4gKw0KPiA+ICsJLyogQklO
RF9JT01NVUZEIG9ubHkgYWxsb3dlZCBmb3IgY2RldiBmZHMgKi8NCj4gPiArCWlmIChkZi0+Z3Jv
dXApDQo+ID4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ID4gKw0KPiA+ICsJcmV0ID0gdmZpb19kZXZp
Y2VfYmxvY2tfZ3JvdXAoZGV2aWNlKTsNCj4gPiArCWlmIChyZXQpDQo+ID4gKwkJcmV0dXJuIHJl
dDsNCj4gPiArDQo+ID4gKwltdXRleF9sb2NrKCZkZXZpY2UtPmRldl9zZXQtPmxvY2spOw0KPiA+
ICsJLyogb25lIGRldmljZSBjYW5ub3QgYmUgYm91bmQgdHdpY2UgKi8NCj4gPiArCWlmIChkZi0+
YWNjZXNzX2dyYW50ZWQpIHsNCj4gPiArCQlyZXQgPSAtRUlOVkFMOw0KPiA+ICsJCWdvdG8gb3V0
X3VubG9jazsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwkvKiBpb21tdWZkIDwgMCBtZWFucyBub2lv
bW11IG1vZGUgKi8NCj4gPiArCWlmIChiaW5kLmlvbW11ZmQgPCAwKSB7DQo+ID4gKwkJcmV0ID0g
dmZpb19kZXZpY2VfY2Rldl9lbmFibGVfbm9pb21tdShkZXZpY2UpOw0KPiA+ICsJCWlmIChyZXQp
DQo+ID4gKwkJCWdvdG8gb3V0X3VubG9jazsNCj4gPiArCX0gZWxzZSB7DQo+ID4gKwkJaW9tbXVm
ZCA9IHZmaW9fZ2V0X2lvbW11ZmRfZnJvbV9mZChiaW5kLmlvbW11ZmQpOw0KPiA+ICsJCWlmIChJ
U19FUlIoaW9tbXVmZCkpIHsNCj4gPiArCQkJcmV0ID0gUFRSX0VSUihpb21tdWZkKTsNCj4gPiAr
CQkJZ290byBvdXRfdW5sb2NrOw0KPiA+ICsJCX0NCj4gPiArCX0NCj4gPiArDQo+ID4gKwkvKg0K
PiA+ICsJICogQmVmb3JlIHRoZSBkZXZpY2Ugb3BlbiwgZ2V0IHRoZSBLVk0gcG9pbnRlciBjdXJy
ZW50bHkNCj4gPiArCSAqIGFzc29jaWF0ZWQgd2l0aCB0aGUgZGV2aWNlIGZpbGUgKGlmIHRoZXJl
IGlzKSBhbmQgb2J0YWluDQo+ID4gKwkgKiBhIHJlZmVyZW5jZS4gIFRoaXMgcmVmZXJlbmNlIGlz
IGhlbGQgdW50aWwgZGV2aWNlIGNsb3NlZC4NCj4gPiArCSAqIFNhdmUgdGhlIHBvaW50ZXIgaW4g
dGhlIGRldmljZSBmb3IgdXNlIGJ5IGRyaXZlcnMuDQo+ID4gKwkgKi8NCj4gPiArCXZmaW9fZGV2
aWNlX2dldF9rdm1fc2FmZShkZik7DQo+ID4gKw0KPiA+ICsJZGYtPmlvbW11ZmQgPSBpb21tdWZk
Ow0KPiA+ICsJcmV0ID0gdmZpb19kZXZpY2Vfb3BlbihkZik7DQo+ID4gKwlpZiAocmV0KQ0KPiA+
ICsJCWdvdG8gb3V0X3B1dF9rdm07DQo+ID4gKw0KPiA+ICsJaWYgKGRmLT5pb21tdWZkKQ0KPiA+
ICsJCWJpbmQub3V0X2RldmlkID0gZGYtPmRldmlkOw0KPiANCj4gSG93IGFib3V0IG9ubHkgc2V0
dGluZyBkZi0+aW9tbXVmZCBpbiB0aGUgbm9uLW5vaW9tbXUgY2FzZSBhYm92ZSBzbw0KPiBpdCdz
IG5vdCBjb25mdXNpbmcgdGhhdCBpdCB3YXMganVzdCBzZXQgNCBsaW5lcyBwcmV2aW91cy4gIFRo
YXQgYWxzbw0KPiBhbGxvd3MgdGhlIGlvbW11ZmQgcG9pbnRlciB0byBiZSBzY29wZWQgd2l0aGlu
IHRoYXQgYnJhbmNoIGFuZCBub3QNCj4gcmVxdWlyZSBpbml0aWFsaXphdGlvbi4gIEl0IG1pZ2h0
IG1ha2Ugc2Vuc2UgdG8gZGVjbGFyZToNCj4gDQo+IAlib29sIGlzX25vaW9tbXUgPSAoYmluZC5p
b21tdWZkIDwgMCk7DQo+IA0KPiBhbmQgdXNlIGl0IGNvbnNpc3RlbnRseSByYXRoZXIgdGhhbiBh
bHRlcm5hdGluZyB0ZXN0aW5nIGJldHdlZW4NCj4gYmluZC5pb21tdWZkIGFuZCBkZi0+aW9tbXVm
ZC4NCg0Kc3VyZS4NCg0KPiA+ICsNCj4gPiArCXJldCA9IGNvcHlfdG9fdXNlcigmYXJnLT5vdXRf
ZGV2aWQsICZiaW5kLm91dF9kZXZpZCwNCj4gPiArCQkJICAgc2l6ZW9mKGJpbmQub3V0X2Rldmlk
KSkgPyAtRUZBVUxUIDogMDsNCj4gDQo+IEluIHRoZSBub2lvbW11IGNhc2UsIHRoaXMgY29waWVz
IGJhY2sgdGhlIGlucHV0IHZhbHVlLCBzaG91bGRuJ3QgaXQgYmUNCj4gc29tZSBrbm93biBpbnZh
bGlkIHZhbHVlPyAgU2VlbXMgY29uZnVzaW5nLg0KDQptYXliZSBqdXN0IGRvIGNvcHkgZm9yIHRo
ZSBub24tbm9pb21tdSBjYXNlPw0KDQo+ID4gKwlpZiAocmV0KQ0KPiA+ICsJCWdvdG8gb3V0X2Ns
b3NlX2RldmljZTsNCj4gPiArDQo+ID4gKwlpZiAoYmluZC5pb21tdWZkIDwgMCkNCj4gPiArCQlk
ZXZfd2FybihkZXZpY2UtPmRldiwgImRldmljZSBpcyBib3VuZCB0byB2ZmlvLW5vaW9tbXUgYnkg
dXNlciAiDQo+ID4gKwkJCSAiKCVzOiVkKVxuIiwgY3VycmVudC0+Y29tbSwgdGFza19waWRfbnIo
Y3VycmVudCkpOw0KPiA+ICsNCj4gPiArCS8qDQo+ID4gKwkgKiBQYWlyZWQgd2l0aCBzbXBfbG9h
ZF9hY3F1aXJlKCkgaW4gdmZpb19kZXZpY2VfZm9wczo6aW9jdGwvDQo+ID4gKwkgKiByZWFkL3dy
aXRlL21tYXANCj4gPiArCSAqLw0KPiA+ICsJc21wX3N0b3JlX3JlbGVhc2UoJmRmLT5hY2Nlc3Nf
Z3JhbnRlZCwgdHJ1ZSk7DQo+ID4gKwltdXRleF91bmxvY2soJmRldmljZS0+ZGV2X3NldC0+bG9j
ayk7DQo+ID4gKw0KPiA+ICsJcmV0dXJuIDA7DQo+ID4gKw0KPiA+ICtvdXRfY2xvc2VfZGV2aWNl
Og0KPiA+ICsJdmZpb19kZXZpY2VfY2xvc2UoZGYpOw0KPiA+ICtvdXRfcHV0X2t2bToNCj4gPiAr
CWRmLT5pb21tdWZkID0gTlVMTDsNCj4gPiArCXZmaW9fZGV2aWNlX3B1dF9rdm0oZGV2aWNlKTsN
Cj4gPiArCWlmIChpb21tdWZkKQ0KPiA+ICsJCWlvbW11ZmRfY3R4X3B1dChpb21tdWZkKTsNCj4g
PiArb3V0X3VubG9jazoNCj4gPiArCW11dGV4X3VubG9jaygmZGV2aWNlLT5kZXZfc2V0LT5sb2Nr
KTsNCj4gPiArCXZmaW9fZGV2aWNlX3VuYmxvY2tfZ3JvdXAoZGV2aWNlKTsNCj4gPiArCXJldHVy
biByZXQ7DQo+ID4gK30NCj4gPiArDQo+ID4gIHN0YXRpYyBjaGFyICp2ZmlvX2RldmljZV9kZXZu
b2RlKGNvbnN0IHN0cnVjdCBkZXZpY2UgKmRldiwgdW1vZGVfdCAqbW9kZSkNCj4gPiAgew0KPiA+
ICAJcmV0dXJuIGthc3ByaW50ZihHRlBfS0VSTkVMLCAidmZpby9kZXZpY2VzLyVzIiwgZGV2X25h
bWUoZGV2KSk7DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmZpby92ZmlvLmggYi9kcml2ZXJz
L3ZmaW8vdmZpby5oDQo+ID4gaW5kZXggM2E4ZmQwZTMyZjU5Li5hY2UzZDUyYjA5MjggMTAwNjQ0
DQo+ID4gLS0tIGEvZHJpdmVycy92ZmlvL3ZmaW8uaA0KPiA+ICsrKyBiL2RyaXZlcnMvdmZpby92
ZmlvLmgNCj4gPiBAQCAtMjgxLDYgKzI4MSw5IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB2ZmlvX2Rl
dmljZV9kZWwoc3RydWN0IHZmaW9fZGV2aWNlICpkZXZpY2UpDQo+ID4NCj4gPiAgdm9pZCB2Zmlv
X2luaXRfZGV2aWNlX2NkZXYoc3RydWN0IHZmaW9fZGV2aWNlICpkZXZpY2UpOw0KPiA+ICBpbnQg
dmZpb19kZXZpY2VfZm9wc19jZGV2X29wZW4oc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGZp
bGUgKmZpbGVwKTsNCj4gPiArdm9pZCB2ZmlvX2RldmljZV9jZGV2X2Nsb3NlKHN0cnVjdCB2Zmlv
X2RldmljZV9maWxlICpkZik7DQo+ID4gK2xvbmcgdmZpb19kZXZpY2VfaW9jdGxfYmluZF9pb21t
dWZkKHN0cnVjdCB2ZmlvX2RldmljZV9maWxlICpkZiwNCj4gPiArCQkJCSAgICBzdHJ1Y3QgdmZp
b19kZXZpY2VfYmluZF9pb21tdWZkIF9fdXNlciAqYXJnKTsNCj4gPiAgaW50IHZmaW9fY2Rldl9p
bml0KHN0cnVjdCBjbGFzcyAqZGV2aWNlX2NsYXNzKTsNCj4gPiAgdm9pZCB2ZmlvX2NkZXZfY2xl
YW51cCh2b2lkKTsNCj4gPiAgI2Vsc2UNCj4gPiBAQCAtMzA0LDYgKzMwNywxNiBAQCBzdGF0aWMg
aW5saW5lIGludCB2ZmlvX2RldmljZV9mb3BzX2NkZXZfb3BlbihzdHJ1Y3QgaW5vZGUNCj4gKmlu
b2RlLA0KPiA+ICAJcmV0dXJuIDA7DQo+ID4gIH0NCj4gPg0KPiA+ICtzdGF0aWMgaW5saW5lIHZv
aWQgdmZpb19kZXZpY2VfY2Rldl9jbG9zZShzdHJ1Y3QgdmZpb19kZXZpY2VfZmlsZSAqZGYpDQo+
ID4gK3sNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGlubGluZSBsb25nIHZmaW9fZGV2aWNl
X2lvY3RsX2JpbmRfaW9tbXVmZChzdHJ1Y3QgdmZpb19kZXZpY2VfZmlsZSAqZGYsDQo+ID4gKwkJ
CQkJCSAgc3RydWN0IHZmaW9fZGV2aWNlX2JpbmRfaW9tbXVmZA0KPiBfX3VzZXIgKmFyZykNCj4g
PiArew0KPiA+ICsJcmV0dXJuIC1FT1BOT1RTVVBQOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICBzdGF0
aWMgaW5saW5lIGludCB2ZmlvX2NkZXZfaW5pdChzdHJ1Y3QgY2xhc3MgKmRldmljZV9jbGFzcykN
Cj4gPiAgew0KPiA+ICAJcmV0dXJuIDA7DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmZpby92
ZmlvX21haW4uYyBiL2RyaXZlcnMvdmZpby92ZmlvX21haW4uYw0KPiA+IGluZGV4IDU4ZmMzYmI3
NjhmMi4uMzc1MDg2Yzg4MDNmIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvdmZpby92ZmlvX21h
aW4uYw0KPiA+ICsrKyBiL2RyaXZlcnMvdmZpby92ZmlvX21haW4uYw0KPiA+IEBAIC01NTksNiAr
NTU5LDggQEAgc3RhdGljIGludCB2ZmlvX2RldmljZV9mb3BzX3JlbGVhc2Uoc3RydWN0IGlub2Rl
ICppbm9kZSwNCj4gc3RydWN0IGZpbGUgKmZpbGVwKQ0KPiA+DQo+ID4gIAlpZiAoZGYtPmdyb3Vw
KQ0KPiA+ICAJCXZmaW9fZGV2aWNlX2dyb3VwX2Nsb3NlKGRmKTsNCj4gPiArCWVsc2UNCj4gPiAr
CQl2ZmlvX2RldmljZV9jZGV2X2Nsb3NlKGRmKTsNCj4gPg0KPiA+ICAJdmZpb19kZXZpY2VfcHV0
X3JlZ2lzdHJhdGlvbihkZXZpY2UpOw0KPiA+DQo+ID4gQEAgLTExMzIsNiArMTEzNCw5IEBAIHN0
YXRpYyBsb25nIHZmaW9fZGV2aWNlX2ZvcHNfdW5sX2lvY3RsKHN0cnVjdCBmaWxlICpmaWxlcCwN
Cj4gPiAgCXN0cnVjdCB2ZmlvX2RldmljZSAqZGV2aWNlID0gZGYtPmRldmljZTsNCj4gPiAgCWlu
dCByZXQ7DQo+ID4NCj4gPiArCWlmIChjbWQgPT0gVkZJT19ERVZJQ0VfQklORF9JT01NVUZEKQ0K
PiA+ICsJCXJldHVybiB2ZmlvX2RldmljZV9pb2N0bF9iaW5kX2lvbW11ZmQoZGYsICh2b2lkIF9f
dXNlciAqKWFyZyk7DQo+ID4gKw0KPiA+ICAJLyogUGFpcmVkIHdpdGggc21wX3N0b3JlX3JlbGVh
c2UoKSBmb2xsb3dpbmcgdmZpb19kZXZpY2Vfb3BlbigpICovDQo+ID4gIAlpZiAoIXNtcF9sb2Fk
X2FjcXVpcmUoJmRmLT5hY2Nlc3NfZ3JhbnRlZCkpDQo+ID4gIAkJcmV0dXJuIC1FSU5WQUw7DQo+
ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51eC92ZmlvLmggYi9pbmNsdWRlL3VhcGkv
bGludXgvdmZpby5oDQo+ID4gaW5kZXggNjFiODAxZGZkNDBiLi42MmIyZjI0OTc1MjUgMTAwNjQ0
DQo+ID4gLS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4L3ZmaW8uaA0KPiA+ICsrKyBiL2luY2x1ZGUv
dWFwaS9saW51eC92ZmlvLmgNCj4gPiBAQCAtMTk0LDYgKzE5NCw0MyBAQCBzdHJ1Y3QgdmZpb19n
cm91cF9zdGF0dXMgew0KPiA+DQo+ID4gIC8qIC0tLS0tLS0tLS0tLS0tLSBJT0NUTHMgZm9yIERF
VklDRSBmaWxlIGRlc2NyaXB0b3JzIC0tLS0tLS0tLS0tLS0tLSAqLw0KPiA+DQo+ID4gKy8qDQo+
ID4gKyAqIFZGSU9fREVWSUNFX0JJTkRfSU9NTVVGRCAtIF9JT1IoVkZJT19UWVBFLCBWRklPX0JB
U0UgKyAxOSwNCj4gPiArICoJCQkJICAgc3RydWN0IHZmaW9fZGV2aWNlX2JpbmRfaW9tbXVmZCkN
Cj4gPiArICoNCj4gPiArICogQmluZCBhIHZmaW9fZGV2aWNlIHRvIHRoZSBzcGVjaWZpZWQgaW9t
bXVmZC4NCj4gPiArICoNCj4gPiArICogVGhlIHVzZXIgc2hvdWxkIHByb3ZpZGUgYSBkZXZpY2Ug
Y29va2llIHdoZW4gY2FsbGluZyB0aGlzIGlvY3RsLiBUaGUNCj4gPiArICogY29va2llIGlzIGNh
cnJpZWQgb25seSBpbiBldmVudCBlLmcuIEkvTyBmYXVsdCByZXBvcnRlZCB0byB1c2Vyc3BhY2UN
Cj4gPiArICogdmlhIGlvbW11ZmQuIFRoZSB1c2VyIHNob3VsZCB1c2UgZGV2aWQgcmV0dXJuZWQg
YnkgdGhpcyBpb2N0bCB0byBtYXJrDQo+ID4gKyAqIHRoZSB0YXJnZXQgZGV2aWNlIGluIG90aGVy
IGlvY3RscyAoZS5nLiBpb21tdSBoYXJkd2FyZSBpbmZvbXJhdGlvbiBxdWVyeQ0KPiA+ICsgKiB2
aWEgaW9tbXVmZCwgYW5kIGV0Yy4pLg0KPiANCj4gQUZBSUNULCB0aGUgd2hvbGUgY29uY2VwdCBv
ZiB0aGlzIGRldl9jb29raWUgaXMgYSBmYW50YXN5LiAgSXQgb25seQ0KPiBleGlzdHMgaW4gdGhp
cyBzZXJpZXMgaW4gdGhlc2UgY29tbWVudHMgYW5kIHRoZSBzdHJ1Y3R1cmUgYmVsb3cuICBJdCdz
DQo+IG5vdCBldmVuIGRlZmluZWQgd2hldGhlciBpdCBuZWVkcyB0byBiZSB1bmlxdWUgd2l0aGlu
IGFuIGlvbW11ZmQNCj4gY29udGV4dCwgYW5kIGNsZWFybHkgbm90aGluZyBoZXJlIHZhbGlkYXRl
cyB0aGF0LiAgVGhlcmUncyBub3QgZW5vdWdoDQo+IGltcGxlbWVudGF0aW9uIGZvciBpdCB0byBl
eGlzdCBpbiB0aGlzIHNlcmllcy4gIE1heWJlIGRldl9jb29raWUgaXMNCj4gYXBwZW5kZWQgdG8g
dGhlIGVuZCBvZiB0aGUgc3RydWN0dXJlIGFuZCBpbmRpY2F0ZWQgd2l0aCBhIGZsYWcgd2hlbiBp
dA0KPiBoYXMgc29tZSBtZWFuaW5nLg0KDQpzb3JyeSwgSSBzaG91bGQgaGF2ZSBkZWxldGVkIGl0
LiDimLkNCg0KPiANCj4gPiArICoNCj4gPiArICogVXNlciBpcyBub3QgYWxsb3dlZCB0byBhY2Nl
c3MgdGhlIGRldmljZSBiZWZvcmUgdGhlIGJpbmRpbmcgb3BlcmF0aW9uDQo+ID4gKyAqIGlzIGNv
bXBsZXRlZC4NCj4gDQo+IHMvbm90IGFsbG93ZWQgdG8gYWNjZXNzL3Jlc3RyaWN0ZWQgZnJvbSBh
Y2Nlc3NpbmcvDQoNCmdvdCBpdC4NCg0KPiANCj4gPiArICoNCj4gPiArICogVW5iaW5kIGlzIGF1
dG9tYXRpY2FsbHkgY29uZHVjdGVkIHdoZW4gZGV2aWNlIGZkIGlzIGNsb3NlZC4NCj4gPiArICoN
Cj4gPiArICogQGFyZ3N6OgkgdXNlciBmaWxsZWQgc2l6ZSBvZiB0aGlzIGRhdGEuDQo+ID4gKyAq
IEBmbGFnczoJIHJlc2VydmVkIGZvciBmdXR1cmUgZXh0ZW5zaW9uLg0KPiA+ICsgKiBAZGV2X2Nv
b2tpZToJIGEgcGVyIGRldmljZSBjb29raWUgcHJvdmlkZWQgYnkgdXNlcnNwYWNlLg0KPiA+ICsg
KiBAaW9tbXVmZDoJIGlvbW11ZmQgdG8gYmluZC4gYSBuZWdhdGl2ZSB2YWx1ZSBtZWFucyBub2lv
bW11Lg0KPiANCj4gIlVzZSBhIG5lZ2F0aXZlIHZhbHVlIGZvciBuby1pb21tdSwgd2hlcmUgc3Vw
cG9ydGVkIiwgb3IgYmV0dGVyLCBzaG91bGQNCj4gd2UgZGVmaW5lIHRoaXMgZXhwbGljaXRseSBh
cyAtMSwgb3Igd2h5IG5vdCB1c2UgYSBmbGFnIGJpdCB0byBzcGVjaWZ5DQo+IG5vLWlvbW11PyAg
TWF5YmUgbWluc3ogaXMgb25seSB0aHJvdWdoIGZsYWdzIGZvciB0aGUgbm9pb21tdSB1c2UgY2Fz
ZS4NCj4gVGhhbmtzLA0KDQpJIGRvbuKAmXQgaGF2ZSBwcmVmZXJlbmNlIGhlcmUuIG1heWJlIHVz
aW5nIC0xIGNhbiBzYXZlIGEgZmxhZyBiaXQgZm9yIGZ1dHVyZQ0KZXh0ZW5zaW9uLiANCg0KPiAN
Cj4gPiArICogQG91dF9kZXZpZDoJIHRoZSBkZXZpY2UgaWQgZ2VuZXJhdGVkIGJ5IHRoaXMgYmlu
ZC4gVGhpcyBmaWVsZCBpcyB2YWxpZA0KPiA+ICsgKgkJYXMgbG9uZyBhcyB0aGUgaW5wdXQgQGlv
bW11ZmQgaXMgdmFsaWQuIE90aGVyd2lzZSwgaXQgaXMNCj4gPiArICoJCW1lYW5pbmdsZXNzLg0K
PiA+ICsgKg0KPiA+ICsgKiBSZXR1cm46IDAgb24gc3VjY2VzcywgLWVycm5vIG9uIGZhaWx1cmUu
DQo+ID4gKyAqLw0KPiA+ICtzdHJ1Y3QgdmZpb19kZXZpY2VfYmluZF9pb21tdWZkIHsNCj4gPiAr
CV9fdTMyCQlhcmdzejsNCj4gPiArCV9fdTMyCQlmbGFnczsNCj4gPiArCV9fYWxpZ25lZF91NjQJ
ZGV2X2Nvb2tpZTsNCj4gPiArCV9fczMyCQlpb21tdWZkOw0KPiA+ICsJX191MzIJCW91dF9kZXZp
ZDsNCj4gPiArfTsNCj4gPiArDQo+ID4gKyNkZWZpbmUgVkZJT19ERVZJQ0VfQklORF9JT01NVUZE
CV9JTyhWRklPX1RZUEUsIFZGSU9fQkFTRSArIDE5KQ0KPiA+ICsNCj4gPiAgLyoqDQo+ID4gICAq
IFZGSU9fREVWSUNFX0dFVF9JTkZPIC0gX0lPUihWRklPX1RZUEUsIFZGSU9fQkFTRSArIDcsDQo+
ID4gICAqCQkJCQkJc3RydWN0IHZmaW9fZGV2aWNlX2luZm8pDQoNClJlZ2FyZHMsDQpZaSBMaXUN
Cg==
