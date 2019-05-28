Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4422BE26
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 28 May 2019 06:18:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4729B89AB6;
	Tue, 28 May 2019 04:18:36 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2DE489AB6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 28 May 2019 04:18:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 533EBC049E23;
 Tue, 28 May 2019 04:18:34 +0000 (UTC)
Received: from x1.home (ovpn-116-22.phx2.redhat.com [10.3.116.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A0A31001DD7;
 Tue, 28 May 2019 04:18:31 +0000 (UTC)
Date: Mon, 27 May 2019 22:18:31 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Zhang, Tina" <tina.zhang@intel.com>
Subject: Re: [PATCH 1/2] vfio: ABI for setting mdev display flip eventfd
Message-ID: <20190527221831.71bddcc5@x1.home>
In-Reply-To: <237F54289DF84E4997F34151298ABEBC87620FF2@SHSMSX101.ccr.corp.intel.com>
References: <20190527084312.8872-1-tina.zhang@intel.com>
 <20190527084312.8872-2-tina.zhang@intel.com>
 <20190527080430.28f40888@x1.home>
 <237F54289DF84E4997F34151298ABEBC87620FF2@SHSMSX101.ccr.corp.intel.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Tue, 28 May 2019 04:18:34 +0000 (UTC)
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>, "kraxel@redhat.com" <kraxel@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Lv, Zhiyuan" <zhiyuan.lv@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVHVlLCAyOCBNYXkgMjAxOSAwMTo0Mjo1NyArMDAwMAoiWmhhbmcsIFRpbmEiIDx0aW5hLnpo
YW5nQGludGVsLmNvbT4gd3JvdGU6Cgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+
IEZyb206IGludGVsLWd2dC1kZXYgW21haWx0bzppbnRlbC1ndnQtZGV2LWJvdW5jZXNAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnXSBPbgo+ID4gQmVoYWxmIE9mIEFsZXggV2lsbGlhbXNvbgo+ID4gU2Vu
dDogTW9uZGF5LCBNYXkgMjcsIDIwMTkgMTA6MDUgUE0KPiA+IFRvOiBaaGFuZywgVGluYSA8dGlu
YS56aGFuZ0BpbnRlbC5jb20+Cj4gPiBDYzoga3ZtQHZnZXIua2VybmVsLm9yZzsgbGludXgta2Vy
bmVsQHZnZXIua2VybmVsLm9yZzsKPiA+IHpoZW55dXdAbGludXguaW50ZWwuY29tOyBZdWFuLCBI
YW5nIDxoYW5nLnl1YW5AaW50ZWwuY29tPjsKPiA+IGtyYXhlbEByZWRoYXQuY29tOyBpbnRlbC1n
dnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgTHYsIFpoaXl1YW4KPiA+IDx6aGl5dWFuLmx2
QGludGVsLmNvbT4KPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS8yXSB2ZmlvOiBBQkkgZm9yIHNl
dHRpbmcgbWRldiBkaXNwbGF5IGZsaXAgZXZlbnRmZAo+ID4gCj4gPiBPbiBNb24sIDI3IE1heSAy
MDE5IDE2OjQzOjExICswODAwCj4gPiBUaW5hIFpoYW5nIDx0aW5hLnpoYW5nQGludGVsLmNvbT4g
d3JvdGU6Cj4gPiAgIAo+ID4gPiBBZGQgVkZJT19ERVZJQ0VfU0VUX0dGWF9GTElQX0VWRU5URkQg
aW9jdGwgY29tbWFuZCB0byBzZXQgZXZlbnRmZAo+ID4gPiBiYXNlZCBzaWduYWxpbmcgbWVjaGFu
aXNtIHRvIGRlbGl2ZXIgdkdQVSBmcmFtZWJ1ZmZlciBwYWdlIGZsaXAgZXZlbnQKPiA+ID4gdG8g
dXNlcnNwYWNlLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBUaW5hIFpoYW5nIDx0aW5hLnpo
YW5nQGludGVsLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBpbmNsdWRlL3VhcGkvbGludXgvdmZpby5o
IHwgMTIgKysrKysrKysrKysrCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygr
KQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2xpbnV4L3ZmaW8uaCBiL2lu
Y2x1ZGUvdWFwaS9saW51eC92ZmlvLmgKPiA+ID4gaW5kZXggMDJiYjdhZDZlOTg2Li4yNzMwMDU5
NzcxN2YgMTAwNjQ0Cj4gPiA+IC0tLSBhL2luY2x1ZGUvdWFwaS9saW51eC92ZmlvLmgKPiA+ID4g
KysrIGIvaW5jbHVkZS91YXBpL2xpbnV4L3ZmaW8uaAo+ID4gPiBAQCAtNjk2LDYgKzY5NiwxOCBA
QCBzdHJ1Y3QgdmZpb19kZXZpY2VfaW9ldmVudGZkIHsKPiA+ID4KPiA+ID4gICNkZWZpbmUgVkZJ
T19ERVZJQ0VfSU9FVkVOVEZECQlfSU8oVkZJT19UWVBFLCBWRklPX0JBU0UgKyAgCj4gPiAxNikg
IAo+ID4gPgo+ID4gPiArLyoqCj4gPiA+ICsgKiBWRklPX0RFVklDRV9TRVRfR0ZYX0ZMSVBfRVZF
TlRGRCAtIF9JT1coVkZJT19UWVBFLCBWRklPX0JBU0UgIAo+ID4gKyAxNywgIAo+ID4gPiArX19z
MzIpCj4gPiA+ICsgKgo+ID4gPiArICogU2V0IGV2ZW50ZmQgYmFzZWQgc2lnbmFsaW5nIG1lY2hh
bmlzbSB0byBkZWxpdmVyIHZHUFUgZnJhbWVidWZmZXIKPiA+ID4gK3BhZ2UKPiA+ID4gKyAqIGZs
aXAgZXZlbnQgdG8gdXNlcnNwYWNlLiBBIHZhbHVlIG9mIC0xIGlzIHVzZWQgdG8gc3RvcCB0aGUg
cGFnZQo+ID4gPiArZmxpcAo+ID4gPiArICogZGVsaXZlcmluZy4KPiA+ID4gKyAqCj4gPiA+ICsg
KiBSZXR1cm46IDAgb24gc3VjY2VzcywgLWVycm5vIG9uIGZhaWx1cmUuCj4gPiA+ICsgKi8KPiA+
ID4gKwo+ID4gPiArI2RlZmluZSBWRklPX0RFVklDRV9TRVRfR0ZYX0ZMSVBfRVZFTlRGRCBfSU8o
VkZJT19UWVBFLCAgCj4gPiBWRklPX0JBU0UgKyAgCj4gPiA+ICsxNykKPiA+ID4gKwo+ID4gPiAg
LyogLS0tLS0tLS0gQVBJIGZvciBUeXBlMSBWRklPIElPTU1VIC0tLS0tLS0tICovCj4gPiA+Cj4g
PiA+ICAvKiogIAo+ID4gCj4gPiBXaHkgY2FuJ3Qgd2UgdXNlIFZGSU9fREVWSUNFX1NFVF9JUlFT
IGZvciB0aGlzPyAgV2UgY2FuIGFkZCBhIGNhcGFiaWxpdHkKPiA+IHRvIHZmaW9faXJxX2luZm8g
aW4gdGhlIHNhbWUgd2F5IHRoYXQgd2UgZGlkIGZvciByZWdpb25zIHRvIGRlc2NyaWJlIGRldmlj
ZQo+ID4gc3BlY2lmaWMgSVJRIHN1cHBvcnQuICBUaGFua3MsICAKPiBBZGQgYSBuZXcga2luZCBv
ZiBpbmRleCwgbGlrZSB0aGlzPwo+IGVudW0gewo+ICAgICAgICAgVkZJT19QQ0lfSU5UWF9JUlFf
SU5ERVgsCj4gICAgICAgICBWRklPX1BDSV9NU0lfSVJRX0lOREVYLAo+ICAgICAgICAgVkZJT19Q
Q0lfTVNJWF9JUlFfSU5ERVgsCj4gICAgICAgICBWRklPX1BDSV9FUlJfSVJRX0lOREVYLAo+ICAg
ICAgICAgVkZJT19QQ0lfUkVRX0lSUV9JTkRFWCwKPiArICAgICAgVkZJT19QQ0lfR0ZYX0ZMSVBf
RVZFTlRfSU5ERVgsCj4gICAgICAgICBWRklPX1BDSV9OVU1fSVJRUwo+IH07Cj4gUGVyaGFwcyB0
aGlzIGlzIHdoYXQgd2UgZG9uJ3Qgd2FudC4gVGhpcwo+IFZGSU9fUENJX0dGWF9GTElQX0VWRU5U
X0lOREVYIGlzIHNwZWNpZmljIHRvIGdyYXBoaWNzIGNhcmQgYW5kIGl0J3MKPiBhY3R1YWxseSBh
biBldmVudCB3aGljaCBpcyByZXBvcnRlZCBieSBJTlRYL01TSS8gTVNJWCBJUlEuIFRoYW5rcy4K
ClJpZ2h0LCB0aGF0IGlzIG5vdCB3aGF0IEknbSBzdWdnZXN0aW5nLiAgV2hhdCBJJ20gbG9va2lu
ZyBmb3IgaXMgYQpzaW1pbGFyIGNvbnZlcnNpb24gdG8gd2hhdCB3ZSBkaWQgZm9yIHJlZ2lvbnMs
IHdoZXJlIHdlIGV4dGVuZGVkIHRoZQpkYXRhIHJldHVybmVkIGluIEdFVF9SRUdJT05fSU5GTyB0
byBpbmNsdWRlIGNhcGFiaWxpdGllcwooYzg0OTgyYWRiMjNiKSwgY2FwcGVkIHRoZSBudW1iZXIg
b2YgcmVnaW9ucyB3ZSBkZWZpbmUgd2l0aCBmaXhlZAppbmRleGVzIChjN2JiNGNiNDBmODkpLCBh
bmQgYWRkZWQgZGV2aWNlIHNwZWNpZmljIHJlZ2lvbnMsIHN1Y2ggYXMgSUdECk9wUmVnaW9uICg1
ODQ2ZmY1NGU4N2QpIGFuZCBJR0QgaG9zdCBhbmQgTFBDIGJyaWRnZXMgKGY1NzJhOTYwYTE1ZSku
ClRoZSBzYW1lIHRoaW5nIHNob3VsZCBoYXBwZW4gaGVyZSwgdGhlIGN1cnJlbnQgdmFsdWUgb2YK
VkZJT19QQ0lfTlVNX0lSUVMgYmVjb21lcyBmaXhlZCBhbmQgcGFydCBvZiB0aGUgdmZpby1wY2kg
QUJJLAp2ZmlvX2lycV9pbmZvIGlzIGV4dGVuZGVkIHdpdGggY2FwYWJpbGl0eSBzdXBwb3J0IGZv
bGxvd2luZyB0aGUgc2FtZQptZWNoYW5pc20sIGhlYWRlcnMsIGFuZCBoZWxwZXJzIHdlIHVzZSBm
b3IgcmVnaW9ucywgdGhlbiB0aGUgbWRldiBkZXZpY2UKc2ltcGx5IGV4cG9zZXMgdGhlIGV4dGVu
ZGVkIChhbmQgYmFja3dhcmRzIGNvbXBhdGlibGUpIEFQSSB3aXRob3V0CnJlcXVpcmluZyBhIGRl
dmljZSBzcGVjaWZpYyBpb2N0bC4gIFRoYW5rcywKCkFsZXgKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50
ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
