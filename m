Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4DAADDF4
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  9 Sep 2019 19:23:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F391989C54;
	Mon,  9 Sep 2019 17:23:46 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78F8E89C29;
 Mon,  9 Sep 2019 17:23:45 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Sep 2019 10:23:44 -0700
X-IronPort-AV: E=Sophos;i="5.64,486,1559545200"; d="scan'208";a="189087670"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com) ([10.7.196.65])
 by orsmga006-auth.jf.intel.com with
 ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Sep 2019 10:23:44 -0700
Date: Mon, 9 Sep 2019 10:24:16 -0700
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, airlied@redhat.com,
 "Vetter, Daniel" <daniel.vetter@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PULL] gvt-next-fixes
Message-ID: <20190909172416.GB20172@intel.com>
References: <20190906054255.GC3458@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190906054255.GC3458@zhen-hp.sh.intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

SGkgZ3V5cywKCk9uIEZyaSwgU2VwIDA2LCAyMDE5IGF0IDAxOjQyOjU1UE0gKzA4MDAsIFpoZW55
dSBXYW5nIHdyb3RlOgo+IAo+IEhpLAo+IAo+IEhlcmUncyBndnQtbmV4dC1maXhlcyB3aXRoIHR3
byByZWNlbnQgZml4ZXMsIG9uZSBmb3IgcmVjZW50Cj4gZ3Vlc3QgaGFuZyByZWdyZXNzaW9uIGFu
ZCBhbm90aGVyIGZvciBndWVzdCByZXNldCBmaXguCj4gCj4gVGhhbmtzLgo+IC0tCj4gVGhlIGZv
bGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBjMzZiZWJhNmIyOTZiM2MwNWEwZjI5NzUzYjA0
Nzc1ZTVhZTIzODg2Ogo+IAo+ICAgZHJtL2k5MTU6IFNlYWwgcmFjZXMgYmV0d2VlbiBhc3luYyBH
UFUgY2FuY2VsbGF0aW9uLCByZXRpcmVtZW50IGFuZCBzaWduYWxpbmcgKDIwMTktMDUtMTMgMTM6
NTM6MzUgKzAzMDApCj4gCj4gYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6
Cj4gCj4gICBodHRwczovL2dpdGh1Yi5jb20vaW50ZWwvZ3Z0LWxpbnV4LmdpdCB0YWdzL2d2dC1u
ZXh0LWZpeGVzLTIwMTktMDktMDYKPiAKPiBmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8g
NGE1MzIyNTYwYWEyMzVlZmE4NGMwYWEzNGMwMGU1NzQ5YTA3OTJmZDoKPiAKPiAgIGRybS9pOTE1
L2d2dDogdXBkYXRlIFJJTkdfU1RBUlQgcmVnIG9mIHZHUFUgd2hlbiB0aGUgY29udGV4dCBpcyBz
dWJtaXR0ZWQgdG8gaTkxNSAoMjAxOS0wOS0wNiAxMzozOTowOSArMDgwMCkKCgokIGRpbSBwdWxs
LXJlcXVlc3QtbmV4dC1maXhlcwpVc2luZyBkcm0vZHJtLW5leHQgYXMgdGhlIHVwc3RyZWFtCmRp
bTogNGE1MzIyNTYwYWEyICgiZHJtL2k5MTUvZ3Z0OiB1cGRhdGUgUklOR19TVEFSVCByZWcgb2Yg
dkdQVSB3aGVuIHRoZSBjb250ZXh0IGlzIHN1Ym1pdHRlZCB0byBpOTE1Iik6IExpbmsgdGFnIG1p
c3NpbmcuCmRpbTogMGEzMjQyYmRiNDc3ICgiZHJtL2k5MTUvZ3Z0OiB1cGRhdGUgdmdwdSB3b3Jr
bG9hZCBoZWFkIHBvaW50ZXIgY29ycmVjdGx5Iik6IExpbmsgdGFnIG1pc3NpbmcuCmRpbTogRVJS
T1I6IGlzc3VlcyBpbiBjb21taXRzIGRldGVjdGVkLCBhYm9ydGluZwoKSSB3b25kZXIgaG93IEkg
c2hvdWxkIHByb2NlZWQgaGVyZS4gSW4gdGhlIHBhc3QgSSB3YXMgYWx3YXlzIGJ5cGFzc3Npbmcg
ZGltLApidXQgbm93IHRoYXQgZHJtIG1haW50YWluZXJzIGFsc28gdXNlIGRpbSBJJ20gc3VyZSB0
aGlzIHdpbGwgYmxvdyB1cAp0aGVyZSBhbnl3YXlzLgoKQnV0IGd2dCBwYXRjaGVzIGFyZSBub3Qg
dHJhY2tlZCBvbiBvdXIgQ0kgaW5kaXZpZHVhbGx5IGhlbmNlIHRoZXkgZG9uJ3QKaGF2ZSBMaW5r
cy4KCkphbmksIEpvb25hcywgaG93IGFyZSB5b3UgZ3V5cyBoYW5kbGluZyB0aGlzPwoKRGFuaWVs
LCBEYXZlLCBpZGVhcz8KClRoYW5rcywKUm9kcmlnby4KCj4gCj4gLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IGd2dC1uZXh0
LWZpeGVzLTIwMTktMDktMDYKPiAKPiAtIEZpeCBndWVzdCBjb250ZXh0IGhlYWQgcG9pbnRlciB1
cGRhdGUgZm9yIGhhbmcgKFhpYW9saW4pCj4gLSBGaXggZ3Vlc3QgY29udGV4dCByaW5nIHN0YXRl
IGZvciByZXNldCAoV2VpbmFuKQo+IAo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBXZWluYW4gTGkgKDEpOgo+ICAgICAg
IGRybS9pOTE1L2d2dDogdXBkYXRlIFJJTkdfU1RBUlQgcmVnIG9mIHZHUFUgd2hlbiB0aGUgY29u
dGV4dCBpcyBzdWJtaXR0ZWQgdG8gaTkxNQo+IAo+IFhpYW9saW4gWmhhbmcgKDEpOgo+ICAgICAg
IGRybS9pOTE1L2d2dDogdXBkYXRlIHZncHUgd29ya2xvYWQgaGVhZCBwb2ludGVyIGNvcnJlY3Rs
eQo+IAo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVyLmMgfCA0NSArKysrKysr
KysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMyIGluc2Vy
dGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQo+IAo+IAo+IC0tIAo+IE9wZW4gU291cmNlIFRlY2hu
b2xvZ3kgQ2VudGVyLCBJbnRlbCBsdGQuCj4gCj4gJGdwZyAtLWtleXNlcnZlciB3d3drZXlzLnBn
cC5uZXQgLS1yZWN2LWtleXMgNEQ3ODE4MjcKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQt
ZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
