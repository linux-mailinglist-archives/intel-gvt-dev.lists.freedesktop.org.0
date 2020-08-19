Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1178E2494BE
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 19 Aug 2020 07:58:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B6F89A5E;
	Wed, 19 Aug 2020 05:58:19 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5987089A5E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 19 Aug 2020 05:58:18 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f3cbf080000>; Tue, 18 Aug 2020 22:56:24 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 18 Aug 2020 22:58:17 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 18 Aug 2020 22:58:17 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 19 Aug
 2020 05:58:14 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server
 (TLS) id
 15.0.1473.3 via Frontend Transport; Wed, 19 Aug 2020 05:58:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BPbNBhTb8hgIntR1iCwROwo5IAHugrCoJA0p+wevy65A9EPmS3kA2VnMSSOkqSAiAQ935azmEmvmocDXWSq5zBxJNOQdXAZq44852GJczhk0f2Z8SjYdOmO07s1nqdWX4snnW+pySdzNATTiDUq9yUKMqkGugs+WnXMJix86VOyHJLHvL0BpdbWlRBk9xdXNDEL4LtBQM1dqf5aKAayCy00eahb74aWKtgnSbzZOv5o+XvRD+MYPsxuIubHEkXkj0XxMvhZN6T+kdTMWN2aMPMRS3HIYdw1lH8KwMR+O0qmjtskfnmGV/RlZDrS935Q8xod6OWPLl1mIXuraaOGxWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RKNbvPY5UTRmNqLSg37Qx/lnP0zYIH96oV43+RyziTw=;
 b=aQyt3s2IqiQ15re63mh4ZQeCsRR4Ya3J2jrLozrj2bT3PJERRxPv/88T1nCLyXPUcAClQdVCv6okqFqiS6uG5BqrLhR+/IoD6wKpvdTggo97baTZvgbrJeWKO3Siii5vh24jLhTVZrD/WMKMdzuNew/gNozbQ8rG4r8oiIDi2H08/EoRnX/Uh3vSHKMRJo/h7T2OwiM+bgw3cOmZ1Yj9l+7lkcrfuVclLmkevxl2fsmpHUf/ybVzgLU1iCuGlS6eHsWefeKInevijGv5cAtq15UxfM4P5KZ186dIvMyV0BIp7Q+6z07cbrTSGrAkWRrJ2+Cl7rGyJGtBBY+xA4wEbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BY5PR12MB4322.namprd12.prod.outlook.com (2603:10b6:a03:20a::20)
 by BYAPR12MB3173.namprd12.prod.outlook.com (2603:10b6:a03:13d::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Wed, 19 Aug
 2020 05:58:12 +0000
Received: from BY5PR12MB4322.namprd12.prod.outlook.com
 ([fe80::b5f0:8a21:df98:7707]) by BY5PR12MB4322.namprd12.prod.outlook.com
 ([fe80::b5f0:8a21:df98:7707%8]) with mapi id 15.20.3283.028; Wed, 19 Aug 2020
 05:58:12 +0000
From: Parav Pandit <parav@nvidia.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: RE: device compatibility interface for live migration with assigned
 devices
Thread-Topic: device compatibility interface for live migration with assigned
 devices
Thread-Index: AQHWaxahY2KLNHS+kEetIX0F/1UfDqkw/oyAgAR+pQCAAaChgIAGKisAgABceICAAAHJgIAABBYAgAAFswCAAAB4cIABK4aAgAAk5bA=
Date: Wed, 19 Aug 2020 05:58:12 +0000
Message-ID: <BY5PR12MB43226CABD003285D0C77E2B7DC5D0@BY5PR12MB4322.namprd12.prod.outlook.com>
References: <20200805105319.GF2177@nanopsycho>
 <20200810074631.GA29059@joy-OptiPlex-7040>
 <e6e75807-0614-bd75-aeb6-64d643e029d3@redhat.com>
 <20200814051601.GD15344@joy-OptiPlex-7040>
 <a51209fe-a8c6-941f-ff54-7be06d73bc44@redhat.com>
 <20200818085527.GB20215@redhat.com>
 <3a073222-dcfe-c02d-198b-29f6a507b2e1@redhat.com>
 <20200818091628.GC20215@redhat.com>
 <20200818113652.5d81a392.cohuck@redhat.com>
 <BY5PR12MB4322C9D1A66C4657776A1383DC5C0@BY5PR12MB4322.namprd12.prod.outlook.com>
 <20200819033035.GA21172@joy-OptiPlex-7040>
In-Reply-To: <20200819033035.GA21172@joy-OptiPlex-7040>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [49.207.209.10]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: abc7b22a-c60a-4d66-5fef-08d84404db8c
x-ms-traffictypediagnostic: BYAPR12MB3173:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB31735CD331FB59B7BA563B53DC5D0@BYAPR12MB3173.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ipMMGUNlRy8Gd6zlEIq4BZNYIjtrphZNk7Prs2D2VFxRMCN+XhLK5uKSL/GGxe5kG87aUj1DLp1RZyyZ2iDuyFsNUxAyPopYn+4WUat5ubUejEdqLAhflpwEItTgHA7o2zu1YiSvtzE+swDYNqyHdV/U5Dqi2jKczYKx7rilQm78M7+sz163CxBm1HhZv5mEDGsKEICWZ1jHqQdrKWoZU0yVY7gITaQUWWTnngInU47y/EWfRbfWzmOVHa/Tfzrp0Fp5oR/Paq4Jcl6a8SbJtokInDScy0CN0yiVOEDXPbCTE+d0hsIgFqNt8yN8z+kc8WFWiBs8eP1HmSGNwymWPTiWGfBLB57gNOsC+3voBGDmY/ysMafNzt4r1VFAu/fpB3LC562SM3I4xP+5vwk6hA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4322.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39860400002)(136003)(366004)(346002)(71200400001)(26005)(86362001)(186003)(2906002)(52536014)(5660300002)(7416002)(55016002)(83080400001)(9686003)(83380400001)(6506007)(316002)(66946007)(8936002)(66476007)(8676002)(66446008)(7696005)(4326008)(55236004)(64756008)(54906003)(76116006)(66556008)(33656002)(478600001)(45080400002)(6916009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: ZoIwBRcwnz21vMSH/t8qrKvcSoVkA4q7GRgQ90iGG2KcMB5YqTHfBUwVPKeboc8q3MH2vXp/zDz3gRwP4HY2WOQOHh6iJK15Fm7wFkTJExv9B9lFYkset8njPfTq1ZT6cPRFQMU8P1z1d8sc06iFXkQScPH2VvJU01r5YjNQo3VRvQ7bZc+/ttC9qAkQc2+1y/CMfRRX2mfuzpq+qc/Rlgg085H/7Q4Qkb/ZAZf6/Mh7Ea8Vx+yZuZO+vvfaNseGL/PwRxGnquSzUKvk7SYIVzBHMOVIuYWQJmu3iRPxUn3sNP1qdWi/AVhRrj7lCrhdbKXGjGOO7lU26YDPvEGbvqL+69wNQCNcjDHpgW1R+Z2Xm0wFayxWlywt2u9nUUZ/JHD0BPXx0ql+aDHnVLaxOPaMt44cqlQMA2bBBW3SLqlnAPEqOXSl/UEoRYiVOwu11wf9hax/k+9imUzCx7zJuo1DE5M09MdHn0DY9fUlOwVc/bWcH3PyuSYu4RJgi61wjScj4JBsAZ0g+bWmy8BjcclzfxZPh93bd/RcGzgwyQyyUJyuvhjieEAhk2WwBny0HuKAc2L8rcMJZbm4HK9w2v1cAEWB1QVY8r9gQHAikfbUCJwMujhYGnaQy8nMWA+u7wUqhuC/cXqsl68SS1LPVQ==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4322.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abc7b22a-c60a-4d66-5fef-08d84404db8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2020 05:58:12.4105 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9Lv1/GFll5rzY/oS4NgVX9vlKUZH+8Pv9RGXLqhyvASr5gbqpw+Mt3uy1hVs4E32FQd1qc2f7S4aSdccgu6eFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3173
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1597816584; bh=RKNbvPY5UTRmNqLSg37Qx/lnP0zYIH96oV43+RyziTw=;
 h=X-PGP-Universal:ARC-Seal:ARC-Message-Signature:
 ARC-Authentication-Results:From:To:CC:Subject:Thread-Topic:
 Thread-Index:Date:Message-ID:References:In-Reply-To:
 Accept-Language:Content-Language:X-MS-Has-Attach:
 X-MS-TNEF-Correlator:authentication-results:x-originating-ip:
 x-ms-publictraffictype:x-ms-office365-filtering-correlation-id:
 x-ms-traffictypediagnostic:x-ms-exchange-transport-forked:
 x-microsoft-antispam-prvs:x-ms-oob-tlc-oobclassifiers:
 x-ms-exchange-senderadcheck:x-microsoft-antispam:
 x-microsoft-antispam-message-info:x-forefront-antispam-report:
 x-ms-exchange-antispam-messagedata:Content-Type:
 Content-Transfer-Encoding:MIME-Version:
 X-MS-Exchange-CrossTenant-AuthAs:
 X-MS-Exchange-CrossTenant-AuthSource:
 X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-originalarrivaltime:
 X-MS-Exchange-CrossTenant-fromentityheader:
 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
 X-MS-Exchange-CrossTenant-userprincipalname:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
 b=ZY6QwkrsYewBR0+glqRbeXrurpOapIpn1J7OQprclBHYAVbI+nUFD8DCQg5FT/TX+
 eC11GxAjKAaaE4zymO7M9sUq3klmShXgQ7tZqMWaOZmNLhn2Hwqd/+NRgrozAT+JaQ
 dJyuHfYpiM5v6JXW5DnVdwQMTIUYby1Xjm8GNU6zuzSCdFfOfZKnnXU3pf6nbvXFZS
 DAERpHhJoHX/qoyQKzv5mqtCcOlMs6zWSqlRLTEF4JAvS70PRFKjE4UuCter2/usmz
 EldEbLOS0nny52oJUgKlCrim2PwNcycnaicF/4NpxtFXjTAgy+GBWpNh1ktA7vz+BP
 2E21jFQZrLU1w==
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Kirti Wankhede <kwankhede@nvidia.com>, "eauger@redhat.com" <eauger@redhat.com>,
 "xin-ran.wang@intel.com" <xin-ran.wang@intel.com>,
 "corbet@lwn.net" <corbet@lwn.net>, "openstack-discuss@lists.openstack.org"
 <openstack-discuss@lists.openstack.org>,
 "shaohe.feng@intel.com" <shaohe.feng@intel.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 Parav Pandit <parav@mellanox.com>,
 "jian-feng.ding@intel.com" <jian-feng.ding@intel.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "hejie.xu@intel.com" <hejie.xu@intel.com>,
 "bao.yumeng@zte.com.cn" <bao.yumeng@zte.com.cn>, Alex
 Williamson <alex.williamson@redhat.com>,
 "eskultet@redhat.com" <eskultet@redhat.com>,
 "smooney@redhat.com" <smooney@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Jiri Pirko <jiri@mellanox.com>,
 "dinechin@redhat.com" <dinechin@redhat.com>,
 "devel@ovirt.org" <devel@ovirt.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>



> From: Yan Zhao <yan.y.zhao@intel.com>
> Sent: Wednesday, August 19, 2020 9:01 AM

> On Tue, Aug 18, 2020 at 09:39:24AM +0000, Parav Pandit wrote:

> > Please refer to my previous email which has more example and details.
> hi Parav,
> the example is based on a new vdpa tool running over netlink, not based on
> devlink, right?
Right.

> For vfio migration compatibility, we have to deal with both mdev and physical
> pci devices, I don't think it's a good idea to write a new tool for it, given we are
> able to retrieve the same info from sysfs and there's already an mdevctl from
mdev attribute should be visible in the mdev's sysfs tree.
I do not propose to write a new mdev tool over netlink. I am sorry if I implied that with my suggestion of vdpa tool.

If underlying device is vdpa, mdev might be able to understand vdpa device and query from it and populate in mdev sysfs tree.

The vdpa tool I propose is usable even without mdevs.
vdpa tool's role is to create one or more vdpa devices and place on the "vdpa" bus which is the lowest layer here.
Additionally this tool let user query virtqueue stats, db stats.
When a user creates vdpa net device, user may need to configure features of the vdpa device such as VIRTIO_NET_F_MAC, default VIRTIO_NET_F_MTU.
These are vdpa level features, attributes. Mdev is layer above it.

> Alex
> (https://nam03.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.
> com%2Fmdevctl%2Fmdevctl&amp;data=02%7C01%7Cparav%40nvidia.com%7C
> 0c2691d430304f5ea11308d843f2d84e%7C43083d15727340c1b7db39efd9ccc17
> a%7C0%7C0%7C637334057571911357&amp;sdata=KxH7PwxmKyy9JODut8BWr
> LQyOBylW00%2Fyzc4rEvjUvA%3D&amp;reserved=0).
>
Sorry for above link mangling. Our mail server is still transitioning due to company acquisition.

I am less familiar on below points to comment.

> hi All,
> could we decide that sysfs is the interface that every VFIO vendor driver needs
> to provide in order to support vfio live migration, otherwise the userspace
> management tool would not list the device into the compatible list?
> 
> if that's true, let's move to the standardizing of the sysfs interface.
> (1) content
> common part: (must)
>    - software_version: (in major.minor.bugfix scheme)
>    - device_api: vfio-pci or vfio-ccw ...
>    - type: mdev type for mdev device or
>            a signature for physical device which is a counterpart for
> 	   mdev type.
> 
> device api specific part: (must)
>   - pci id: pci id of mdev parent device or pci id of physical pci
>     device (device_api is vfio-pci)
>   - subchannel_type (device_api is vfio-ccw)
> 
> vendor driver specific part: (optional)
>   - aggregator
>   - chpid_type
>   - remote_url
> 
> NOTE: vendors are free to add attributes in this part with a restriction that this
> attribute is able to be configured with the same name in sysfs too. e.g.
> for aggregator, there must be a sysfs attribute in device node
> /sys/devices/pci0000:00/0000:00:02.0/882cc4da-dede-11e7-9180-
> 078a62063ab1/intel_vgpu/aggregator,
> so that the userspace tool is able to configure the target device according to
> source device's aggregator attribute.
> 
> 
> (2) where and structure
> proposal 1:
> |- [path to device]
>   |--- migration
>   |     |--- self
>   |     |    |-software_version
>   |     |    |-device_api
>   |     |    |-type
>   |     |    |-[pci_id or subchannel_type]
>   |     |    |-<aggregator or chpid_type>
>   |     |--- compatible
>   |     |    |-software_version
>   |     |    |-device_api
>   |     |    |-type
>   |     |    |-[pci_id or subchannel_type]
>   |     |    |-<aggregator or chpid_type>
> multiple compatible is allowed.
> attributes should be ASCII text files, preferably with only one value per file.
> 
> 
> proposal 2: use bin_attribute.
> |- [path to device]
>   |--- migration
>   |     |--- self
>   |     |--- compatible
> 
> so we can continue use multiline format. e.g.
> cat compatible
>   software_version=0.1.0
>   device_api=vfio_pci
>   type=i915-GVTg_V5_{val1:int:1,2,4,8}
>   pci_id=80865963
>   aggregator={val1}/2
> 
> Thanks
> Yan
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
