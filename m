Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A709F3796D
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  6 Jun 2019 18:25:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 567BD89309;
	Thu,  6 Jun 2019 16:25:20 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53CFB89309
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  6 Jun 2019 16:25:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A6E4A30872C9;
 Thu,  6 Jun 2019 16:25:18 +0000 (UTC)
Received: from x1.home (ovpn-116-22.phx2.redhat.com [10.3.116.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 23C369F5E;
 Thu,  6 Jun 2019 16:25:13 +0000 (UTC)
Date: Thu, 6 Jun 2019 10:25:12 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Zhang, Tina" <tina.zhang@intel.com>
Subject: Re: [RFC PATCH v2 1/3] vfio: Use capability chains to handle device
 specific irq
Message-ID: <20190606102512.0b3d2933@x1.home>
In-Reply-To: <237F54289DF84E4997F34151298ABEBC8764837E@SHSMSX101.ccr.corp.intel.com>
References: <20190604095534.10337-1-tina.zhang@intel.com>
 <20190604095534.10337-2-tina.zhang@intel.com>
 <20190605040446.GW9684@zhen-hp.sh.intel.com>
 <237F54289DF84E4997F34151298ABEBC87646B5C@SHSMSX101.ccr.corp.intel.com>
 <20190605100942.bceke6yqjynuwk3z@sirius.home.kraxel.org>
 <237F54289DF84E4997F34151298ABEBC8764837E@SHSMSX101.ccr.corp.intel.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Thu, 06 Jun 2019 16:25:18 +0000 (UTC)
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
 Zhenyu Wang <zhenyuw@linux.intel.com>, "Yuan, Hang" <hang.yuan@intel.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVGh1LCA2IEp1biAyMDE5IDEwOjE3OjUxICswMDAwCiJaaGFuZywgVGluYSIgPHRpbmEuemhh
bmdAaW50ZWwuY29tPiB3cm90ZToKCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4g
RnJvbTogaW50ZWwtZ3Z0LWRldiBbbWFpbHRvOmludGVsLWd2dC1kZXYtYm91bmNlc0BsaXN0cy5m
cmVlZGVza3RvcC5vcmddIE9uCj4gPiBCZWhhbGYgT2Yga3JheGVsQHJlZGhhdC5jb20KPiA+IFNl
bnQ6IFdlZG5lc2RheSwgSnVuZSA1LCAyMDE5IDY6MTAgUE0KPiA+IFRvOiBaaGFuZywgVGluYSA8
dGluYS56aGFuZ0BpbnRlbC5jb20+Cj4gPiBDYzogVGlhbiwgS2V2aW4gPGtldmluLnRpYW5AaW50
ZWwuY29tPjsga3ZtQHZnZXIua2VybmVsLm9yZzsgbGludXgtCj4gPiBrZXJuZWxAdmdlci5rZXJu
ZWwub3JnOyBaaGVueXUgV2FuZyA8emhlbnl1d0BsaW51eC5pbnRlbC5jb20+OyBZdWFuLAo+ID4g
SGFuZyA8aGFuZy55dWFuQGludGVsLmNvbT47IGFsZXgud2lsbGlhbXNvbkByZWRoYXQuY29tOyBM
diwgWmhpeXVhbgo+ID4gPHpoaXl1YW4ubHZAaW50ZWwuY29tPjsgaW50ZWwtZ3Z0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmc7IFdhbmcsIFpoaSBBCj4gPiA8emhpLmEud2FuZ0BpbnRlbC5jb20+
Cj4gPiBTdWJqZWN0OiBSZTogW1JGQyBQQVRDSCB2MiAxLzNdIHZmaW86IFVzZSBjYXBhYmlsaXR5
IGNoYWlucyB0byBoYW5kbGUgZGV2aWNlCj4gPiBzcGVjaWZpYyBpcnEKPiA+IAo+ID4gICBIaSwK
PiA+ICAgCj4gPiA+ID4gUmVhbGx5IG5lZWQgdG8gc3BsaXQgZm9yIGRpZmZlcmVudCBwbGFuZXM/
IEknZCBsaWtlIGEKPiA+ID4gPiBWRklPX0lSUV9TVUJUWVBFX0dGWF9ESVNQTEFZX0VWRU5UCj4g
PiA+ID4gc28gdXNlciBzcGFjZSBjYW4gcHJvYmUgY2hhbmdlIGZvciBhbGwuICAKPiA+ICAgCj4g
PiA+IFVzZXIgc3BhY2UgY2FuIGNob29zZSB0byB1c2VyIGRpZmZlcmVudCBoYW5kbGVycyBhY2Nv
cmRpbmcgdG8gdGhlCj4gPiA+IHNwZWNpZmljIGV2ZW50LiBGb3IgZXhhbXBsZSwgdXNlciBzcGFj
ZSBtaWdodCBub3Qgd2FudCB0byBoYW5kbGUgZXZlcnkKPiA+ID4gY3Vyc29yIGV2ZW50IGR1ZSB0
byBwZXJmb3JtYW5jZSBjb25zaWRlcmF0aW9uLiBCZXNpZGVzLCBpdCBjYW4gcmVkdWNlCj4gPiA+
IHRoZSBwcm9iZSB0aW1lcywgYXMgd2UgZG9uJ3QgbmVlZCB0byBwcm9iZSB0d2ljZSB0byBtYWtl
IHN1cmUgaWYgYm90aAo+ID4gPiBjdXJzb3IgcGxhbmUgYW5kIHByaW1hcnkgcGxhbmUgaGF2ZSBi
ZWVuIHVwZGF0ZWQuICAKPiA+IAo+ID4gSSdkIHN1Z2dlc3QgdG8gdXNlIHRoZSB2YWx1ZSBwYXNz
ZWQgdmlhIGV2ZW50ZmQgZm9yIHRoYXQsIGkuZS4gaW5zdGVhZCBvZgo+ID4gc2VuZGluZyAiMSIg
dW5jb25kaXRpb25hbGx5IHNlbmQgYSBtYXNrIG9mIGNoYW5nZWQgcGxhbmVzLiAgCj4gSWYgdGhl
cmUgaXMgb25seSBvbmUgZXZlbnRmZCB3b3JraW5nIGZvciBHRlhfRElTUExBWSwgc2hvdWxkIGl0
IGJlCj4gVkZJT19JUlFfSU5GT19FVkVOVEZEIGFuZCBWRklPX0lSUV9JTkZPX0FVVE9NQVNLRUQ/
IGkuZS4gYWZ0ZXIKPiBzaWduYWxpbmcsIHRoZSBpbnRlcnJ1cHQgaXMgYXV0b21hdGljYWxseSBt
YXNrZWQgYW5kIHRoZSB1c2VyIHNwYWNlCj4gbmVlZHMgdG8gdW5tYXNrIHRoZSBsaW5lIHRvIHJl
Y2VpdmUgbmV3IGlycSBldmVudC4KCklmIHRoZXJlJ3MgYW55IHdheSBhdCBhbGwgdGhlIGludGVy
cnVwdCBpcyByYXRlIGxpbWl0ZWQgYWxyZWFkeSwgSSdkCnN1Z2dlc3Qgbm90IHRvIHVzZSBhdXRv
bWFza2VkLiAgVGhpcyBmbGFnIGlzIGdlbmVyYWxseSBpbnRlbmRlZCBmb3IKY2FzZXMgd2hlcmUg
d2UgbmVlZCB0byBtYXNrIGEgaG9zdCBpbnRlcnJ1cHQgYW5kIGRvbid0IGhhdmUgYSBnZW5lcmlj
Cm9yIGVmZmljaWVudCB3YXkgdG8gZGV0ZXJtaW5lIGFja25vd2xlZGdlbWVudCBvZiB0aGUgaW50
ZXJydXB0IGFuZAp0aGVyZWZvcmUgcmVxdWlyZSBhbiBleHBsaWNpdCB1bm1hc2suICBJZiB0aGUg
ZXZlbnRzIGhlcmUgYXJlIG5vdCBhdCBhCmhpZ2ggZnJlcXVlbmN5IG9yIHlvdSBjYW4gdGVsbCBi
eSBvdGhlciBpbnRlcmFjdGlvbnMgdGhhdCB0aGV5J3ZlIGJlZW4KYWN0ZWQgdXBvbiwgSSdkIHN1
Z2dlc3QgdG8gaGFuZGxlIHRoZXNlIGFzIGFuIGVkZ2UgdHJpZ2dlcmVkIGludGVycnVwdAp3L28g
YXV0b21hc2tlZC4gIFRoYW5rcywKCkFsZXgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
