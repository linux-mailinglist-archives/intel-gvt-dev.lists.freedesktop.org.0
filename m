Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 258F957E73
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 27 Jun 2019 10:44:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D955D6E834;
	Thu, 27 Jun 2019 08:44:19 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 974AE6E834
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 27 Jun 2019 08:44:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Jun 2019 01:44:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,423,1557212400"; d="scan'208";a="185197942"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by fmsmga004.fm.intel.com with ESMTP; 27 Jun 2019 01:44:18 -0700
Received: from shsmsx106.ccr.corp.intel.com (10.239.4.159) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 27 Jun 2019 01:44:18 -0700
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.87]) by
 SHSMSX106.ccr.corp.intel.com ([169.254.10.89]) with mapi id 14.03.0439.000;
 Thu, 27 Jun 2019 16:44:16 +0800
From: "Zhang, Tina" <tina.zhang@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: RE: [RFC PATCH v3 0/4] Deliver vGPU display vblank event to userspace
Thread-Topic: [RFC PATCH v3 0/4] Deliver vGPU display vblank event to userspace
Thread-Index: AQHVLJqUUSM/9sKZ/UyimYY5z7yeLaaughWAgACsmuA=
Date: Thu, 27 Jun 2019 08:44:15 +0000
Message-ID: <237F54289DF84E4997F34151298ABEBC876835E5@SHSMSX101.ccr.corp.intel.com>
References: <20190627033802.1663-1-tina.zhang@intel.com>
 <20190627062231.57tywityo6uyhmyd@sirius.home.kraxel.org>
In-Reply-To: <20190627062231.57tywityo6uyhmyd@sirius.home.kraxel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOGRkMjk1OGYtYWY4My00ODBkLWFlNTMtYjZhZjIwM2Y5NTVlIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiSjliTHc4bVZ4QTlUZWp0ZVwvd1dydjhaTW42UVZqWmt3bFVEVWVSRU1ZelJxXC9YWXB1Ymw0T3Y5XC82S2hOZ0QrSyJ9
x-ctpclassification: CTP_NT
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Cgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogR2VyZCBIb2ZmbWFubiBbbWFp
bHRvOmtyYXhlbEByZWRoYXQuY29tXQo+IFNlbnQ6IFRodXJzZGF5LCBKdW5lIDI3LCAyMDE5IDI6
MjMgUE0KPiBUbzogWmhhbmcsIFRpbmEgPHRpbmEuemhhbmdAaW50ZWwuY29tPgo+IENjOiBpbnRl
bC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsga3ZtQHZnZXIua2VybmVsLm9yZzsgbGlu
dXgtCj4ga2VybmVsQHZnZXIua2VybmVsLm9yZzsgemhlbnl1d0BsaW51eC5pbnRlbC5jb207IEx2
LCBaaGl5dWFuCj4gPHpoaXl1YW4ubHZAaW50ZWwuY29tPjsgV2FuZywgWmhpIEEgPHpoaS5hLndh
bmdAaW50ZWwuY29tPjsgVGlhbiwgS2V2aW4KPiA8a2V2aW4udGlhbkBpbnRlbC5jb20+OyBZdWFu
LCBIYW5nIDxoYW5nLnl1YW5AaW50ZWwuY29tPjsKPiBhbGV4LndpbGxpYW1zb25AcmVkaGF0LmNv
bQo+IFN1YmplY3Q6IFJlOiBbUkZDIFBBVENIIHYzIDAvNF0gRGVsaXZlciB2R1BVIGRpc3BsYXkg
dmJsYW5rIGV2ZW50IHRvCj4gdXNlcnNwYWNlCj4gCj4gICBIaSwKPiAKPiA+IEluc3RlYWQgb2Yg
ZGVsaXZlcmluZyBwYWdlIGZsaXAgZXZlbnRzLCB3ZSBjaG9vc2UgdG8gcG9zdCBkaXNwbGF5Cj4g
PiB2YmxhbmsgZXZlbnQuIEhhbmRsaW5nIHBhZ2UgZmxpcCBldmVudHMgZm9yIGJvdGggcHJpbWFy
eSBwbGFuZSBhbmQKPiA+IGN1cnNvciBwbGFuZSBtYXkgbWFrZSB1c2VyIHNwYWNlIHF1aXRlIGJ1
c3ksIGFsdGhvdWdoIHdlIGhhdmUgdGhlCj4gPiBtYXNrL3VubWFzayBtZWNoYW5zaW0gZm9yIG1p
dGlnYXRpb24uIEJlc2lkZXMsIHRoZXJlIGFyZSBzb21lIGNhc2VzCj4gPiB0aGF0IGd1ZXN0IGFw
cCBvbmx5IHVzZXMgb25lIGZyYW1lYnVmZmVyIGZvciBib3RoIGRyYXdpbmcgYW5kIGRpc3BsYXku
Cj4gPiBJbiBzdWNoIGNhc2UsIGd1ZXN0IE9TIHdvbid0IGRvIHRoZSBwbGFuZSBwYWdlIGZsaXAg
d2hlbiB0aGUKPiA+IGZyYW1lYnVmZmVyIGlzIHVwZGF0ZWQsIHRodXMgdGhlIHVzZXIgbGFuZCB3
b24ndCBiZSBub3RpZmllZCBhYm91dCB0aGUKPiB1cGRhdGVkIGZyYW1lYnVmZmVyLgo+IAo+IFdo
YXQgaGFwcGVucyB3aGVuIHRoZSBndWVzdCBpcyBpZGxlIGFuZCBkb2Vzbid0IGRyYXcgYW55dGhp
bmcgdG8gdGhlCj4gZnJhbWVidWZmZXI/ClRoZSB2YmxhbmsgZXZlbnQgd2lsbCBiZSBkZWxpdmVy
ZWQgdG8gdXNlcnNwYWNlIGFzIHdlbGwsIHVubGVzcyBndWVzdCBPUyBkaXNhYmxlIHRoZSBwaXBl
LgpEb2VzIGl0IG1ha2Ugc2Vuc2UgdG8gdmZpby9kaXNwbGF5PwpUaGFua3MuCgpCUiwKVGluYQo+
IAo+IGNoZWVycywKPiAgIEdlcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
