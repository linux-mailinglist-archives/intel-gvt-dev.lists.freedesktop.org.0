Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3C724AD4C
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 20 Aug 2020 05:28:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ADBF6E892;
	Thu, 20 Aug 2020 03:28:37 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C3776E892
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 20 Aug 2020 03:28:35 +0000 (UTC)
IronPort-SDR: YBqQMe9SHv/LR9fGkQ2x79csdVpPHfGCTYuNWIE6eSbZLNYfXLo0qa632yJZnA9wU/lqb+CRtw
 pZ+OSQp4vgJQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9718"; a="219538812"
X-IronPort-AV: E=Sophos;i="5.76,332,1592895600"; d="scan'208";a="219538812"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2020 20:28:34 -0700
IronPort-SDR: 5Ny6jA7KhA8lJCsOir9TP57QNBIByN+QNcAZddSmKuJ1rbdS7J8N1MrhVKpYdsnjbRggx0kBQc
 89JhrB8/QU8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,332,1592895600"; d="scan'208";a="327281803"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.16])
 by orsmga008.jf.intel.com with ESMTP; 19 Aug 2020 20:28:28 -0700
Date: Thu, 20 Aug 2020 11:16:21 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: device compatibility interface for live migration with assigned
 devices
Message-ID: <20200820031621.GA24997@joy-OptiPlex-7040>
References: <20200810074631.GA29059@joy-OptiPlex-7040>
 <e6e75807-0614-bd75-aeb6-64d643e029d3@redhat.com>
 <20200814051601.GD15344@joy-OptiPlex-7040>
 <a51209fe-a8c6-941f-ff54-7be06d73bc44@redhat.com>
 <20200818085527.GB20215@redhat.com>
 <3a073222-dcfe-c02d-198b-29f6a507b2e1@redhat.com>
 <20200818091628.GC20215@redhat.com>
 <20200818113652.5d81a392.cohuck@redhat.com>
 <20200820003922.GE21172@joy-OptiPlex-7040>
 <20200819212234.223667b3@x1.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200819212234.223667b3@x1.home>
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
Cc: kvm@vger.kernel.org, libvir-list@redhat.com,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org, kwankhede@nvidia.com,
 eauger@redhat.com, xin-ran.wang@intel.com, corbet@lwn.net,
 openstack-discuss@lists.openstack.org, shaohe.feng@intel.com,
 kevin.tian@intel.com, Parav Pandit <parav@mellanox.com>,
 jian-feng.ding@intel.com, dgilbert@redhat.com, zhenyuw@linux.intel.com,
 hejie.xu@intel.com, bao.yumeng@zte.com.cn, Jiri Pirko <jiri@mellanox.com>,
 eskultet@redhat.com, smooney@redhat.com, intel-gvt-dev@lists.freedesktop.org,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, dinechin@redhat.com, devel@ovirt.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMTksIDIwMjAgYXQgMDk6MjI6MzRQTSAtMDYwMCwgQWxleCBXaWxsaWFtc29u
IHdyb3RlOgo+IE9uIFRodSwgMjAgQXVnIDIwMjAgMDg6Mzk6MjIgKzA4MDAKPiBZYW4gWmhhbyA8
eWFuLnkuemhhb0BpbnRlbC5jb20+IHdyb3RlOgo+IAo+ID4gT24gVHVlLCBBdWcgMTgsIDIwMjAg
YXQgMTE6MzY6NTJBTSArMDIwMCwgQ29ybmVsaWEgSHVjayB3cm90ZToKPiA+ID4gT24gVHVlLCAx
OCBBdWcgMjAyMCAxMDoxNjoyOCArMDEwMAo+ID4gPiBEYW5pZWwgUC4gQmVycmFuZ8OpIDxiZXJy
YW5nZUByZWRoYXQuY29tPiB3cm90ZToKPiA+ID4gICAKPiA+ID4gPiBPbiBUdWUsIEF1ZyAxOCwg
MjAyMCBhdCAwNTowMTo1MVBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOiAgCj4gPiA+ID4gPiAg
ICBPbiAyMDIwLzgvMTgg5LiL5Y2INDo1NSwgRGFuaWVsIFAuIEJlcnJhbmfDqSB3cm90ZToKPiA+
ID4gPiA+IAo+ID4gPiA+ID4gIE9uIFR1ZSwgQXVnIDE4LCAyMDIwIGF0IDExOjI0OjMwQU0gKzA4
MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4gPiA+ID4gPiAKPiA+ID4gPiA+ICBPbiAyMDIwLzgvMTQg
5LiL5Y2IMToxNiwgWWFuIFpoYW8gd3JvdGU6Cj4gPiA+ID4gPiAKPiA+ID4gPiA+ICBPbiBUaHUs
IEF1ZyAxMywgMjAyMCBhdCAxMjoyNDo1MFBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+ID4g
PiA+ID4gCj4gPiA+ID4gPiAgT24gMjAyMC84LzEwIOS4i+WNiDM6NDYsIFlhbiBaaGFvIHdyb3Rl
OiAgICAKPiA+ID4gPiAgIAo+ID4gPiA+ID4gIHdlIGFjdHVhbGx5IGNhbiBhbHNvIHJldHJpZXZl
IHRoZSBzYW1lIGluZm9ybWF0aW9uIHRocm91Z2ggc3lzZnMsIC5lLmcKPiA+ID4gPiA+IAo+ID4g
PiA+ID4gIHwtIFtwYXRoIHRvIGRldmljZV0KPiA+ID4gPiA+ICAgICB8LS0tIG1pZ3JhdGlvbgo+
ID4gPiA+ID4gICAgIHwgICAgIHwtLS0gc2VsZgo+ID4gPiA+ID4gICAgIHwgICAgIHwgICB8LS0t
ZGV2aWNlX2FwaQo+ID4gPiA+ID4gICAgIHwgICAgfCAgIHwtLS1tZGV2X3R5cGUKPiA+ID4gPiA+
ICAgICB8ICAgIHwgICB8LS0tc29mdHdhcmVfdmVyc2lvbgo+ID4gPiA+ID4gICAgIHwgICAgfCAg
IHwtLS1kZXZpY2VfaWQKPiA+ID4gPiA+ICAgICB8ICAgIHwgICB8LS0tYWdncmVnYXRvcgo+ID4g
PiA+ID4gICAgIHwgICAgIHwtLS0gY29tcGF0aWJsZQo+ID4gPiA+ID4gICAgIHwgICAgIHwgICB8
LS0tZGV2aWNlX2FwaQo+ID4gPiA+ID4gICAgIHwgICAgfCAgIHwtLS1tZGV2X3R5cGUKPiA+ID4g
PiA+ICAgICB8ICAgIHwgICB8LS0tc29mdHdhcmVfdmVyc2lvbgo+ID4gPiA+ID4gICAgIHwgICAg
fCAgIHwtLS1kZXZpY2VfaWQKPiA+ID4gPiA+ICAgICB8ICAgIHwgICB8LS0tYWdncmVnYXRvcgo+
ID4gPiA+ID4gCj4gPiA+ID4gPiAKPiA+ID4gPiA+ICBZZXMgYnV0Ogo+ID4gPiA+ID4gCj4gPiA+
ID4gPiAgLSBZb3UgbmVlZCBvbmUgZmlsZSBwZXIgYXR0cmlidXRlIChvbmUgc3lzY2FsbCBmb3Ig
b25lIGF0dHJpYnV0ZSkKPiA+ID4gPiA+ICAtIEF0dHJpYnV0ZSBpcyBjb3VwbGVkIHdpdGgga29i
amVjdCAgCj4gPiA+IAo+ID4gPiBJcyB0aGF0IHJlYWxseSB0aGF0IGJhZD8gWW91IGhhdmUgdGhl
IGRldmljZSB3aXRoIGFuIGVtYmVkZGVkIGtvYmplY3QKPiA+ID4gYW55d2F5LCBhbmQgeW91IGNh
biBqdXN0IHB1dCB0aGluZ3MgaW50byBhbiBhdHRyaWJ1dGUgZ3JvdXA/Cj4gPiA+IAo+ID4gPiBb
QWxzbywgSSB0aGluayB0aGF0IHNlbGYvY29tcGF0aWJsZSBzcGxpdCBpbiB0aGUgZXhhbXBsZSBt
YWtlcyB0aGluZ3MKPiA+ID4gbmVlZGxlc3NseSBjb21wbGV4LiBTaG91bGRuJ3Qgc2VtYW50aWMg
dmVyc2lvbmluZyBhbmQgbWF0Y2hpbmcgYWxyZWFkeQo+ID4gPiBjb3ZlciBuZWFybHkgZXZlcnl0
aGluZz8gSSB3b3VsZCBleHBlY3QgdmVyeSBmZXcgY2FzZXMgdGhhdCBhcmUgbW9yZQo+ID4gPiBj
b21wbGV4IHRoYW4gdGhhdC4gTWF5YmUgdGhlIGFnZ3JlZ2F0aW9uIHN0dWZmLCBidXQgSSBkb24n
dCB0aGluayB3ZQo+ID4gPiBuZWVkIHRoYXQgc2VsZi9jb21wYXRpYmxlIHNwbGl0IGZvciB0aGF0
LCBlaXRoZXIuXSAgCj4gPiBIaSBDb3JuZWxpYSwKPiA+IAo+ID4gVGhlIHJlYXNvbiBJIHdhbnQg
dG8gZGVjbGFyZSBjb21wYXRpYmxlIGxpc3Qgb2YgYXR0cmlidXRlcyBpcyB0aGF0Cj4gPiBzb21l
dGltZXMgaXQncyBub3QgYSBzaW1wbGUgMToxIG1hdGNoaW5nIG9mIHNvdXJjZSBhdHRyaWJ1dGVz
IGFuZCB0YXJnZXQgYXR0cmlidXRlcwo+ID4gYXMgSSBkZW1vbnN0cmF0ZWQgYmVsb3csCj4gPiBz
b3VyY2UgbWRldiBvZiAobWRldl90eXBlIGk5MTUtR1ZUZ19WNV8yICsgYWdncmVnYXRvciAxKSBp
cyBjb21wYXRpYmxlIHRvCj4gPiB0YXJnZXQgbWRldiBvZiAobWRldl90eXBlIGk5MTUtR1ZUZ19W
NV80ICsgYWdncmVnYXRvciAyKSwKPiA+ICAgICAgICAgICAgICAgIChtZGV2X3R5cGUgaTkxNS1H
VlRnX1Y1XzggKyBhZ2dyZWdhdG9yIDQpCj4gPiAKPiA+IGFuZCBhZ2dyYWdhdG9yIG1heSBiZSBq
dXN0IG9uZSBvZiBzdWNoIGV4YW1wbGVzIHRoYXQgMToxIG1hdGNoaW5nIGRvZXMgbm90Cj4gPiBm
aXQuCj4gCj4gSWYgeW91J3JlIHN1Z2dlc3RpbmcgdGhhdCB3ZSBuZWVkIGEgbmV3ICdjb21wYXRp
YmxlJyBzZXQgZm9yIGV2ZXJ5Cj4gYWdncmVnYXRpb24sIGhhdmVuJ3Qgd2UgbG9zdCB0aGUgcHVy
cG9zZSBvZiBhZ2dyZWdhdGlvbj8gIEZvciBleGFtcGxlLAo+IHJhdGhlciB0aGFuIGhhdmluZyBO
IG1kZXYgdHlwZXMgdG8gcmVwcmVzZW50IGFsbCB0aGUgcG9zc2libGUKPiBhZ2dyZWdhdGlvbiB2
YWx1ZXMsIHdlIGhhdmUgYSBzaW5nbGUgbWRldiB0eXBlIHdpdGggTiBjb21wYXRpYmxlCj4gbWln
cmF0aW9uIGVudHJpZXMsIG9uZSBmb3IgZWFjaCBwb3NzaWJsZSBhZ2dyZWdhdGlvbiB2YWx1ZS4g
IEJUVywgaG93IGRvCj4gd2UgaGF2ZSBtdWx0aXBsZSBjb21wYXRpYmxlIGRpcmVjdG9yaWVzPyAg
Y29tcGF0aWJsZTAwMDEsCj4gY29tcGF0aWJsZTAwMDI/IFRoYW5rcywKPiAKZG8geW91IHRoaW5r
IHRoZSBiaW5fYXR0cmlidXRlIEkgcHJvcG9zZWQgeWVzdGVyZGF5IGdvb2Q/ClRoZW4gd2UgY2Fu
IGhhdmUgYSBzaW5nbGUgY29tcGF0aWJsZSB3aXRoIGEgdmFyaWFibGUgaW4gdGhlIG1kZXZfdHlw
ZSBhbmQKYWdncmVnYXRvci4KCiAgIG1kZXZfdHlwZT1pOTE1LUdWVGdfVjVfe3ZhbDE6aW50OjIs
NCw4fQogICBhZ2dyZWdhdG9yPXt2YWwxfS8yCgpUaGFua3MKWWFuCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0
CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldgo=
