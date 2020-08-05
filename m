Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F233223C741
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  5 Aug 2020 09:57:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A34B989D5B;
	Wed,  5 Aug 2020 07:56:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80041.outbound.protection.outlook.com [40.107.8.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62A4E89D5B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  5 Aug 2020 07:56:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L5ZXAqUVbQZGaRwyYWJEuvD3kj+MdBEQcot6O3nWhD2HVEF5H8xU8AGGHfnXukHI9Rsa9bmNI19Mhj5Am1fLEnTcA/IG6Cv/QQwbPIXe/c/fAzSNWFaLrXd5P35TnA8wTlo2FpqChwRT6PDLp+setKg5A1stY9fiKqTRK2G0obZlVmOEPxTeWy0tPjVvIeh7WbhCBrInDjTTpfgnl5do7cICZPbV1wGmgeaWP/V8IUWhfsyDRXgKNETpNfO+/btbIWv91HubmGMLAzhu/wTBVi3xmXNyHNMHHhYELCC0kRGGXcw2DzhoKNBRpCZ4BplAs1bhJfJBFUHBtzqP2hMSOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EbNPv1R+k2nbLYPV+shm9GIPARgusFUsHOINDiQiyy4=;
 b=JCQK8adGovbwXCPiVKpY2Jds12bTt0AkzF/ehIG1iCbrNuRCn/8mysVYT9bchKW2Bb1h4daaJ683pFiX0DXAU/873ZROsNACzXIbvnMFSXaDAIRFqHyMPKTAnHVNkS0c+olnNs236msOqRJrv9PoyOGYr8oYDUBlal8pz1qmTMcTeF0zVJhZOhGawf54+X21BB7WWHU2DNv3TlUTqwQpSHBoYjOx16ZkWl50I1pWkI1pCY0J/xXkqDd+oyvsMVu7V038OSy+ghOM7TxHCm84f6oR8dXFUPlVDLNHwr41c84cg+BTd/zT2xw0iFsG99B3ao6zLO/wuO3FeNN9ko3y6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EbNPv1R+k2nbLYPV+shm9GIPARgusFUsHOINDiQiyy4=;
 b=Z9iyLLK8mfy6YafufrIqaHUYJtPy8fFSYlj2UbBKdBZBZbI9ULD7zGm7YkZG0SQMRu4dzkBbPaZhg+mZXLSKwKkf1UKFxZOflCO5FUdj8hZvRMMQN/EZO8cI4MKTWTU/qY1yC2El1TWhC6pGuiaDxQ6ztaJKFWOBAGr0HqL3NxQ=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=mellanox.com;
Received: from DBBPR05MB6364.eurprd05.prod.outlook.com (2603:10a6:10:cc::22)
 by DB6PR05MB3175.eurprd05.prod.outlook.com (2603:10a6:6:1a::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.21; Wed, 5 Aug
 2020 07:56:50 +0000
Received: from DBBPR05MB6364.eurprd05.prod.outlook.com
 ([fe80::6510:4e88:1d64:18ae]) by DBBPR05MB6364.eurprd05.prod.outlook.com
 ([fe80::6510:4e88:1d64:18ae%6]) with mapi id 15.20.3239.022; Wed, 5 Aug 2020
 07:56:50 +0000
Date: Wed, 5 Aug 2020 09:56:47 +0200
From: Jiri Pirko <jiri@mellanox.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: device compatibility interface for live migration with assigned
 devices
Message-ID: <20200805075647.GB2177@nanopsycho>
References: <20200716083230.GA25316@joy-OptiPlex-7040>
 <20200717101258.65555978@x1.home>
 <20200721005113.GA10502@joy-OptiPlex-7040>
 <20200727072440.GA28676@joy-OptiPlex-7040>
 <20200727162321.7097070e@x1.home>
 <20200729080503.GB28676@joy-OptiPlex-7040>
 <20200804183503.39f56516.cohuck@redhat.com>
 <c178a0d3-269d-1620-22b1-9010f602d8ff@redhat.com>
 <20200805021654.GB30485@joy-OptiPlex-7040>
 <2624b12f-3788-7e2b-2cb7-93534960bcb7@redhat.com>
Content-Disposition: inline
In-Reply-To: <2624b12f-3788-7e2b-2cb7-93534960bcb7@redhat.com>
X-ClientProxiedBy: AM3PR05CA0111.eurprd05.prod.outlook.com
 (2603:10a6:207:2::13) To DBBPR05MB6364.eurprd05.prod.outlook.com
 (2603:10a6:10:cc::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nanopsycho (85.163.43.78) by
 AM3PR05CA0111.eurprd05.prod.outlook.com (2603:10a6:207:2::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.18 via Frontend Transport; Wed, 5 Aug 2020 07:56:48 +0000
X-Originating-IP: [85.163.43.78]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a0f298bf-b4dd-480f-3113-08d839151c24
X-MS-TrafficTypeDiagnostic: DB6PR05MB3175:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR05MB3175BD23467E065328E83AB6BD4B0@DB6PR05MB3175.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lDvHMIHpv7EzsvyTJFYjdzyFCSe5U4rMCmPH3+sO9MB6RNO0rU6neBKGygKTlLEkqREIsqXo0ocLBwHHm/Dp2yInyswCjBFYq+Ja/U1eM6fooyp3OJKjFCTnnNWOsVPBqoRnWJLke8y4GT5zyG00QclXVVo8Q/K01V2cNEHyWROoBc1ijPbGnWkvK16Uo/MEKNq4ObTF4YXy9ZJnsWJzyL4BJIyf+yYnCu6f0awahZ4dfhMmaPxVxHPBUdij3GeKK6xrrp/fw0mb45nD+zC8+F40nAwPlsxIqRZywUA/RIo2zFME/Nor5RFIRHSmOKbqD78FTGAgccVAXnLP2donBA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBPR05MB6364.eurprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(396003)(39860400002)(136003)(376002)(346002)(52116002)(1076003)(6496006)(33656002)(186003)(6916009)(16526019)(83380400001)(33716001)(4326008)(7416002)(8676002)(66946007)(107886003)(66556008)(9686003)(316002)(55016002)(956004)(54906003)(9576002)(26005)(66476007)(8936002)(478600001)(2906002)(5660300002)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 6S3J6wgGvb7OcvIZ6WtR8asRmOocJVJf7f7lxACv4LrrxUXoif1AQhIgmUbMgrlwxHQHBJGuTVlM++1PF9excntvpyjzPqLi0kUYwS9YZRjpmI8aEafAt03IguZcSn5QkcjAIAVySUDDJbc5X8G1QcAtyPcPxjwfflX+aL8dz5lNhSIUiglEwS2f0FNuzcwddkUgUiU3t5Zemf8ZS7bVWW6TpdPAzOoq7kcysyxs7UNVpIbmqNuac0lMVnsuHwE73VdPGgvk11dRNtmYd1kadsgsN02V4YiFZTaQs9R1Y7KNNLe+rXcV9GZ2fwu1bCY9utyL1MC+q1UP78aDwzGPCQ6xvnFy7q/Mruhagy4j2LO5PjWsxEGuuhAuVccFwMfNATizNmbBWUVvBAROZZdfmSS7JKw/+yaEY22hfVBWW+76NJXytPnBq8bDxWJajrfZrhUwf0YJj6iqEc/JwXg3tg9arooqa3uVXSpR42nQrwnmfGIcg2qpcINV/zUhiZkJkIB8zxCJBA16S8dIOHP8LL9TLaNI3lx51Mol7Cy0Y9l5nH916s8MHPfrO7zCWss1MW85qFgYPmmVTWguNjkY/JSnF18nyKQWtrSNM2YDz0ZaYoANj3wgSweXMQw3Uc3fGIyD3qiVDDvmNRyX9ZB3Gw==
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0f298bf-b4dd-480f-3113-08d839151c24
X-MS-Exchange-CrossTenant-AuthSource: DBBPR05MB6364.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2020 07:56:50.5503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VYLNiFI0+SasNmxGipEiqY1WF4rX7pS5y+aEjtjG/X6ZHAdtg0JLUE/s+YgPCW80yyGti26ruNiFV1hibH6V0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR05MB3175
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
Cc: Cornelia Huck <cohuck@redhat.com>, kvm@vger.kernel.org,
 libvir-list@redhat.com, qemu-devel@nongnu.org, kwankhede@nvidia.com,
 eauger@redhat.com, xin-ran.wang@intel.com, eskultet@redhat.com,
 openstack-discuss@lists.openstack.org, shaohe.feng@intel.com,
 kevin.tian@intel.com, Yan Zhao <yan.y.zhao@intel.com>,
 Parav Pandit <parav@mellanox.com>, jian-feng.ding@intel.com,
 dgilbert@redhat.com, zhenyuw@linux.intel.com, hejie.xu@intel.com,
 bao.yumeng@zte.com.cn, Alex Williamson <alex.williamson@redhat.com>,
 smooney@redhat.com, intel-gvt-dev@lists.freedesktop.org, berrange@redhat.com,
 corbet@lwn.net, dinechin@redhat.com, devel@ovirt.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

V2VkLCBBdWcgMDUsIDIwMjAgYXQgMDQ6NDE6NTRBTSBDRVNULCBqYXNvd2FuZ0ByZWRoYXQuY29t
IHdyb3RlOgo+Cj5PbiAyMDIwLzgvNSDkuIrljYgxMDoxNiwgWWFuIFpoYW8gd3JvdGU6Cj4+IE9u
IFdlZCwgQXVnIDA1LCAyMDIwIGF0IDEwOjIyOjE1QU0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6
Cj4+ID4gT24gMjAyMC84LzUg5LiK5Y2IMTI6MzUsIENvcm5lbGlhIEh1Y2sgd3JvdGU6Cj4+ID4g
PiBbc29ycnkgYWJvdXQgbm90IGNoaW1pbmcgaW4gZWFybGllcl0KPj4gPiA+IAo+PiA+ID4gT24g
V2VkLCAyOSBKdWwgMjAyMCAxNjowNTowMyArMDgwMAo+PiA+ID4gWWFuIFpoYW8gPHlhbi55Lnpo
YW9AaW50ZWwuY29tPiB3cm90ZToKPj4gPiA+IAo+PiA+ID4gPiBPbiBNb24sIEp1bCAyNywgMjAy
MCBhdCAwNDoyMzoyMVBNIC0wNjAwLCBBbGV4IFdpbGxpYW1zb24gd3JvdGU6Cj4+ID4gPiAoLi4u
KQo+PiA+ID4gCj4+ID4gPiA+ID4gQmFzZWQgb24gdGhlIGZlZWRiYWNrIHdlJ3ZlIHJlY2VpdmVk
LCB0aGUgcHJldmlvdXNseSBwcm9wb3NlZCBpbnRlcmZhY2UKPj4gPiA+ID4gPiBpcyBub3Qgdmlh
YmxlLiAgSSB0aGluayB0aGVyZSdzIGFncmVlbWVudCB0aGF0IHRoZSB1c2VyIG5lZWRzIHRvIGJl
Cj4+ID4gPiA+ID4gYWJsZSB0byBwYXJzZSBhbmQgaW50ZXJwcmV0IHRoZSB2ZXJzaW9uIGluZm9y
bWF0aW9uLiAgVXNpbmcganNvbiBzZWVtcwo+PiA+ID4gPiA+IHZpYWJsZSwgYnV0IEkgZG9uJ3Qg
a25vdyBpZiBpdCdzIHRoZSBiZXN0IG9wdGlvbi4gIElzIHRoZXJlIGFueQo+PiA+ID4gPiA+IHBy
ZWNlZGVudCBvZiBtYXJrdXAgc3RyaW5ncyByZXR1cm5lZCB2aWEgc3lzZnMgd2UgY291bGQgZm9s
bG93Pwo+PiA+ID4gSSBkb24ndCB0aGluayBlbmNvZGluZyBjb21wbGV4IGluZm9ybWF0aW9uIGlu
IGEgc3lzZnMgZmlsZSBpcyBhIHZpYWJsZQo+PiA+ID4gYXBwcm9hY2guIFF1b3RpbmcgRG9jdW1l
bnRhdGlvbi9maWxlc3lzdGVtcy9zeXNmcy5yc3Q6Cj4+ID4gPiAKPj4gPiA+ICJBdHRyaWJ1dGVz
IHNob3VsZCBiZSBBU0NJSSB0ZXh0IGZpbGVzLCBwcmVmZXJhYmx5IHdpdGggb25seSBvbmUgdmFs
dWUKPj4gPiA+IHBlciBmaWxlLiBJdCBpcyBub3RlZCB0aGF0IGl0IG1heSBub3QgYmUgZWZmaWNp
ZW50IHRvIGNvbnRhaW4gb25seSBvbmUKPj4gPiA+IHZhbHVlIHBlciBmaWxlLCBzbyBpdCBpcyBz
b2NpYWxseSBhY2NlcHRhYmxlIHRvIGV4cHJlc3MgYW4gYXJyYXkgb2YKPj4gPiA+IHZhbHVlcyBv
ZiB0aGUgc2FtZSB0eXBlLgo+PiA+ID4gTWl4aW5nIHR5cGVzLCBleHByZXNzaW5nIG11bHRpcGxl
IGxpbmVzIG9mIGRhdGEsIGFuZCBkb2luZyBmYW5jeQo+PiA+ID4gZm9ybWF0dGluZyBvZiBkYXRh
IGlzIGhlYXZpbHkgZnJvd25lZCB1cG9uLiIKPj4gPiA+IAo+PiA+ID4gRXZlbiB0aG91Z2ggdGhp
cyBpcyBhbiBvbGRlciBmaWxlLCBJIHRoaW5rIHRoZXNlIHJlc3RyaWN0aW9ucyBzdGlsbAo+PiA+
ID4gYXBwbHkuCj4+ID4gCj4+ID4gKzEsIHRoYXQncyBhbm90aGVyIHJlYXNvbiB3aHkgZGV2bGlu
ayhuZXRsaW5rKSBpcyBiZXR0ZXIuCj4+ID4gCj4+IGhpIEphc29uLAo+PiBkbyB5b3UgaGF2ZSBh
bnkgbWF0ZXJpYWxzIG9yIHNhbXBsZSBjb2RlIGFib3V0IGRldmxpbmssIHNvIHdlIGNhbiBoYXZl
IGEgZ29vZAo+PiBzdHVkeSBvZiBpdD8KPj4gSSBmb3VuZCBzb21lIGtlcm5lbCBkb2NzIGFib3V0
IGl0IGJ1dCBteSBwcmVsaW1pbmFyeSBzdHVkeSBkaWRuJ3Qgc2hvdyBtZSB0aGUKPj4gYWR2YW50
YWdlIG9mIGRldmxpbmsuCj4KPgo+Q0MgSmlyaSBhbmQgUGFyYXYgZm9yIGEgYmV0dGVyIGFuc3dl
ciBmb3IgdGhpcy4KPgo+TXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IHRoZSBmb2xsb3dpbmcgYWR2
YW50YWdlcyBhcmUgb2J2aW91cyAoYXMgSSByZXBsaWVkCj5pbiBhbm90aGVyIHRocmVhZCk6Cj4K
Pi0gZXhpc3RpbmcgdXNlcnMgKE5JQywgY3J5cHRvLCBTQ1NJLCBpYiksIG1hdHVyZSBhbmQgc3Rh
YmxlCj4tIG11Y2ggYmV0dGVyIGVycm9yIHJlcG9ydGluZyAoZXh0X2FjayBvdGhlciB0aGFuIHN0
cmluZyBvciBlcnJubykKPi0gbmFtZXNwYWNlIGF3YXJlCj4tIGRvIG5vdCBjb3VwbGUgd2l0aCBr
b2JqZWN0CgpKYXNvbiwgd2hhdCBpcyB5b3VyIHVzZSBjYXNlPwoKCgo+Cj5UaGFua3MKPgo+Cj4+
IAo+PiBUaGFua3MKPj4gWWFuCj4+IAo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldgo=
