Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 177108C24F
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 13 Aug 2019 22:48:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D916E042;
	Tue, 13 Aug 2019 20:48:05 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B5346E042;
 Tue, 13 Aug 2019 20:48:05 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Aug 2019 13:48:04 -0700
X-IronPort-AV: E=Sophos;i="5.64,382,1559545200"; d="scan'208";a="167171129"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com) ([10.7.196.65])
 by orsmga007-auth.jf.intel.com with
 ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Aug 2019 13:48:04 -0700
Date: Tue, 13 Aug 2019 13:48:37 -0700
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PULL] gvt-next
Message-ID: <20190813204836.GA17273@intel.com>
References: <20190813100604.GG19140@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190813100604.GG19140@zhen-hp.sh.intel.com>
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

T24gVHVlLCBBdWcgMTMsIDIwMTkgYXQgMDY6MDY6MDRQTSArMDgwMCwgWmhlbnl1IFdhbmcgd3Jv
dGU6Cj4gCj4gSGksCj4gCj4gSGVyZSdzIGd2dC1uZXh0IHN0dWZmIGZvciBuZXh0IGtlcm5lbCB3
aGljaCBpbmNsdWRlIHNldmVyYWwgZW5oYW5jZW1lbnQKPiBmb3IgY21kIHBhcnNlciBhbmQgYmF0
Y2ggYnVmZmVyIHNoYWRvdywgcmVtb3ZlIGV4dHJhIGRlYnVnZnMgZnVuY3Rpb24KPiByZXR1cm4g
Y2hlY2ssIGFuZCB3aXRoIG90aGVyIG1pc2MgY2hhbmdlcyBsaWtlIHR5cG8sIHN0YXRpYyBjaGVj
ayBmaXgsCj4gZXRjLgoKUHVsbGVkLCBUaGFua3MKCj4gCj4gVGhhbmtzCj4gLS0KPiBUaGUgZm9s
bG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IGUwZTcxMmZlNDJlZjY3YmRmNDVmYzM0ODc2N2Qx
ZDBhNGVlYmE3N2Y6Cj4gCj4gICBkcm0vaTkxNTogVXBkYXRlIERSSVZFUl9EQVRFIHRvIDIwMTkw
NzMwICgyMDE5LTA3LTMwIDExOjUwOjI0IC0wNzAwKQo+IAo+IGFyZSBhdmFpbGFibGUgaW4gdGhl
IEdpdCByZXBvc2l0b3J5IGF0Ogo+IAo+ICAgaHR0cHM6Ly9naXRodWIuY29tL2ludGVsL2d2dC1s
aW51eC5naXQgdGFncy9ndnQtbmV4dC0yMDE5LTA4LTEzCj4gCj4gZm9yIHlvdSB0byBmZXRjaCBj
aGFuZ2VzIHVwIHRvIDIyMGI2NWQ4MDA5ZGZmMzk3YTExMmVlNTYwYzI5NzI5OWJhNWU0MjM6Cj4g
Cj4gICBkcm0vaTkxNS9ndnQ6IERvdWJsZSBjaGVjayBiYXRjaCBidWZmZXIgc2l6ZSBhZnRlciBj
b3B5ICgyMDE5LTA4LTEzIDE3OjU1OjA2ICswODAwKQo+IAo+IC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBndnQtbmV4dC0y
MDE5LTA4LTEzCj4gCj4gLSBFbmhhbmNlIGNvbW1hbmQgcGFyc2VyIGZvciBleHRyYSBsZW5ndGgg
Y2hlY2sgKEZyZWQpCj4gLSByZW1vdmUgZGVidWdmcyBmdW5jdGlvbiByZXR1cm4gY2hlY2sgKEdy
ZWcpCj4gLSBiYXRjaCBidWZmZXIgZW5kIGRvdWJsZSBjaGVjayBhZnRlciBzaGFkb3cgY29weSAo
VGluYSkKPiAtIG9uZSB0eXBvIGZpeCAoWmhlbnl1KQo+IC0ga2xvY3dvcmsgd2FybmluZyBmaXgg
KFpoaSkKPiAtIHVzZSBzdHJ1Y3Rfc2l6ZSgpIGhlbHBlciAoR3VzdGF2bykKPiAKPiAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
Cj4gR2FvLCBGcmVkICgzKToKPiAgICAgICBkcm0vaTkxNS9ndnQ6IFV0aWxpdHkgZm9yIHZhbGlk
IGNvbW1hbmQgbGVuZ3RoIGNoZWNrCj4gICAgICAgZHJtL2k5MTUvZ3Z0OiBBZGQgTUkgY29tbWFu
ZCB2YWxpZCBsZW5ndGggY2hlY2sKPiAgICAgICBkcm0vaTkxNS9ndnQ6IEFkZCB2YWxpZCBsZW5n
dGggY2hlY2sgZm9yIE1JIHZhcmlhYmxlIGNvbW1hbmRzCj4gCj4gR3JlZyBLcm9haC1IYXJ0bWFu
ICgxKToKPiAgICAgICBkcm0vaTkxNS9ndnQ6IG5vIG5lZWQgdG8gY2hlY2sgcmV0dXJuIHZhbHVl
IG9mIGRlYnVnZnNfY3JlYXRlIGZ1bmN0aW9ucwo+IAo+IEd1c3Rhdm8gQS4gUi4gU2lsdmEgKDEp
Ogo+ICAgICAgIGRybS9pOTE1L2t2bWd0OiBVc2Ugc3RydWN0X3NpemUoKSBoZWxwZXIKPiAKPiBU
aW5hIFpoYW5nICgxKToKPiAgICAgICBkcm0vaTkxNS9ndnQ6IERvdWJsZSBjaGVjayBiYXRjaCBi
dWZmZXIgc2l6ZSBhZnRlciBjb3B5Cj4gCj4gWmhlbnl1IFdhbmcgKDEpOgo+ICAgICAgIGRybS9p
OTE1L2d2dDogRml4IHR5cG8gb2YgVkJMQU5LX1RJTUVSX1BFUklPRAo+IAo+IFpoaSBXYW5nICgx
KToKPiAgICAgICBkcm0vaTkxNS9ndnQ6IGZhY3RvciBvdXQgdGxiIGFuZCBtb2NzIHJlZ2lzdGVy
IG9mZnNldCB0YWJsZQo+IAo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvY21kX3BhcnNlci5j
ICAgfCAxODAgKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0KPiAgZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3Z0L2RlYnVnZnMuYyAgICAgIHwgIDQ3ICsrLS0tLS0tLQo+ICBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndnQvZ3Z0LmMgICAgICAgICAgfCAgIDQgKy0KPiAgZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L2d2dC5oICAgICAgICAgIHwgICA4ICstCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC9pbnRlcnJ1cHQuYyAgICB8ICAgNCArLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
a3ZtZ3QuYyAgICAgICAgfCAgMTUgKy0tCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9tbWlv
X2NvbnRleHQuYyB8ICA1NyArKysrKystLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC92
Z3B1LmMgICAgICAgICB8ICAgNCArLQo+ICA4IGZpbGVzIGNoYW5nZWQsIDIxMiBpbnNlcnRpb25z
KCspLCAxMDcgZGVsZXRpb25zKC0pCj4gCj4gCj4gLS0gCj4gT3BlbiBTb3VyY2UgVGVjaG5vbG9n
eSBDZW50ZXIsIEludGVsIGx0ZC4KPiAKPiAkZ3BnIC0ta2V5c2VydmVyIHd3d2tleXMucGdwLm5l
dCAtLXJlY3Yta2V5cyA0RDc4MTgyNwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
