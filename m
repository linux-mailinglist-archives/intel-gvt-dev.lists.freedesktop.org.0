Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E68396A0652
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 23 Feb 2023 11:34:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2299D10E4AE;
	Thu, 23 Feb 2023 10:34:09 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79AAF10E050;
 Thu, 23 Feb 2023 10:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677148446; x=1708684446;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YRuDWmTTUtKda7aLmTNeF2e18ymtk1ryjrqz/zEqqgE=;
 b=Silh5UkpEOaMADv4Hg9MOzg7YhjFXT34ilgl6zUz+jAVvgoSRNOM1ZK3
 O3YI41XMj0YDLtHK6z/CkVu1UqcUNEIyAP9HOaJzw4vcnsanm4/Yi4aeQ
 EfHlFjBGyyJhwztyi2v9vOqo/OrYvZ8YCKwgGrzEnTAHMlBUP/vEtHC1V
 plbrTFnUVXpEMc8u1dcyLwPMM+pL/6QqFxmmdIt5WBn1uRqW0lBFhv1xL
 DDwZGnQ9leqtimGWLVD2yZ9lzAyeiGHReyTY9LCHYyZfiISfMYfytsQeS
 Sbt9gY5zTXB+u0SRy1roJAKUaxjyiW2xL8r7yZMwW3pZqamAIX0KLKRyC A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="312806499"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; d="scan'208";a="312806499"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 02:34:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="781824106"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; d="scan'208";a="781824106"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 23 Feb 2023 02:33:59 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 23 Feb 2023 02:33:58 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 23 Feb 2023 02:33:58 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 23 Feb 2023 02:33:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RgyRZB7NMMqoRU+EE3ojlQ4M1t62Z6puKeZaBO+U35prvgpx8/F2aghtzmrTouK+IrYe/T4RPYKduK96k1bZFai/Wvu5niGU2fAzNWcCU2BkDLAYZ5c+RG7ple4U982swQvbuJFyYp8lXVYWwA7M9umPYWGvI0bymZXmG6Wml46SFTgnduuUJOtbm6tvpl3fmDtky2X+zEqEsZ/E3EWRZhRcv+obV26cf+89D6f2b8bG8RuDVwlXvGWExc0n8FohzTTdM30NqnoEhUjB4+9wWutJzje0pmPJi14vDGWviNN6Lyf9LM9gZxY3gQIBy4PEfku/CPYsUhTSuW63p4sNUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/yCeG7y79/vg1lQxSAxVxxrZuIz6QgWYRd5ZUlkDuVo=;
 b=OSB38+her+oxg5JYUr75CQ7dyWD0cgVSHUpUdLEdcb4pXWaJ5UrgQDurnaT52SEvUMFk7z/vZntSjalEa1mfiXM+tGvO3uIUKv9xEJKjuz1SELgocy7XDLSIJFiqSgB0G4wqmBXmqQe8imSYGH9/cYt61hO1oIBCYLl6mmfsFwT89aCJstE8Y2E6IVlRXg4PjU42bawjM2qaIoLCeMROk3lNe90205yuSIZAuiTu2fGjV9XrsfzK6U8luRmH3uULQXa4yVsQWbUojkCQqArgp2yaUVxdNV7fdHAQRnGa2theMnxViv+2kSRYh7U5bXbUMOWX/VE5ADe+2SBNvz4iow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by CH3PR11MB8156.namprd11.prod.outlook.com (2603:10b6:610:165::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Thu, 23 Feb
 2023 10:33:56 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::6f7:944a:aaad:301f]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::6f7:944a:aaad:301f%6]) with mapi id 15.20.6134.019; Thu, 23 Feb 2023
 10:33:56 +0000
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: "Tian, Kevin" <kevin.tian@intel.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "jgg@nvidia.com" <jgg@nvidia.com>
Subject: RE: [PATCH v4 05/19] kvm/vfio: Accept vfio device file from userspace
Thread-Topic: [PATCH v4 05/19] kvm/vfio: Accept vfio device file from userspace
Thread-Index: AQHZRadZVh6J/oKR7EWiBpbRsm73Ga7akDkAgAHIVqA=
Date: Thu, 23 Feb 2023 10:33:56 +0000
Message-ID: <DS0PR11MB75293F00B792A47F16BFABF9C3AB9@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230221034812.138051-1-yi.l.liu@intel.com>
 <20230221034812.138051-6-yi.l.liu@intel.com>
 <BL1PR11MB5271CB271B0BA961C7D977798CAA9@BL1PR11MB5271.namprd11.prod.outlook.com>
In-Reply-To: <BL1PR11MB5271CB271B0BA961C7D977798CAA9@BL1PR11MB5271.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7529:EE_|CH3PR11MB8156:EE_
x-ms-office365-filtering-correlation-id: b9b69b54-26bd-4a76-c4be-08db1589778d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DRovoHxUvPKUsnvhJwlRHxwSMuVsAkUzAqudTJdoKDrp2nNZrkqsnZlFmjJpVdS/nqHZ+9mkX4FKKZbw6oCZvf3DgouYZsFfue0aZDvrrrHvCFIkVF2dI3sW0MIeDblHYbKhleYAmDnXWS5DqUffXH1uHN4utkPMWWrrGngfgGiod2PYX9sIdE7sqWE128EId+Bj/WWX4y5GW4j7LDjh+YvJfaoPF39N4Lvg2IblvV/O/7CqxSFiqCofhb0+G19CXLhCgc0i+pPyxeXESGiKQ8PvUPxqwUbcPQbCvdhNxDI/EL746OQir2YI3Uu4nw2AUc8mCuoViWYg4G8bW7VgRkohSQgPXAbwb/ExXXWWUKa39QIUPcT087n4JimQ2BpcqGpznn00Rm1fcZ4KWBDeSzeN1egZhJUlSY8/iongm9cE4EldJO97I3TrajtiR3lXfVwZrdsJ9MVGEKygzfazMRaR7A88CjqVydX6ABO7k+vzA0BVTikrsRZn6//VsViPkn4i09teSsMuY4ERZ8rJRLnilcqoHlrbhwPDANNDkh+bwI9Ur70Dilia5poAjLE2ICLYJLEfjFEXpvvitze5kJ66Gx8xRtK+5aVKttaMf4XEaBu3+6xs8Cz/i6n8SrK/ILzQZ1eQvFqQSpiqHgrLClI55D/bdFdcF45gnxQ7qaaHtHhSJKK4UKC9Q9zLYpzFbVU4MMXAQ+hkkwrxbFRaq/qE/VgWHQlnJWmdKHbNmac=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199018)(122000001)(38100700002)(66556008)(55016003)(316002)(66476007)(478600001)(4326008)(9686003)(6506007)(66946007)(64756008)(76116006)(71200400001)(8676002)(66446008)(186003)(26005)(33656002)(38070700005)(86362001)(52536014)(2906002)(5660300002)(8936002)(82960400001)(41300700001)(4744005)(7416002)(54906003)(7696005)(110136005)(13296009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?h0THmyfVUYSWJkTLC1ph+e0zYuMk+aVcw3kQj+cimWJr5glIgJywt4dIY1rD?=
 =?us-ascii?Q?fr60iN6mc2YJ2vXFN9F7SKKeSL1NRPD9D/6Fpy7a75lGcgRsvSech4VVX9Di?=
 =?us-ascii?Q?GfoemnqXKXPVVInTjUQ8Q/YLBLd1zmiFRAo8ybzAd4/eI+LptyBc9wvOEpzQ?=
 =?us-ascii?Q?Spclg/iThu0b3PGUq78SuqTsvgx4gD0ZVI8EtxGU4Nlk/V1nftbEQWstb2IF?=
 =?us-ascii?Q?rKhrKeNPUL6IyNYkv06BZnd7sXSxLwdPmlLmg81Msx4PTOrlD3xkLhIpDxQD?=
 =?us-ascii?Q?0qjdmKJD3gskxFT/z+n3BA/YYwiTSGbVjgB8k0vF2jXNo3TuHIXDNDomlvIJ?=
 =?us-ascii?Q?xmD7wGRVoqKZrFpoiV4BiGdUHl8YEp5tJ8imUNzfL/zOApvrP39njs6C2EFJ?=
 =?us-ascii?Q?jukr2neMQUOFhehzqJUVtr0kzsSNKzfsBh54xfo71fQkfDtyzZOGmRFBAfCa?=
 =?us-ascii?Q?XxopyhJywANDBX0CtuoUVKNRTl0/P15bN/Is+XPJDIGWGkkB5UKsHJ3VsZfl?=
 =?us-ascii?Q?FaxRNDP5smouqpdg2TB5t7DGjN5/j6ypwkLZkMEYBUnI6owIs7XvF7ZVaKXP?=
 =?us-ascii?Q?92lRm2KUbAHQWgO9NMGy7kpmSl23sl8RIbtA7ZJLH/X5VzVcNheAlz0o4r2M?=
 =?us-ascii?Q?g2WaPo7Qmv6EX6OYcqv/hHav6EqKTnRfU7gD2+1ut3XAaS64/76PEC/MfVCw?=
 =?us-ascii?Q?6KBr5z1pYjl+vw3tux9jZZX/KVBv6+laiMXyGv+EbbdI83uA6gq+sjb+oUiZ?=
 =?us-ascii?Q?I71+8q3OTvVnlrP7EcVdLtmP57/xbQ7f38AWBPaPx7nLpS4glJDD8aXtL/nO?=
 =?us-ascii?Q?3zZWpC63rNLG+N3MJ6IB0f8QRB/nM4RAUJvoa/i8PyB69cPWyHn5/3tK7Yjz?=
 =?us-ascii?Q?3uJRFyEX9wGWp97iIEiyo7ePZ9st4CueF8OtE/KW9QQ+A21cJYdoILrI4lSd?=
 =?us-ascii?Q?Z0rXNyz1OlyzvspodNj7uvhaGgwxS1CD1mUYTs3wOI3UPIM5D0hlsquPh9My?=
 =?us-ascii?Q?eNI9oaa8l6zqiegkqZ2qY187PrnAmeYWVspCYJtn1QwnCpT94T/MzWfv2dnG?=
 =?us-ascii?Q?hfAFjBHB8fNuwXRagYy2GzBzDzbT7gjJOi2XYHm+wQE+X4K1MwFCpAJc0b1C?=
 =?us-ascii?Q?3OYKS7M57E7LuDjkwMG+qhOdNbJ+cvCUVFSXzPdufo9XZ6MDa+KzJ2UwM9PQ?=
 =?us-ascii?Q?DaEvKEyZZB0k2erji0jXL4YrwInOFu+4Hod0A3YZYyibIEILfE17gxgYRP52?=
 =?us-ascii?Q?RBG93Xst0PZndbv0xlw4x+899gJImDblKkDmjoKKHcn1rBUHIXWun5YTEj5D?=
 =?us-ascii?Q?dAfjPqLaAZEyhD4+MdLLh5p70i9ip3lbfMKzG4dv5g+aC0+ooVcyq5uQHIfq?=
 =?us-ascii?Q?s9MsrFP9xrXtkWnZx6Yv7wJBJsOtevWImyKw92EKuyGBE7pYk/0gcAhCsz0O?=
 =?us-ascii?Q?9Yjs7tu+AjwRgwJ23RQZwptLzjXgjKQq2wOfO2Qfww4kFNqTY87sGyHvrNev?=
 =?us-ascii?Q?rXiJrBj/ilUJDrBp75jWRDFE8+KDn5tN1Nu//8z2a09RXEyssiDH2Bs3ereG?=
 =?us-ascii?Q?ZBp9B93f6dl+/mrQm1n0fgAGSBPJ2kAOWszwxjcG?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9b69b54-26bd-4a76-c4be-08db1589778d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2023 10:33:56.2914 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DN8WeppLIgrNeCPraNG0qglkJaNB/WvEmriGwosI0iy/4aelTB0Esu1xBwIEpVtGye9Gf8m6XxgoGU7lhURlrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8156
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
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "joro@8bytes.org" <joro@8bytes.org>, "cohuck@redhat.com" <cohuck@redhat.com>,
 "Hao, Xudong" <xudong.hao@intel.com>, "peterx@redhat.com" <peterx@redhat.com>,
 "Zhao, Yan Y" <yan.y.zhao@intel.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>, "Xu,
 Terrence" <terrence.xu@intel.com>, "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
 "shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "jasowang@redhat.com" <jasowang@redhat.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

> From: Tian, Kevin <kevin.tian@intel.com>
> Sent: Wednesday, February 22, 2023 3:18 PM
>=20
> > From: Liu, Yi L <yi.l.liu@intel.com>
> > Sent: Tuesday, February 21, 2023 11:48 AM
> >
> > +
> > +  KVM_DEV_VFIO_FILE_SET_SPAPR_TCE: attaches a guest visible TCE
> table
> >  	allocated by sPAPR KVM.
> > +
> > +	alias: KVM_DEV_VFIO_GROUP_SET_SPAPR_TCE
> > +
> >  	kvm_device_attr.addr points to a struct::
> >
>=20
> I'm a bit lost from previous discussion in v3. If all agree that SPAPR
> only works with group then is it necessary to add a FILE alias here?

@Alex, how about your opinion?

Regards,
Yi Liu
