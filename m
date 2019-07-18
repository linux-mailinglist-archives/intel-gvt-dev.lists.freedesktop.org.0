Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F51F6C952
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 18 Jul 2019 08:36:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F11A6E312;
	Thu, 18 Jul 2019 06:36:41 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A62166E312
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 18 Jul 2019 06:36:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jul 2019 23:36:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,276,1559545200"; d="scan'208";a="179150787"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by orsmga002.jf.intel.com with ESMTP; 17 Jul 2019 23:36:38 -0700
Received: from shsmsx103.ccr.corp.intel.com (10.239.4.69) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 17 Jul 2019 23:36:38 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.110]) by
 SHSMSX103.ccr.corp.intel.com ([169.254.4.109]) with mapi id 14.03.0439.000;
 Thu, 18 Jul 2019 14:36:36 +0800
From: "Gao, Fred" <fred.gao@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: RE: [PATCH v1 1/3] drm/i915/gvt: Utility for valid command length
 check
Thread-Topic: [PATCH v1 1/3] drm/i915/gvt: Utility for valid command length
 check
Thread-Index: AQHVOtO/F9gWiM2IuU+7469eikGAtqbPWyQAgACVEWA=
Date: Thu, 18 Jul 2019 06:36:36 +0000
Message-ID: <12E1D2244F454645A164A13EDCBDDB3B42A0C8EF@SHSMSX104.ccr.corp.intel.com>
References: <20190714220704.13812-1-fred.gao@intel.com>
 <20190718054132.GH16681@zhen-hp.sh.intel.com>
In-Reply-To: <20190718054132.GH16681@zhen-hp.sh.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYWU4NTRhMjMtYzE1ZC00ZjhiLWIzZmUtMGNlNTUzY2M3YjNmIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiYUF0bndvUU56d2NVRm9COW9HYjZhXC9NRjBsRVZQcHJJUUxFN1UwMXl2QlEzOEppRTRcL2FmV1I2UGR3d1JMWE56In0=
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VGhhbmtzIC4NCiBJdCBpcyB0aGUgTFJJIGNtZCBpbiBrZXJuZWwgIHdobyBpcyBub3QgbWF0Y2hl
ZCB3aXRoIGludGVsIGRvY3MuDQpXaWxsIHNlbmQgdGhlIHVwZGF0ZWQgc2VyaWVzIGxhdGVyLg0K
DQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogWmhlbnl1IFdhbmcgPHpoZW55dXdA
bGludXguaW50ZWwuY29tPiANClNlbnQ6IDIwMTnlubQ35pyIMTjml6UgMTM6NDINClRvOiBHYW8s
IEZyZWQgPGZyZWQuZ2FvQGludGVsLmNvbT4NCkNjOiBpbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KU3ViamVjdDogUmU6IFtQQVRDSCB2MSAxLzNdIGRybS9pOTE1L2d2dDogVXRp
bGl0eSBmb3IgdmFsaWQgY29tbWFuZCBsZW5ndGggY2hlY2sNCg0KT24gMjAxOS4wNy4xNSAwNjow
NzowNCArMDgwMCwgZnJlZCBnYW8gd3JvdGU6DQo+IEZyb206ICJHYW8sIEZyZWQiIDxmcmVkLmdh
b0BpbnRlbC5jb20+DQo+IA0KPiBBZGQgdXRpbGl0eSBmb3IgdmFsaWQgY29tbWFuZCBsZW5ndGgg
Y2hlY2suDQo+IA0KPiB2MjogQWRkIEZfVkFMX0NPTlNUIGZsYWcgdG8gaWRlbnRpZnkgdGhlIHZh
bHVlIGlzIGNvbnN0DQo+ICAgICBhbHRob3VnaCBMRU4gbWF5YmUgdmFyaWFibGUuIChaaGVueXUp
DQo+IHYzOiB1bnVzZWQgY29kZSByZW1vdmFsLCBmbGFnIHJlbmFtZS9jb25mbGljdC4gKFpoZW55
dSkNCj4gdjQ6IHJlZGVmaW5lIEZfSVBfQURWQU5DRV9DVVNUT00gYW5kIG1vdmUgdGhlIGNoZWNr
IGZ1bmN0aW9uIHRvDQo+ICAgICBuZXh0IHBhdGNoLiAoWmhlbnl1KQ0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogR2FvLCBGcmVkIDxmcmVkLmdhb0BpbnRlbC5jb20+DQo+IC0tLQ0KDQpJIGp1c3QgdHJ5
IHRvIHRlc3QgdGhpcyBzZXJpZXMgYXMgSSBoYXZlbid0IGNoZWNrZWQgYWxsIGRlZmluaXRpb24g
Y29ycmVjdG5lc3MgZm9yIHRoZXNlIGNtZHMuIE9uIGxhdGVzdCBndnQtc3RhZ2luZyBmb3IgaG9z
dC9ndWVzdCwgSSBnb3QgYmVsb3cgZXJyb3IgdGhhdCBmYWlsZWQgbGludXggZ3Vlc3QuDQoNClsg
IDU3OC42OTIyMDFdIHZmaW9fbWRldiA1OWY0MWY5NC1hOTFlLTExZTktYmNhNS03N2UwNmUwZjU4
MTM6IEFkZGluZyB0byBpb21tdSBncm91cCAwIFsgIDU3OC42OTIyMDRdIHZmaW9fbWRldiA1OWY0
MWY5NC1hOTFlLTExZTktYmNhNS03N2UwNmUwZjU4MTM6IE1ERVY6IGdyb3VwX2lkID0gMCBbICA2
MDIuMTAzMjE0XSBbZHJtOmRybV9tb2RlX2FkZGZiMl0gW0ZCOjEwNF0gWyAgNjAzLjMwMTYxOF0g
Z3Z0OiBsZW4gaXMgbm90IHZhbGlkOiAgbGVuPTE5ICB2YWxpZF9sZW49MyBbICA2MDMuMzAxNjIx
XSBndnQ6IHZncHUgMTogY21kIHBhcnNlciBlcnJvciBbICA2MDMuMzAxNjIyXSAweDAgWyAgNjAz
LjMwMTYyMl0gMHgyMiANCg0KWyAgNjAzLjMwMTYyNF0gZ3Z0OiB2Z3B1IDE6IHNjYW4gd29ya2xv
YWQgZXJyb3IgWyAgNjAzLjMwMTYyNV0gR1ZUIEludGVybmFsIGVycm9yICBmb3IgdGhlIGd1ZXN0
IFsgIDYwMy4zMDE2MjZdIE5vdyB2Z3B1IDEgd2lsbCBlbnRlciBmYWlsc2FmZSBtb2RlLg0KWyAg
NjAzLjMwMTYyN10gZ3Z0OiB2Z3B1IDE6IGZhaWxlZCB0byBzdWJtaXQgZGVzYyAwIFsgIDYwMy4z
MDE2MjhdIGd2dDogdmdwdSAxOiBmYWlsIHN1Ym1pdCB3b3JrbG9hZCBvbiByaW5nIDAgWyAgNjAz
LjMwMTYyOV0gZ3Z0OiB2Z3B1IDE6IGZhaWwgdG8gZW11bGF0ZSBNTUlPIHdyaXRlIDAwMDAyMjMw
IGxlbiA0DQoNClBscyB2ZXJpZnkgdGhpcyBzZXJpZXMgYWdhaW5zdCBsYXRlc3QgZ3Z0LXN0YWdp
bmcuDQoNCi0tDQpPcGVuIFNvdXJjZSBUZWNobm9sb2d5IENlbnRlciwgSW50ZWwgbHRkLg0KDQok
Z3BnIC0ta2V5c2VydmVyIHd3d2tleXMucGdwLm5ldCAtLXJlY3Yta2V5cyA0RDc4MTgyNw0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRl
diBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
