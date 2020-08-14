Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C029F244495
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 14 Aug 2020 07:33:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EE346E2D6;
	Fri, 14 Aug 2020 05:33:45 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 154586E2D6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 14 Aug 2020 05:33:42 +0000 (UTC)
IronPort-SDR: hjLr/dTGpYS6cNLH85C0oGDAakk6ACA1AcLdVUy0Hul2HhOe9iIfPg0qNILu5z9idQMqMmvbdA
 FbogCNrIyRZg==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="215886196"
X-IronPort-AV: E=Sophos;i="5.76,311,1592895600"; d="scan'208";a="215886196"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 22:33:42 -0700
IronPort-SDR: 17ObhB5L4p5rZsodtaj4w23ZImAhmDiWJogmKa2wPSRra7i4k7Xor01hjtt9SY9BA0hx1EzUd4
 hSz/jzm8mpvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,311,1592895600"; d="scan'208";a="325623341"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.16])
 by orsmga008.jf.intel.com with ESMTP; 13 Aug 2020 22:33:36 -0700
Date: Fri, 14 Aug 2020 13:16:01 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: device compatibility interface for live migration with assigned
 devices
Message-ID: <20200814051601.GD15344@joy-OptiPlex-7040>
References: <20200804183503.39f56516.cohuck@redhat.com>
 <c178a0d3-269d-1620-22b1-9010f602d8ff@redhat.com>
 <20200805021654.GB30485@joy-OptiPlex-7040>
 <2624b12f-3788-7e2b-2cb7-93534960bcb7@redhat.com>
 <20200805075647.GB2177@nanopsycho>
 <eb1d01c2-fbad-36b6-10cf-9e03483a736b@redhat.com>
 <20200805093338.GC30485@joy-OptiPlex-7040>
 <20200805105319.GF2177@nanopsycho>
 <20200810074631.GA29059@joy-OptiPlex-7040>
 <e6e75807-0614-bd75-aeb6-64d643e029d3@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e6e75807-0614-bd75-aeb6-64d643e029d3@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
Cc: kvm@vger.kernel.org, libvir-list@redhat.com, qemu-devel@nongnu.org,
 kwankhede@nvidia.com, eauger@redhat.com, xin-ran.wang@intel.com,
 corbet@lwn.net, eskultet@redhat.com, openstack-discuss@lists.openstack.org,
 shaohe.feng@intel.com, kevin.tian@intel.com, Parav Pandit <parav@mellanox.com>,
 jian-feng.ding@intel.com, dgilbert@redhat.com, zhenyuw@linux.intel.com,
 hejie.xu@intel.com, bao.yumeng@zte.com.cn,
 Alex Williamson <alex.williamson@redhat.com>, smooney@redhat.com,
 intel-gvt-dev@lists.freedesktop.org, berrange@redhat.com,
 Cornelia Huck <cohuck@redhat.com>, Jiri Pirko <jiri@mellanox.com>,
 dinechin@redhat.com, devel@ovirt.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTMsIDIwMjAgYXQgMTI6MjQ6NTBQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzgvMTAg5LiL5Y2IMzo0NiwgWWFuIFpoYW8gd3JvdGU6Cj4gPiA+IGRy
aXZlciBpcyBpdCBoYW5kbGVkIGJ5Pwo+ID4gSXQgbG9va3MgdGhhdCB0aGUgZGV2bGluayBpcyBm
b3IgbmV0d29yayBkZXZpY2Ugc3BlY2lmaWMsIGFuZCBpbgo+ID4gZGV2bGluay5oLCBpdCBzYXlz
Cj4gPiBpbmNsdWRlL3VhcGkvbGludXgvZGV2bGluay5oIC0gTmV0d29yayBwaHlzaWNhbCBkZXZp
Y2UgTmV0bGluawo+ID4gaW50ZXJmYWNlLAo+IAo+IAo+IEFjdHVhbGx5IG5vdCwgSSB0aGluayB0
aGVyZSB1c2VkIHRvIGhhdmUgc29tZSBkaXNjdXNzaW9uIGxhc3QgeWVhciBhbmQgdGhlCj4gY29u
Y2x1c2lvbiBpcyB0byByZW1vdmUgdGhpcyBjb21tZW50Lgo+IAo+IEl0IHN1cHBvcnRzIElCIGFu
ZCBwcm9iYWJseSB2RFBBIGluIHRoZSBmdXR1cmUuCj4KaG1tLi4uIHNvcnJ5LCBJIGRpZG4ndCBm
aW5kIHRoZSByZWZlcnJlZCBkaXNjdXNzaW9uLiBvbmx5IGJlbG93IGRpc2N1c3Npb24KcmVnYXJk
aW5nIHRvIHdoeSB0byBhZGQgZGV2bGluay4KCmh0dHBzOi8vd3d3Lm1haWwtYXJjaGl2ZS5jb20v
bmV0ZGV2QHZnZXIua2VybmVsLm9yZy9tc2c5NTgwMS5odG1sCgk+VGhpcyBkb2Vzbid0IHNlZW0g
dG8gYmUgdG9vIG11Y2ggcmVsYXRlZCB0byBuZXR3b3JraW5nPyBXaHkgY2FuJ3Qgc29tZXRoaW5n
Cgk+bGlrZSB0aGlzIGJlIGluIHN5c2ZzPwoJCglJdCBpcyByZWxhdGVkIHRvIG5ldHdvcmtpbmcg
cXVpdGUgYml0LiBUaGVyZSBoYXMgYmVlbiBjb3VwbGUgb2YKCWl0ZXJhdGlvbiBvZiB0aGlzLCBp
bmNsdWRpbmcgc3lzZnMgYW5kIGNvbmZpZ2ZzIGltcGxlbWVudGF0aW9ucy4gVGhlcmUKCWhhcyBi
ZWVuIGEgY29uc2Vuc3VzIHJlYWNoZWQgdGhhdCB0aGlzIHNob3VsZCBiZSBkb25lIGJ5IG5ldGxp
bmsuIEkKCWJlbGlldmUgbmV0bGluayBpcyByZWFsbHkgdGhlIGJlc3QgZm9yIHRoaXMgcHVycG9z
ZS4gU3lzZnMgaXMgbm90IGEgZ29vZAoJaWRlYQoKaHR0cHM6Ly93d3cubWFpbC1hcmNoaXZlLmNv
bS9uZXRkZXZAdmdlci5rZXJuZWwub3JnL21zZzk2MTAyLmh0bWwKCT50aGVyZSBpcyBhbHJlYWR5
IGEgd2F5IHRvIGNoYW5nZSBldGgvaWIgdmlhCgk+ZWNobyAnZXRoJyA+IC9zeXMvYnVzL3BjaS9k
cml2ZXJzL21seDRfY29yZS8wMDAwOjAyOjAwLjAvbWx4NF9wb3J0MQoJPgoJPnNvdW5kcyBsaWtl
IHRoaXMgaXMgYW5vdGhlciB3YXkgdG8gYWNoaWV2ZSB0aGUgc2FtZT8KCQoJSXQgaXMuIEhvd2V2
ZXIgdGhlIGN1cnJlbnQgd2F5IGlzIGRyaXZlci1zcGVjaWZpYywgbm90IGNvcnJlY3QuCglGb3Ig
bWx4NSwgd2UgbmVlZCB0aGUgc2FtZSwgaXQgY2Fubm90IGJlIGRvbmUgaW4gdGhpcyB3YXkuIERv
IGRldmxpbmsgaXMKCXRoZSBjb3JyZWN0IHdheSB0byBnby4KCmh0dHBzOi8vbHduLm5ldC9BcnRp
Y2xlcy82NzQ4NjcvCglUaGVyZSBhIGlzIG5lZWQgZm9yIHNvbWUgdXNlcnNwYWNlIEFQSSB0aGF0
IHdvdWxkIGFsbG93IHRvIGV4cG9zZSB0aGluZ3MKCXRoYXQgYXJlIG5vdCBkaXJlY3RseSByZWxh
dGVkIHRvIGFueSBkZXZpY2UgY2xhc3MgbGlrZSBuZXRfZGV2aWNlIG9mCglpYl9kZXZpY2UsIGJ1
dCByYXRoZXIgY2hpcC13aWRlL3N3aXRjaC1BU0lDLXdpZGUgc3R1ZmYuCgoJVXNlIGNhc2VzOgoJ
MSkgZ2V0L3NldCBvZiBwb3J0IHR5cGUgKEV0aGVybmV0L0luZmluaUJhbmQpCgkyKSBtb25pdG9y
aW5nIG9mIGhhcmR3YXJlIG1lc3NhZ2VzIHRvIGFuZCBmcm9tIGNoaXAKCTMpIHNldHRpbmcgdXAg
cG9ydCBzcGxpdHRlcnMgLSBzcGxpdCBwb3J0IGludG8gbXVsdGlwbGUgb25lcyBhbmQgc3F1YXNo
IGFnYWluLAoJICAgZW5hYmxlcyB1c2FnZSBvZiBzcGxpdHRlciBjYWJsZQoJNCkgc2V0dGluZyB1
cCBzaGFyZWQgYnVmZmVycyAtIHNoYXJlZCBhbW9uZyBtdWx0aXBsZSBwb3J0cyB3aXRoaW4gb25l
IGNoaXAKCgoKd2UgYWN0dWFsbHkgY2FuIGFsc28gcmV0cmlldmUgdGhlIHNhbWUgaW5mb3JtYXRp
b24gdGhyb3VnaCBzeXNmcywgLmUuZwoKfC0gW3BhdGggdG8gZGV2aWNlXQogIHwtLS0gbWlncmF0
aW9uCiAgfCAgICAgfC0tLSBzZWxmCiAgfCAgICAgfCAgIHwtLS1kZXZpY2VfYXBpCiAgfAl8ICAg
fC0tLW1kZXZfdHlwZQogIHwJfCAgIHwtLS1zb2Z0d2FyZV92ZXJzaW9uCiAgfAl8ICAgfC0tLWRl
dmljZV9pZAogIHwJfCAgIHwtLS1hZ2dyZWdhdG9yCiAgfCAgICAgfC0tLSBjb21wYXRpYmxlCiAg
fCAgICAgfCAgIHwtLS1kZXZpY2VfYXBpCiAgfAl8ICAgfC0tLW1kZXZfdHlwZQogIHwJfCAgIHwt
LS1zb2Z0d2FyZV92ZXJzaW9uCiAgfAl8ICAgfC0tLWRldmljZV9pZAogIHwJfCAgIHwtLS1hZ2dy
ZWdhdG9yCgoKCj4gCj4gPiAgIEkgZmVlbCBsaWtlIGl0J3Mgbm90IHZlcnkgYXBwcm9wcmlhdGUg
Zm9yIGEgR1BVIGRyaXZlciB0byB1c2UKPiA+IHRoaXMgaW50ZXJmYWNlLiBJcyB0aGF0IHJpZ2h0
Pwo+IAo+IAo+IEkgdGhpbmsgbm90IHRob3VnaCBtb3N0IG9mIHRoZSB1c2VycyBhcmUgc3dpdGNo
IG9yIGV0aGVybmV0IGRldmljZXMuIEl0Cj4gZG9lc24ndCBwcmV2ZW50IHlvdSBmcm9tIGludmVu
dGluZyBuZXcgYWJzdHJhY3Rpb25zLgpzbyBuZWVkIHRvIHBhdGNoIGRldmxpbmsgY29yZSBhbmQg
dGhlIHVzZXJzcGFjZSBkZXZsaW5rIHRvb2w/CmUuZy4gZGV2bGluayBtaWdyYXRpb24KCj4gTm90
ZSB0aGF0IGRldmxpbmsgaXMgYmFzZWQgb24gbmV0bGluaywgbmV0bGluayBoYXMgYmVlbiB3aWRl
bHkgdXNlZCBieQo+IHZhcmlvdXMgc3Vic3lzdGVtcyBvdGhlciB0aGFuIG5ldHdvcmtpbmcuCgp0
aGUgYWR2YW50YWdlIG9mIG5ldGxpbmsgSSBzZWUgaXMgdGhhdCBpdCBjYW4gbW9uaXRvciBkZXZp
Y2Ugc3RhdHVzIGFuZApub3RpZnkgdXBwZXIgbGF5ZXIgdGhhdCBtaWdyYXRpb24gZGF0YWJhc2Ug
bmVlZHMgdG8gZ2V0IHVwZGF0ZWQuCkJ1dCBub3Qgc3VyZSB3aGV0aGVyIG9wZW5zdGFjayB3b3Vs
ZCBsaWtlIHRvIHVzZSB0aGlzIGNhcGFiaWxpdHkuCkFzIFNlYW4gc2FpZCwgaXQncyBoZWF2eSBm
b3Igb3BlbnN0YWNrLiBpdCdzIGhlYXZ5IGZvciB2ZW5kb3IgZHJpdmVyCmFzIHdlbGwgOikKCkFu
ZCBkZXZsaW5rIG1vbml0b3Igbm93IGxpc3RlbnMgdGhlIG5vdGlmaWNhdGlvbiBhbmQgZHVtcHMg
dGhlIHN0YXRlCmNoYW5nZXMuIElmIHdlIHdhbnQgdG8gdXNlIGl0LCBuZWVkIHRvIGxldCBpdCBm
b3J3YXJkIHRoZSBub3RpZmljYXRpb24KYW5kIGR1bXBlZCBpbmZvIHRvIG9wZW5zdGFjaywgcmln
aHQ/CgpUaGFua3MKWWFuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaW50ZWwtZ3Z0LWRldgo=
