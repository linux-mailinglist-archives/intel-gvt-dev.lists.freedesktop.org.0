Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5DB2C0D2
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 28 May 2019 10:06:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B34C89C3B;
	Tue, 28 May 2019 08:06:55 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7616589C3B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 28 May 2019 08:06:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 May 2019 01:06:54 -0700
X-ExtLoop1: 1
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
 by orsmga004.jf.intel.com with ESMTP; 28 May 2019 01:06:53 -0700
Received: from fmsmsx125.amr.corp.intel.com (10.18.125.40) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Tue, 28 May 2019 01:06:53 -0700
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
 FMSMSX125.amr.corp.intel.com (10.18.125.40) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Tue, 28 May 2019 01:06:52 -0700
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.129]) by
 SHSMSX151.ccr.corp.intel.com ([169.254.3.216]) with mapi id 14.03.0415.000;
 Tue, 28 May 2019 16:06:50 +0800
From: "Zhang, Tina" <tina.zhang@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: RE: [RFC PATCH v2 0/3] drm/i915/gvt: Enable vGPU local display
 direct flip
Thread-Topic: [RFC PATCH v2 0/3] drm/i915/gvt: Enable vGPU local display
 direct flip
Thread-Index: AQHVBufBIkOTYLWO2ESEWO4fRMFghqZ0+AWAgACd6gD///AGAIABHkZA//++ZwCAAhGhcIAFuxwAgACJelCAAPC/gIAAm2dg
Date: Tue, 28 May 2019 08:06:51 +0000
Message-ID: <237F54289DF84E4997F34151298ABEBC876213EF@SHSMSX101.ccr.corp.intel.com>
References: <1557461728-2831-1-git-send-email-tina.zhang@intel.com>
 <20190521111143.jdlh6ujnayetmlqw@sirius.home.kraxel.org>
 <237F54289DF84E4997F34151298ABEBC8761B311@SHSMSX101.ccr.corp.intel.com>
 <20190521193944.45cgchkcqqsv5jml@sirius.home.kraxel.org>
 <237F54289DF84E4997F34151298ABEBC8761BFC3@SHSMSX101.ccr.corp.intel.com>
 <20190522084933.nwbyyb6bbbg5pgk5@sirius.home.kraxel.org>
 <237F54289DF84E4997F34151298ABEBC8761D5E9@SHSMSX101.ccr.corp.intel.com>
 <20190527075610.rkfmhpacfjde2obj@sirius.home.kraxel.org>
 <237F54289DF84E4997F34151298ABEBC87620729@SHSMSX101.ccr.corp.intel.com>
 <20190528062953.f27phwicpigbz7e2@sirius.home.kraxel.org>
In-Reply-To: <20190528062953.f27phwicpigbz7e2@sirius.home.kraxel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMDFmN2VjZGEtMzg0NC00ZDkzLWE4ZDEtOGZiMWNmOTQyODg0IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiNERKNnp3UVVhUHlZMlN0cVhHSWllWXNKd1NtZFRHV2srenhIYjRyaHlYZkRDaXY3WmRxNDQ2R1ppU0RkUXZDUyJ9
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>, "Lv, 
 Zhiyuan" <zhiyuan.lv@intel.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "Kondapally, Kalyan" <kalyan.kondapally@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Cgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogR2VyZCBIb2ZmbWFubiBbbWFp
bHRvOmtyYXhlbEByZWRoYXQuY29tXQo+IFNlbnQ6IFR1ZXNkYXksIE1heSAyOCwgMjAxOSAyOjMw
IFBNCj4gVG86IFpoYW5nLCBUaW5hIDx0aW5hLnpoYW5nQGludGVsLmNvbT4KPiBDYzogVGlhbiwg
S2V2aW4gPGtldmluLnRpYW5AaW50ZWwuY29tPjsgemhlbnl1d0BsaW51eC5pbnRlbC5jb207IFl1
YW4sCj4gSGFuZyA8aGFuZy55dWFuQGludGVsLmNvbT47IHZpbGxlLnN5cmphbGFAbGludXguaW50
ZWwuY29tOyBMdiwgWmhpeXVhbgo+IDx6aGl5dWFuLmx2QGludGVsLmNvbT47IGRhbmllbEBmZnds
bC5jaDsgS29uZGFwYWxseSwgS2FseWFuCj4gPGthbHlhbi5rb25kYXBhbGx5QGludGVsLmNvbT47
IGludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBXYW5nLAo+IFpoaSBBIDx6aGku
YS53YW5nQGludGVsLmNvbT4KPiBTdWJqZWN0OiBSZTogW1JGQyBQQVRDSCB2MiAwLzNdIGRybS9p
OTE1L2d2dDogRW5hYmxlIHZHUFUgbG9jYWwgZGlzcGxheQo+IGRpcmVjdCBmbGlwCj4gCj4gICBI
aSwKPiAKPiA+ID4gQ3JlYXRpbmcgYSBsZWFzZSBkb2Vzbid0IHdvcmsgaGVyZS4KPiA+ID4KPiA+
ID4ga2VybmVsIGlzIDUuMS41LiAgeG9yZyBzZXJ2ZXIgaXMgaXMgMS4yMC40LCByZXBvcnRpbmcg
eHJhbmRyIHZlcnNpb24KPiA+ID4gMS42LiAgV2hpY2ggc2hvdWxkIGJlIG5ldyBlbm91Z2guCj4g
PiBUaGlzIGlzIG91ciByZWZlcmVuY2VkIHZlcnNpb25zOgo+ID4gS2VybmVsOiA1LjIuMCAoaG93
ZXZlciA1LjEuNSBzaG91bGQgYWxzbyB3b3JrKQo+ID4gWG9yZzogMS4yMC40IHJlcG9ydGluZyB4
cmFuZHIgdmVyc2lvbiAxLjYKPiA+IExpYnhjYjogMS4xMwo+ID4gWGNiLXByb3RvOiAxLjEzCj4g
PiBYb3JncHJvdG86IDIwMTguNC00Cj4gPiBMaWJkcm06IDIuNC45NQo+ID4KPiA+IEFsc28sIHlv
dSBjYW4gcmVmZXJlbmNlIHRoZSBzdGF0dXMgb2YgZHJtIGxlYXNlcyBzdXBwb3J0Ogo+ID4gaHR0
cHM6Ly9oYWFnY2guZnJpY2tlbC5jbHViLyMhZHJtbGVhc2UubWQKPiAKPiBBaCwgdGhlIG5vbi1k
ZXNrdG9wIHByb3BlcnR5IGxvb2tzIGltcG9ydGFudC4KTm8sIG5vbi1kZXNrdG9wIHByb3BlcnR5
IGlzbid0IG5lZWRlZC4KCj4gCj4gVHVybmVkIG91dHB1dCBvZmYgKHhyYW5kciAtLW91dHB1dCBI
RE1JLTIgLS1vZmYpLgo+IFNldCBub24tZGVza3RvcCBwcm9wZXJ0eSAoeHJhbmRyIC0tb3V0cHV0
IEhETUktMiAtLXNldCBub24tZGVza3RvcCAxKS4KPiBVcGRhdGVkIHFlbXUgY29kZSB0byBsb29r
IGZvciBub24tZGVza3RvcCBvdXRwdXRzLgo+IAo+IFN0aWxsIG5vdCB3b3JraW5nIDotKAo+IAo+
ID4gV2hlbiB5b3UgdHJpZWQgdGhpcyB3b3JrCj4gPiBodHRwczovL2dpdGh1Yi5jb20vaW50ZWwv
SWd2dGctCj4gcWVtdS9jb21taXQvMjg4MWQ5YTY1YmViMzE5YzQyYjk0N2QyM2ViCj4gPiAxZDI2
MDIyNGJjZGRjLCBkaWQgeW91IGFkZCAiZW5hYmxlLWRybWxlYXNlPW9uIiBtZW50aW9uZWQgaW4g
dGhlCj4gPiBjb21taXQgbWVzc2FnZT8KPiAKPiBVc2luZyBodHRwczovL2dpdC5rcmF4ZWwub3Jn
L2NnaXQvcWVtdS9sb2cvP2g9c2lyaXVzL2Rpc3BsYXktZHJtLCBJIGdldCB0aGlzOgo+IAo+ICMg
cWVtdS1zeXN0ZW0teDg2XzY0IC1kaXNwbGF5IGRybSxlbmFibGUtZHJtbGVhc2U9b24KPiBxZW11
LXN5c3RlbS14ODZfNjQ6IGluZm86IGRybS1sZWFzZTogc2NyZWVuIGlzIDAKPiBxZW11LXN5c3Rl
bS14ODZfNjQ6IGluZm86IGRybS1sZWFzZTogcm9vdCB3aW5kb3cgaXMgMHgxNWQKPiBxZW11LXN5
c3RlbS14ODZfNjQ6IGluZm86IGRybS1sZWFzZTogeHJhbmRyOiBtYWpvci1vcGNvZGUgMTQwLCBm
aXJzdC1lcnJvcgo+IDE0NywgZmlyc3QtZXZlbnQgODkKPiBxZW11LXN5c3RlbS14ODZfNjQ6IGlu
Zm86IGRybS1sZWFzZTogeHJhbmRyOiBjbGllbnQgdjEuNiwgc2VydmVyIHYxLjYKPiBxZW11LXN5
c3RlbS14ODZfNjQ6IGluZm86IGRybS1sZWFzZTogeHJhbmRyOiAgIG91dHB1dCAweDQyOiBuYW1l
IEhETUktMSwKPiBub24tZGVza3RvcCAwCj4gcWVtdS1zeXN0ZW0teDg2XzY0OiBpbmZvOiBkcm0t
bGVhc2U6IHhyYW5kcjogICBvdXRwdXQgMHg0MzogbmFtZSBIRE1JLTIsCj4gbm9uLWRlc2t0b3Ag
MQo+IHFlbXUtc3lzdGVtLXg4Nl82NDogaW5mbzogZHJtLWxlYXNlOiB4cmFuZHI6ICAgb3V0cHV0
IDB4NDQ6IG5hbWUgRFAtMSwKPiBub24tZGVza3RvcCAwCj4gcWVtdS1zeXN0ZW0teDg2XzY0OiBp
bmZvOiBkcm0tbGVhc2U6IHhyYW5kcjogdXNpbmcgb3V0cHV0IDB4NDMKPiBxZW11LXN5c3RlbS14
ODZfNjQ6IGluZm86IGRybS1sZWFzZTogeHJhbmRyOiB1c2luZyBjcnRjIDB4NDAKPiBxZW11LXN5
c3RlbS14ODZfNjQ6IGRybS1sZWFzZTogeHJhbmRyOiBjcmVhdGUgbGVhc2UgZmFpbGVkOiBCYWRN
YXRjaCAoY29kZQo+IDgsIG9wIDE0MDo0NSkKV2UgdXNlZCB5b3VyIGxhdGVzdCBjb2RlIGFuZCBy
ZW1vdmVkIHRoZSBwYXJ0IGZvciAibm9uLWRlc2t0b3AiLCBhbmQgaXQgY2FuIHdvcmsgaW4gb3Vy
IGVudmlyb25tZW50LgpJdCBzZWVtcyB0aGUgdXNlZCB4b3JnIGRvZXNuJ3QgaW5jbHVkZSBkcm0t
bGVhc2UuIFdlIHVzZSB0aGUgbGF0ZXN0IHhvcmcgaW4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0
b3Aub3JnL3hvcmcveHNlcnZlciAgYnJhbmNoOiBtYXN0ZXIKCkJSLApUaW5hCj4gCj4gSG1tLgo+
IAo+IGNoZWVycywKPiAgIEdlcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
