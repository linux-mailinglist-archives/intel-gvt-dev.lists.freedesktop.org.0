Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E30DBABE24
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  6 Sep 2019 18:57:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A199D6E331;
	Fri,  6 Sep 2019 16:57:40 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABAAB6E331;
 Fri,  6 Sep 2019 16:57:39 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Sep 2019 09:57:38 -0700
X-IronPort-AV: E=Sophos;i="5.64,473,1559545200"; d="scan'208";a="185832204"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com) ([10.7.196.65])
 by orsmga003-auth.jf.intel.com with
 ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Sep 2019 09:57:38 -0700
Date: Fri, 6 Sep 2019 09:58:09 -0700
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PULL] gvt-next-fixes
Message-ID: <20190906165809.GA9034@intel.com>
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

CgpPbiBGcmksIFNlcCAwNiwgMjAxOSBhdCAwMTo0Mjo1NVBNICswODAwLCBaaGVueXUgV2FuZyB3
cm90ZToKPiAKPiBIaSwKPiAKPiBIZXJlJ3MgZ3Z0LW5leHQtZml4ZXMgd2l0aCB0d28gcmVjZW50
IGZpeGVzLCBvbmUgZm9yIHJlY2VudAo+IGd1ZXN0IGhhbmcgcmVncmVzc2lvbiBhbmQgYW5vdGhl
ciBmb3IgZ3Vlc3QgcmVzZXQgZml4Lgo+IAo+IFRoYW5rcy4KPiAtLQo+IFRoZSBmb2xsb3dpbmcg
Y2hhbmdlcyBzaW5jZSBjb21taXQgYzM2YmViYTZiMjk2YjNjMDVhMGYyOTc1M2IwNDc3NWU1YWUy
Mzg4NjoKPiAKPiAgIGRybS9pOTE1OiBTZWFsIHJhY2VzIGJldHdlZW4gYXN5bmMgR1BVIGNhbmNl
bGxhdGlvbiwgcmV0aXJlbWVudCBhbmQgc2lnbmFsaW5nICgyMDE5LTA1LTEzIDEzOjUzOjM1ICsw
MzAwKQo+IAo+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Ogo+IAo+ICAg
aHR0cHM6Ly9naXRodWIuY29tL2ludGVsL2d2dC1saW51eC5naXQgdGFncy9ndnQtbmV4dC1maXhl
cy0yMDE5LTA5LTA2CgpwdWxsZWQsIHRoYW5rcwoKPiAKPiBmb3IgeW91IHRvIGZldGNoIGNoYW5n
ZXMgdXAgdG8gNGE1MzIyNTYwYWEyMzVlZmE4NGMwYWEzNGMwMGU1NzQ5YTA3OTJmZDoKPiAKPiAg
IGRybS9pOTE1L2d2dDogdXBkYXRlIFJJTkdfU1RBUlQgcmVnIG9mIHZHUFUgd2hlbiB0aGUgY29u
dGV4dCBpcyBzdWJtaXR0ZWQgdG8gaTkxNSAoMjAxOS0wOS0wNiAxMzozOTowOSArMDgwMCkKPiAK
PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCj4gZ3Z0LW5leHQtZml4ZXMtMjAxOS0wOS0wNgo+IAo+IC0gRml4IGd1ZXN0IGNv
bnRleHQgaGVhZCBwb2ludGVyIHVwZGF0ZSBmb3IgaGFuZyAoWGlhb2xpbikKPiAtIEZpeCBndWVz
dCBjb250ZXh0IHJpbmcgc3RhdGUgZm9yIHJlc2V0IChXZWluYW4pCj4gCj4gLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IFdl
aW5hbiBMaSAoMSk6Cj4gICAgICAgZHJtL2k5MTUvZ3Z0OiB1cGRhdGUgUklOR19TVEFSVCByZWcg
b2YgdkdQVSB3aGVuIHRoZSBjb250ZXh0IGlzIHN1Ym1pdHRlZCB0byBpOTE1Cj4gCj4gWGlhb2xp
biBaaGFuZyAoMSk6Cj4gICAgICAgZHJtL2k5MTUvZ3Z0OiB1cGRhdGUgdmdwdSB3b3JrbG9hZCBo
ZWFkIHBvaW50ZXIgY29ycmVjdGx5Cj4gCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9zY2hl
ZHVsZXIuYyB8IDQ1ICsrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCj4gCj4gCj4gLS0g
Cj4gT3BlbiBTb3VyY2UgVGVjaG5vbG9neSBDZW50ZXIsIEludGVsIGx0ZC4KPiAKPiAkZ3BnIC0t
a2V5c2VydmVyIHd3d2tleXMucGdwLm5ldCAtLXJlY3Yta2V5cyA0RDc4MTgyNwoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFp
bGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
