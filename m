Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8466F13D22F
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 16 Jan 2020 03:31:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 433CD6EBB9;
	Thu, 16 Jan 2020 02:30:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70089.outbound.protection.outlook.com [40.107.7.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A2646EBBA
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 16 Jan 2020 02:30:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HR0gpZAIDLir9/xnlKZJf+A8OzMAHnA2Dj880bsokDpgvgrFelesM6ZHZDjA6Sa7KYa+BBdB0m6JyWQvr2ckupuWZ9ciu11+gXnnH2m5riGyUmnLFpIy60zf6Xs6ntltvXo8UGxD6bm3CHwhg8QY6V+CBT4s8GdzaJFY1cEiPd5ZK7f2LjSarb7M2BJPZQjvgZQrWkgmlRz6dmUUBcs/fGpHxozaFSWq6/SUbmjIwAGj6ysb+YKq1HkUAyOsj0zOFtgGTaZe9mb/t+GcCh/VKc+OKzKJOh18xuQrnYREgcg7QMylkiEh2OwfZ0oHb5ldJwglydJMw6685AHEdg+Epw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YNf7NOzBlVEVnItBVhSPKv5ExYYinWHj6hAshwgZxGY=;
 b=JFJLXxEbReL0u3qdc01Tv5PGks2RD6brXp+9ANnFCQ9lL9k+taQpf3fnz8b3veiMi7DkEKoEWTuUFFjhoIIKVBhLCnY6gOp4NA6eCs3ToW8UfN6s4wWUGNNAs1Ur1mvF7lANOFTOR/e3J1o0B9craC7/PMCecaiNFkq4UO1acP9uo00pDTIf3UIjmHf3T+VCo0AlrwckKVOGpvQ5gSmJ+Nbl01hYNNLqmmMF45YZOmtqXYDSji3KTdCAt4lC3JR3Oux8puJYlGgpkAp11noIa6HBSRoP2w+mrWJX1OxY5QqkAqhVYfkzBf7A0SDHd3aYWVOUoG7kw8x8iggGSZ8E6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nextfour.com; dmarc=pass action=none header.from=nextfour.com;
 dkim=pass header.d=nextfour.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NextfourGroupOy.onmicrosoft.com;
 s=selector2-NextfourGroupOy-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YNf7NOzBlVEVnItBVhSPKv5ExYYinWHj6hAshwgZxGY=;
 b=p5hVayL77QYeNipp7UoRP3EN0wgyAnNc/4gq4T9n/gXbycYhDjxAsHbUlDGOY2M/Q9cBueqTcpQBM1epENx0DEJDDuJzSgvRgbIc1dPg8y4hyUX9JQiV1x0KDgf40ymEHu5rbOn4ef0OS8G6tNWe4R/vSJJyvnCzgBFqR8kk+TQ=
Received: from VI1PR03MB3775.eurprd03.prod.outlook.com (52.134.21.155) by
 VI1PR03MB3582.eurprd03.prod.outlook.com (52.134.26.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.13; Thu, 16 Jan 2020 02:30:53 +0000
Received: from VI1PR03MB3775.eurprd03.prod.outlook.com
 ([fe80::fdfe:b987:16ad:9de9]) by VI1PR03MB3775.eurprd03.prod.outlook.com
 ([fe80::fdfe:b987:16ad:9de9%5]) with mapi id 15.20.2623.018; Thu, 16 Jan 2020
 02:30:53 +0000
Received: from [192.168.1.121] (91.145.109.188) by
 HE1PR0701CA0071.eurprd07.prod.outlook.com (2603:10a6:3:64::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.10 via Frontend Transport; Thu, 16 Jan 2020 02:30:52 +0000
From: =?utf-8?B?TWlrYSBQZW50dGlsw6Q=?= <mika.penttila@nextfour.com>
To: Alex Williamson <alex.williamson@redhat.com>, Yan Zhao
 <yan.y.zhao@intel.com>
Subject: Re: [PATCH v2 1/2] vfio: introduce vfio_dma_rw to read/write a range
 of IOVAs
Thread-Topic: [PATCH v2 1/2] vfio: introduce vfio_dma_rw to read/write a range
 of IOVAs
Thread-Index: AQHVy1izPc+ONnk2aUegZV3QDrVrz6fsJ+UAgABrWAA=
Date: Thu, 16 Jan 2020 02:30:52 +0000
Message-ID: <80cf3888-2e51-3fd7-a064-213e7ded188e@nextfour.com>
References: <20200115034132.2753-1-yan.y.zhao@intel.com>
 <20200115035303.12362-1-yan.y.zhao@intel.com>
 <20200115130638.6926dd08@w520.home>
In-Reply-To: <20200115130638.6926dd08@w520.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0701CA0071.eurprd07.prod.outlook.com
 (2603:10a6:3:64::15) To VI1PR03MB3775.eurprd03.prod.outlook.com
 (2603:10a6:803:2b::27)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=mika.penttila@nextfour.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.145.109.188]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3f6a1b21-5f78-45ed-b90b-08d79a2c1b8c
x-ms-traffictypediagnostic: VI1PR03MB3582:
x-microsoft-antispam-prvs: <VI1PR03MB3582FF5E399CF22B870C91B283360@VI1PR03MB3582.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 02843AA9E0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(366004)(136003)(346002)(396003)(39830400003)(189003)(199004)(31686004)(8676002)(16526019)(54906003)(31696002)(81156014)(16576012)(36756003)(2616005)(8936002)(86362001)(186003)(81166006)(26005)(110136005)(71200400001)(66556008)(4326008)(6486002)(64756008)(66446008)(85182001)(2906002)(66476007)(5660300002)(66946007)(508600001)(956004)(316002)(52116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR03MB3582;
 H:VI1PR03MB3775.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nextfour.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: F3V3raZja/DAqhbbXS8M316jYGjGnITssmOz30ysl1jhbtcspatnHpD26lNCb4c7OHKNQqWTgBc61V5N0MxgxuEC/WF5juDkRy01TBdmHnbSzExpGWrTC3ILPAnNPWN5O6gCV+xufMoZTJQ/MaF9TODCdFcZV9s5PVsM9B7JEC0jhWKL7oqTAtPH9uhB+e3gvfeTxnH+U5fMA5gGUUvYCtDZ1pD4RPjM7iWh6RU9Xs6V5n4R/WCwSl48sodwSv8si1IBuL6LpwjebZ860qPTwMVMU+IBgBObekpflB0Pb9LetehExf9GLfxqSmldjos9jKurQ3ZJMbGP/WyZOWoWC7fJfdiw2aS14fvYbVWye26YVpnJHdV7VRnRX3XAR8wuwQ+ZQARXhKOIlrNKpiqCYU03irV+ULAg4D49NyL9xF+yy9rZOOvvayUsATbSKiCV
x-ms-exchange-transport-forked: True
Content-ID: <2A03A68253609840BF1CFE9C065D25C4@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nextfour.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f6a1b21-5f78-45ed-b90b-08d79a2c1b8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2020 02:30:52.9889 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 972e95c2-9290-4a02-8705-4014700ea294
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OVR7qSQOJHtwD6pO4lLw9poKhRCpCCrKlWYBCk/OBFyuxpqlFselY0lLaCGr82gZHozhYRKtmjaiUg3ElwuHL+DuTp92ZnWBhoRPKYcpq1E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB3582
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
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>



On 15.1.2020 22.06, Alex Williamson wrote:
> On Tue, 14 Jan 2020 22:53:03 -0500
> Yan Zhao <yan.y.zhao@intel.com> wrote:
>
>> vfio_dma_rw will read/write a range of user space memory pointed to by
>> IOVA into/from a kernel buffer without pinning the user space memory.
>>
>> TODO: mark the IOVAs to user space memory dirty if they are written in
>> vfio_dma_rw().
>>
>> Cc: Kevin Tian <kevin.tian@intel.com>
>> Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
>> ---
>>   drivers/vfio/vfio.c             | 45 +++++++++++++++++++
>>   drivers/vfio/vfio_iommu_type1.c | 76 +++++++++++++++++++++++++++++++++
>>   include/linux/vfio.h            |  5 +++
>>   3 files changed, 126 insertions(+)
>>
>> diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
>> index c8482624ca34..8bd52bc841cf 100644
>> --- a/drivers/vfio/vfio.c
>> +++ b/drivers/vfio/vfio.c
>> @@ -1961,6 +1961,51 @@ int vfio_unpin_pages(struct device *dev, unsigned long *user_pfn, int npage)
>>   }
>>   EXPORT_SYMBOL(vfio_unpin_pages);
>>   
>> +/*
>> + * Read/Write a range of IOVAs pointing to user space memory into/from a kernel
>> + * buffer without pinning the user space memory
>> + * @dev [in]  : device
>> + * @iova [in] : base IOVA of a user space buffer
>> + * @data [in] : pointer to kernel buffer
>> + * @len [in]  : kernel buffer length
>> + * @write     : indicate read or write
>> + * Return error code on failure or 0 on success.
>> + */
>> +int vfio_dma_rw(struct device *dev, dma_addr_t iova, void *data,
>> +		   size_t len, bool write)
>> +{
>> +	struct vfio_container *container;
>> +	struct vfio_group *group;
>> +	struct vfio_iommu_driver *driver;
>> +	int ret = 0;

Do you know the iova given to vfio_dma_rw() is indeed a gpa and not iova 
from a iommu mapping? So isn't it you actually assume all the guest is 
pinned,
like from device assignment?

Or who and how is the vfio mapping added before the vfio_dma_rw() ?

Thanks,
Mika

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
