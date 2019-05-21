Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 842952514F
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 21 May 2019 16:00:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56CC889304;
	Tue, 21 May 2019 14:00:25 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE8E789304
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 21 May 2019 14:00:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 May 2019 07:00:23 -0700
X-ExtLoop1: 1
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga001.jf.intel.com with ESMTP; 21 May 2019 07:00:22 -0700
Received: from fmsmsx118.amr.corp.intel.com (10.18.116.18) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Tue, 21 May 2019 07:00:22 -0700
Received: from shsmsx152.ccr.corp.intel.com (10.239.6.52) by
 fmsmsx118.amr.corp.intel.com (10.18.116.18) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Tue, 21 May 2019 07:00:22 -0700
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.129]) by
 SHSMSX152.ccr.corp.intel.com ([169.254.6.18]) with mapi id 14.03.0415.000;
 Tue, 21 May 2019 22:00:20 +0800
From: "Zhang, Tina" <tina.zhang@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: RE: [RFC PATCH v2 0/3] drm/i915/gvt: Enable vGPU local display
 direct flip
Thread-Topic: [RFC PATCH v2 0/3] drm/i915/gvt: Enable vGPU local display
 direct flip
Thread-Index: AQHVBufBIkOTYLWO2ESEWO4fRMFghqZ0+AWAgACd6gA=
Date: Tue, 21 May 2019 14:00:19 +0000
Message-ID: <237F54289DF84E4997F34151298ABEBC8761B311@SHSMSX101.ccr.corp.intel.com>
References: <1557461728-2831-1-git-send-email-tina.zhang@intel.com>
 <20190521111143.jdlh6ujnayetmlqw@sirius.home.kraxel.org>
In-Reply-To: <20190521111143.jdlh6ujnayetmlqw@sirius.home.kraxel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYmJlZWIwOTEtNDdiYy00MTQ2LTljOWUtMWQzZTgwZjExY2FlIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiQUliQWJnODdUV2JaZ2l2azk1d0Z3UVVMS3k1QXlhNVR4OVRKakEwdVNMWlZRV3dmbmN3Ujd1ckVpRmlSQlNoOCJ9
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
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "Kondapally, Kalyan" <kalyan.kondapally@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Cgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogR2VyZCBIb2ZmbWFubiBbbWFp
bHRvOmtyYXhlbEByZWRoYXQuY29tXQo+IFNlbnQ6IFR1ZXNkYXksIE1heSAyMSwgMjAxOSA3OjEy
IFBNCj4gVG86IFpoYW5nLCBUaW5hIDx0aW5hLnpoYW5nQGludGVsLmNvbT4KPiBDYzogemhlbnl1
d0BsaW51eC5pbnRlbC5jb207IEx2LCBaaGl5dWFuIDx6aGl5dWFuLmx2QGludGVsLmNvbT47IFdh
bmcsCj4gWmhpIEEgPHpoaS5hLndhbmdAaW50ZWwuY29tPjsgVGlhbiwgS2V2aW4gPGtldmluLnRp
YW5AaW50ZWwuY29tPjsKPiBkYW5pZWxAZmZ3bGwuY2g7IEtvbmRhcGFsbHksIEthbHlhbiA8a2Fs
eWFuLmtvbmRhcGFsbHlAaW50ZWwuY29tPjsgWXVhbiwKPiBIYW5nIDxoYW5nLnl1YW5AaW50ZWwu
Y29tPjsgdmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb207IGludGVsLWd2dC0KPiBkZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4gU3ViamVjdDogUmU6IFtSRkMgUEFUQ0ggdjIgMC8zXSBkcm0v
aTkxNS9ndnQ6IEVuYWJsZSB2R1BVIGxvY2FsIGRpc3BsYXkKPiBkaXJlY3QgZmxpcAo+IAo+ICAg
SGksCj4gCj4gPiBJbi1rZXJuZWwgZGlyZWN0IGZsaXA6Cj4gPiAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCj4gPiBXaXRoICJlbmFibGVfZGlyZWN0X2ZsaXAiIHN3aXRjaGVkIG9uLCBkdXJpbmcgdkdQ
VSBwYWdlIGZsaXAsIEdWVC1nIHdpbGw6Cj4gPgo+ID4gMSkgRmluZCBvdXQgdGhlIGFzc2lnbmVk
IEhXIHBsYW5lcy4KPiA+IEdWVC1nIGlzIHRoZSBvd25lciBvZiB0aGUgSTkxNV9HRU1fT0JKRUNU
X0lTX1BST1hZIEdFTSB3aGljaCBpcwo+ID4gZXhwb3NlZCBieSBHVlQtZyB3aXRoIGRtYS1idWYg
aW50ZXJmYWNlLgo+ID4KPiA+IEdWVC1nIHNjYW4gdGhlIGZyYW1lYnVmZmVycyBzZXQgb24gdGhl
IGFjdGl2ZSBwbGFuZXMgdG8gc2VlIGlmIHRoZXJlCj4gPiBhcmUgc29tZSBmcmFtZWJ1ZmZlcnMg
d2l0aCBJOTE1X0dFTV9PQkpFQ1RfSVNfUFJPWFkgR0VNLgo+ID4KPiA+IEEgSFcgcGxhbmUgdXNp
bmcgYSBmcmFtZWJ1ZmZlciB3aXRoIEk5MTVfR0VNX09CSkVDVF9JU19QUk9YWSBHRU0gaXMKPiA+
IGNvbnNpZGVyZWQgYXMgYW4gYXNzaWduZWQgcGxhbmUuIEdWVC1nIGdldHMgdGhlIGFzc2lnbm1l
bnQgaW5mb3JtYXRpb24KPiA+IHRocm91Z2ggZ3Z0X2luZm8gc3RydWN0dXJlIG9mIHRoZSBJOTE1
X0dFTV9PQkpFQ1RfSVNfUFJPWFkgR0VNLgo+ID4KPiA+IDIpIERlY29kZSB2R1BVJ3MgZnJhbWVi
dWZmZXIgaW5mbyBhbmQgdXNlIHRoYXQgdG8gdXBkYXRlIHRoZSBzaGFkb3cKPiBmcmFtZWJ1ZmZl
ci4KPiA+Cj4gPiAzKSBDb21taXQgdGhlIHNoYWRvdyBmcmFtZWJ1ZmZlciB0aHJvdWdoICJkcm1f
YXRvbWljX2NvbW1pdCgpIi4KPiAKPiBIbW0sIG5vIHVzZXJzcGFjZSBBUEkgaW5jbHVkZWQgaW4g
dGhpcyBwYXRjaCBzZXJpZXMuCj4gCj4gVGhlIHFlbXUgYnJhbmNoIGhhcyBhbiBwYXRjaCAodmZp
by9kaXNwbGF5OiBJbnRlcmZhY2Ugb2YgcXVlcnlpbmcgdGhlIGZiIGlkCj4gb2YgdkdQVSdzIHBs
YW5lKSB3aGljaCBpc24ndCBkb2N1bWVudGVkLgo+IAo+IFdoYXQgaXMgdGhlIHBsYW4gaGVyZT8K
SGksCgpUaGUgaWRlYSBpcyB0byBzaGFyZSB0aGUgbG9jYWwgZGlzcGxheSBIVyBwbGFuZXMgYW5k
IHBpcGVzIGJldHdlZW4gVk1zLiBXZSB3YW50IHRvIGJ1aWxkIGEgZmxleGlibGUgbWVjaGFuaXNt
IGZvciBIVyBwbGFuZSBhc3NpZ25tZW50IGFuZCBndWVzdCBmcmFtZWJ1ZmZlciBkaXJlY3QgZmxp
cC4KQ3VycmVudGx5LCB0aGUgdXNlciBzcGFjZSBpbnRlcmZhY2UgaXMgb3VyIGJpZyBvcGVuIG5v
dy4KCkluIHRoZSBmaXJzdCB2ZXJzaW9uLCB3ZSBwcm9wb3NlZCB0byB1c2UgZHJtX2ZyYW1lYnVm
ZmVyIHN0YW5kaW5nIGZvciBhIHZpcnR1YWwgcGxhbmUuICBIb3N0IHVzZXMgdGhlIGRybV9mcmFt
ZWJ1ZmZlciB0byBkbyB0aGUgYXNzaWdubWVudCBhbmQgZ3Z0LWcgZGlyZWN0bHkgY29tbWl0cyB0
aGUgZ3Vlc3QgZnJhbWVidWZmZXIgdG8gdGhlIGFzc2lnbmVkIHBsYW5lLCB3aGljaCBpcyBjYWxs
ZWQgaW4ta2VybmVsIGRpcmVjdCBmbGlwLiBJbiB0aGF0IHByb3Bvc2FsIHdlIGxldmVyYWdlZCBp
OTE1IEFQSXMgdG8gZG8gdGhlIHBsYW5lIGFzc2lnbm1lbnQgYW5kIGRpcmVjdCBmbGlwLiBIb3dl
dmVyLCB3ZSBnb3QgYW4gb3BlbiBhYm91dCBob3cgdG8gZGVsaXZlciB0aGUgZHJtX2ZyYW1lYnVm
ZmVyIGlkIHRvIHRoZSBob3N0IHVzZXIgc3BhY2UgYW5kIHRoZSBpZGVhIG9mIGFkZGluZyBuZXcg
aW9jdGxzIGlzIHJlamVjdGVkIGJ5IHVwc3RyZWFtLiBTaW5jZSB0aGUgL3N5cyB3YXkgd2FzIGFs
c28gcmVqZWN0ZWQgYnkgZ3Z0LWcsIHdlIGJlZ2FuIHRvIHRoaW5rIGFib3V0IHJldXNpbmcgdmZp
byBkaXNwbGF5IGRtYS1idWYgaW50ZXJmYWNlIGZvciBwbGFuZSBhc3NpZ25tZW50LgoKSW4gdGhp
cyBzZWNvbmQgdmVyc2lvbiwgaG9zdCB1c2VzIHRoZSBkbWEtYnVmIGludGVyZmFjZSB0byBkbyB0
aGUgYXNzaWdubWVudCBhbmQgZ3Z0LWcgZGlyZWN0IGNvbW1pdHMgdGhlIGd1ZXN0IGZyYW1lYnVm
ZmVyIHRvIHRoZSBhc3NpZ25lZCBwbGFuZS4gV2UgZGlkbid0IGludHJvZHVjZSBhbnkgbmV3IGRt
YS1idWYgaW9jdGwgZm9yIHRoaXMuIEhvd2V2ZXIgZ3Z0LWcgaW4ga2VybmVsIGRvZXMgbmVlZCB0
byBrbm93IHdoZW4gdG8gc3RhcnQgaW4ta2VybmVsIGRpcmVjdCBmbGlwIGFuZCB3aGVuIHRvIHN0
b3AuIEluIHRoaXMgcHJvcG9zYWwsIGEgc3dpdGNoIGlzIGFkZGVkIHRvIHZncHUgc3lzLiBVc2Vy
IHNwYWNlIGNhbiBlbmFibGUgb3IgZGlzYWJsZSB0aGUgaW4ta2VybmVsIGRpcmVjdCBmbGlwIGJ5
IGVjaG8gMSBvciAwIHRvIHRoYXQgYXR0cmlidXRlLiBBbmQgd2Ugd291bGQgbGlrZSB0byBkaXNj
dXNzIHdpdGggdXNlciBzcGFjZSBhYm91dCB0aGlzLgoKQmVzaWRlcywgdGhlcmUgaXMgYWxzbyBh
bm90aGVyIG9wdGlvbjogdGhlIGd1ZXN0IHBhZ2UgZmxpcCBldmVudCBpcyBkZWxpdmVyZWQgdG8g
dXNlciBzcGFjZSB3aGVyZSBxZW11IHVpIGNhbiBxdWVyeSB0aGUgZG1hLWJ1ZiBpbmZvIGFuZCBj
b21taXQgdGhlIGZyYW1lYnVmZmVyIGJhc2VkIG9uIGRtYS1idWYgdG8gdGhlIEhXIHBsYW5lLiBJ
biB0aGlzIHNjZW5hcmlvLCBndnQtZyBkb2Vzbid0IGRvIHRoZSBpbi1rZXJuZWwgZGlyZWN0IGZs
aXAuIEV2ZXJ5dGhpbmcgaXMgaGFuZGxlZCBieSBob3N0IHVzZXIgc3BhY2UgKGkuZS4gcWVtdSB1
aSkuIFdpdGggdGhlIGhlbHAgZm9yIGRybSBsZWFzaW5nLCBxZW11IHVpIGNhbiBmdWxseSBjb250
cm9sIHRoZSBsZWFzZWQgcGlwZSBhbmQgcGxhbmUgcmVzb3VyY2UuIEFuZCB0aGUgdHlwaWNhbCB1
c2UgY2FzZSBpcyBwaXBlIGFzc2lnbm1lbnQgKGkuZS4gZWFjaCBWTSBpcyBzaG93biBvbiBvbmUg
cGlwZS9tb25pdG9yKS4gQ29tbWVudHMgYXJlIHdlbGNvbWUuIAoKVGhhbmtzLgoKQlIsClRpbmEK
CgoKPiAKPiBjaGVlcnMsCj4gICBHZXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
