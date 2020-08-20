Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6319824AC72
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 20 Aug 2020 02:57:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23ADF6E88C;
	Thu, 20 Aug 2020 00:57:07 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 961D96E88C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 20 Aug 2020 00:57:05 +0000 (UTC)
IronPort-SDR: hC+GVq6T3AN/WpwLfhrDQSjQ+btCqxjL0NtRfUhxS1DMXrQrRQHgku4/XzDkhvg0CkFo9fxvdt
 +I8ixVX6A41g==
X-IronPort-AV: E=McAfee;i="6000,8403,9718"; a="142853593"
X-IronPort-AV: E=Sophos;i="5.76,332,1592895600"; d="scan'208";a="142853593"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2020 17:57:04 -0700
IronPort-SDR: FvYK9gEzFQHZsT5r+uRAmOjxUMJnuaUpbcsmlGeliUoFmKzSAcgvOFfABb/FqzGLMadx3/FqkH
 yIiig07Cl5CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,332,1592895600"; d="scan'208";a="327254455"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.16])
 by orsmga008.jf.intel.com with ESMTP; 19 Aug 2020 17:56:59 -0700
Date: Thu, 20 Aug 2020 08:39:22 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: device compatibility interface for live migration with assigned
 devices
Message-ID: <20200820003922.GE21172@joy-OptiPlex-7040>
References: <20200805093338.GC30485@joy-OptiPlex-7040>
 <20200805105319.GF2177@nanopsycho>
 <20200810074631.GA29059@joy-OptiPlex-7040>
 <e6e75807-0614-bd75-aeb6-64d643e029d3@redhat.com>
 <20200814051601.GD15344@joy-OptiPlex-7040>
 <a51209fe-a8c6-941f-ff54-7be06d73bc44@redhat.com>
 <20200818085527.GB20215@redhat.com>
 <3a073222-dcfe-c02d-198b-29f6a507b2e1@redhat.com>
 <20200818091628.GC20215@redhat.com>
 <20200818113652.5d81a392.cohuck@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200818113652.5d81a392.cohuck@redhat.com>
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
 hejie.xu@intel.com, bao.yumeng@zte.com.cn,
 Alex Williamson <alex.williamson@redhat.com>, smooney@redhat.com,
 intel-gvt-dev@lists.freedesktop.org,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 eskultet@redhat.com, Jiri Pirko <jiri@mellanox.com>, dinechin@redhat.com,
 devel@ovirt.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMTgsIDIwMjAgYXQgMTE6MzY6NTJBTSArMDIwMCwgQ29ybmVsaWEgSHVjayB3
cm90ZToKPiBPbiBUdWUsIDE4IEF1ZyAyMDIwIDEwOjE2OjI4ICswMTAwCj4gRGFuaWVsIFAuIEJl
cnJhbmfDqSA8YmVycmFuZ2VAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gCj4gPiBPbiBUdWUsIEF1ZyAx
OCwgMjAyMCBhdCAwNTowMTo1MVBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+ID4gPiAgICBP
biAyMDIwLzgvMTgg5LiL5Y2INDo1NSwgRGFuaWVsIFAuIEJlcnJhbmfDqSB3cm90ZToKPiA+ID4g
Cj4gPiA+ICBPbiBUdWUsIEF1ZyAxOCwgMjAyMCBhdCAxMToyNDozMEFNICswODAwLCBKYXNvbiBX
YW5nIHdyb3RlOgo+ID4gPiAKPiA+ID4gIE9uIDIwMjAvOC8xNCDkuIvljYgxOjE2LCBZYW4gWmhh
byB3cm90ZToKPiA+ID4gCj4gPiA+ICBPbiBUaHUsIEF1ZyAxMywgMjAyMCBhdCAxMjoyNDo1MFBN
ICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+ID4gPiAKPiA+ID4gIE9uIDIwMjAvOC8xMCDkuIvl
jYgzOjQ2LCBZYW4gWmhhbyB3cm90ZTogIAo+ID4gCj4gPiA+ICB3ZSBhY3R1YWxseSBjYW4gYWxz
byByZXRyaWV2ZSB0aGUgc2FtZSBpbmZvcm1hdGlvbiB0aHJvdWdoIHN5c2ZzLCAuZS5nCj4gPiA+
IAo+ID4gPiAgfC0gW3BhdGggdG8gZGV2aWNlXQo+ID4gPiAgICAgfC0tLSBtaWdyYXRpb24KPiA+
ID4gICAgIHwgICAgIHwtLS0gc2VsZgo+ID4gPiAgICAgfCAgICAgfCAgIHwtLS1kZXZpY2VfYXBp
Cj4gPiA+ICAgICB8ICAgIHwgICB8LS0tbWRldl90eXBlCj4gPiA+ICAgICB8ICAgIHwgICB8LS0t
c29mdHdhcmVfdmVyc2lvbgo+ID4gPiAgICAgfCAgICB8ICAgfC0tLWRldmljZV9pZAo+ID4gPiAg
ICAgfCAgICB8ICAgfC0tLWFnZ3JlZ2F0b3IKPiA+ID4gICAgIHwgICAgIHwtLS0gY29tcGF0aWJs
ZQo+ID4gPiAgICAgfCAgICAgfCAgIHwtLS1kZXZpY2VfYXBpCj4gPiA+ICAgICB8ICAgIHwgICB8
LS0tbWRldl90eXBlCj4gPiA+ICAgICB8ICAgIHwgICB8LS0tc29mdHdhcmVfdmVyc2lvbgo+ID4g
PiAgICAgfCAgICB8ICAgfC0tLWRldmljZV9pZAo+ID4gPiAgICAgfCAgICB8ICAgfC0tLWFnZ3Jl
Z2F0b3IKPiA+ID4gCj4gPiA+IAo+ID4gPiAgWWVzIGJ1dDoKPiA+ID4gCj4gPiA+ICAtIFlvdSBu
ZWVkIG9uZSBmaWxlIHBlciBhdHRyaWJ1dGUgKG9uZSBzeXNjYWxsIGZvciBvbmUgYXR0cmlidXRl
KQo+ID4gPiAgLSBBdHRyaWJ1dGUgaXMgY291cGxlZCB3aXRoIGtvYmplY3QKPiAKPiBJcyB0aGF0
IHJlYWxseSB0aGF0IGJhZD8gWW91IGhhdmUgdGhlIGRldmljZSB3aXRoIGFuIGVtYmVkZGVkIGtv
YmplY3QKPiBhbnl3YXksIGFuZCB5b3UgY2FuIGp1c3QgcHV0IHRoaW5ncyBpbnRvIGFuIGF0dHJp
YnV0ZSBncm91cD8KPiAKPiBbQWxzbywgSSB0aGluayB0aGF0IHNlbGYvY29tcGF0aWJsZSBzcGxp
dCBpbiB0aGUgZXhhbXBsZSBtYWtlcyB0aGluZ3MKPiBuZWVkbGVzc2x5IGNvbXBsZXguIFNob3Vs
ZG4ndCBzZW1hbnRpYyB2ZXJzaW9uaW5nIGFuZCBtYXRjaGluZyBhbHJlYWR5Cj4gY292ZXIgbmVh
cmx5IGV2ZXJ5dGhpbmc/IEkgd291bGQgZXhwZWN0IHZlcnkgZmV3IGNhc2VzIHRoYXQgYXJlIG1v
cmUKPiBjb21wbGV4IHRoYW4gdGhhdC4gTWF5YmUgdGhlIGFnZ3JlZ2F0aW9uIHN0dWZmLCBidXQg
SSBkb24ndCB0aGluayB3ZQo+IG5lZWQgdGhhdCBzZWxmL2NvbXBhdGlibGUgc3BsaXQgZm9yIHRo
YXQsIGVpdGhlci5dCkhpIENvcm5lbGlhLAoKVGhlIHJlYXNvbiBJIHdhbnQgdG8gZGVjbGFyZSBj
b21wYXRpYmxlIGxpc3Qgb2YgYXR0cmlidXRlcyBpcyB0aGF0CnNvbWV0aW1lcyBpdCdzIG5vdCBh
IHNpbXBsZSAxOjEgbWF0Y2hpbmcgb2Ygc291cmNlIGF0dHJpYnV0ZXMgYW5kIHRhcmdldCBhdHRy
aWJ1dGVzCmFzIEkgZGVtb25zdHJhdGVkIGJlbG93LApzb3VyY2UgbWRldiBvZiAobWRldl90eXBl
IGk5MTUtR1ZUZ19WNV8yICsgYWdncmVnYXRvciAxKSBpcyBjb21wYXRpYmxlIHRvCnRhcmdldCBt
ZGV2IG9mIChtZGV2X3R5cGUgaTkxNS1HVlRnX1Y1XzQgKyBhZ2dyZWdhdG9yIDIpLAogICAgICAg
ICAgICAgICAobWRldl90eXBlIGk5MTUtR1ZUZ19WNV84ICsgYWdncmVnYXRvciA0KQoKYW5kIGFn
Z3JhZ2F0b3IgbWF5IGJlIGp1c3Qgb25lIG9mIHN1Y2ggZXhhbXBsZXMgdGhhdCAxOjEgbWF0Y2hp
bmcgZG9lcyBub3QKZml0LgoKU28sIHdlIGV4cGxpY2l0bHkgbGlzdCBvdXQgc2VsZi9jb21wYXRp
YmxlIGF0dHJpYnV0ZXMsIGFuZCBtYW5hZ2VtZW50CnRvb2xzIG9ubHkgbmVlZCB0byBjaGVjayBp
ZiBzZWxmIGF0dHJpYnV0ZXMgaXMgY29udGFpbmVkIGNvbXBhdGlibGUKYXR0cmlidXRlcy4KCm9y
IGRvIHlvdSBtZWFuIG9ubHkgY29tcGF0aWJsZSBsaXN0IGlzIGVub3VnaCwgYW5kIHRoZSBtYW5h
Z2VtZW50IHRvb2xzCm5lZWQgdG8gZmluZCBvdXQgc2VsZiBsaXN0IGJ5IHRoZW1zZWx2ZXM/CkJ1
dCBJIHRoaW5rIHByb3ZpZGUgYSBzZWxmIGxpc3QgaXMgZWFzaWVyIGZvciBtYW5hZ2VtZW50IHRv
b2xzLgoKVGhhbmtzCllhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2ludGVsLWd2dC1kZXYK
