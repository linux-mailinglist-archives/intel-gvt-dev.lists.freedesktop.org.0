Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4501E23C374
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  5 Aug 2020 04:28:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5CBC6E04A;
	Wed,  5 Aug 2020 02:28:03 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 547056E04A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  5 Aug 2020 02:28:00 +0000 (UTC)
IronPort-SDR: t3DyFyuz/GKoyQSjH6zJcgkaEHDeoRtk+EMT8FraSH+6kwVM7B6V9C5yE4fHJP4RwbmOP1lZUN
 kYwbI1dvNyJA==
X-IronPort-AV: E=McAfee;i="6000,8403,9703"; a="151674546"
X-IronPort-AV: E=Sophos;i="5.75,436,1589266800"; d="scan'208";a="151674546"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2020 19:28:00 -0700
IronPort-SDR: LX4R3k0iffTaiqM5OpI1cWhwKqIC5VWRP8Vx+UJnFeioBfw+oO5qHl5ETPIih7AENO50oqq4AG
 OmEpqTHMj+Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,436,1589266800"; d="scan'208";a="315578039"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.16])
 by fmsmga004.fm.intel.com with ESMTP; 04 Aug 2020 19:27:55 -0700
Date: Wed, 5 Aug 2020 10:16:54 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: device compatibility interface for live migration with assigned
 devices
Message-ID: <20200805021654.GB30485@joy-OptiPlex-7040>
References: <20200713232957.GD5955@joy-OptiPlex-7040>
 <9bfa8700-91f5-ebb4-3977-6321f0487a63@redhat.com>
 <20200716083230.GA25316@joy-OptiPlex-7040>
 <20200717101258.65555978@x1.home>
 <20200721005113.GA10502@joy-OptiPlex-7040>
 <20200727072440.GA28676@joy-OptiPlex-7040>
 <20200727162321.7097070e@x1.home>
 <20200729080503.GB28676@joy-OptiPlex-7040>
 <20200804183503.39f56516.cohuck@redhat.com>
 <c178a0d3-269d-1620-22b1-9010f602d8ff@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c178a0d3-269d-1620-22b1-9010f602d8ff@redhat.com>
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
Cc: Cornelia Huck <cohuck@redhat.com>, kvm@vger.kernel.org,
 libvir-list@redhat.com, qemu-devel@nongnu.org, kwankhede@nvidia.com,
 eauger@redhat.com, xin-ran.wang@intel.com, eskultet@redhat.com,
 openstack-discuss@lists.openstack.org, shaohe.feng@intel.com,
 kevin.tian@intel.com, jian-feng.ding@intel.com, dgilbert@redhat.com,
 zhenyuw@linux.intel.com, hejie.xu@intel.com, bao.yumeng@zte.com.cn,
 Alex Williamson <alex.williamson@redhat.com>, smooney@redhat.com,
 intel-gvt-dev@lists.freedesktop.org, berrange@redhat.com, corbet@lwn.net,
 dinechin@redhat.com, devel@ovirt.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMDUsIDIwMjAgYXQgMTA6MjI6MTVBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzgvNSDkuIrljYgxMjozNSwgQ29ybmVsaWEgSHVjayB3cm90ZToKPiA+
IFtzb3JyeSBhYm91dCBub3QgY2hpbWluZyBpbiBlYXJsaWVyXQo+ID4gCj4gPiBPbiBXZWQsIDI5
IEp1bCAyMDIwIDE2OjA1OjAzICswODAwCj4gPiBZYW4gWmhhbyA8eWFuLnkuemhhb0BpbnRlbC5j
b20+IHdyb3RlOgo+ID4gCj4gPiA+IE9uIE1vbiwgSnVsIDI3LCAyMDIwIGF0IDA0OjIzOjIxUE0g
LTA2MDAsIEFsZXggV2lsbGlhbXNvbiB3cm90ZToKPiA+ICguLi4pCj4gPiAKPiA+ID4gPiBCYXNl
ZCBvbiB0aGUgZmVlZGJhY2sgd2UndmUgcmVjZWl2ZWQsIHRoZSBwcmV2aW91c2x5IHByb3Bvc2Vk
IGludGVyZmFjZQo+ID4gPiA+IGlzIG5vdCB2aWFibGUuICBJIHRoaW5rIHRoZXJlJ3MgYWdyZWVt
ZW50IHRoYXQgdGhlIHVzZXIgbmVlZHMgdG8gYmUKPiA+ID4gPiBhYmxlIHRvIHBhcnNlIGFuZCBp
bnRlcnByZXQgdGhlIHZlcnNpb24gaW5mb3JtYXRpb24uICBVc2luZyBqc29uIHNlZW1zCj4gPiA+
ID4gdmlhYmxlLCBidXQgSSBkb24ndCBrbm93IGlmIGl0J3MgdGhlIGJlc3Qgb3B0aW9uLiAgSXMg
dGhlcmUgYW55Cj4gPiA+ID4gcHJlY2VkZW50IG9mIG1hcmt1cCBzdHJpbmdzIHJldHVybmVkIHZp
YSBzeXNmcyB3ZSBjb3VsZCBmb2xsb3c/Cj4gPiBJIGRvbid0IHRoaW5rIGVuY29kaW5nIGNvbXBs
ZXggaW5mb3JtYXRpb24gaW4gYSBzeXNmcyBmaWxlIGlzIGEgdmlhYmxlCj4gPiBhcHByb2FjaC4g
UXVvdGluZyBEb2N1bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL3N5c2ZzLnJzdDoKPiA+IAo+ID4gIkF0
dHJpYnV0ZXMgc2hvdWxkIGJlIEFTQ0lJIHRleHQgZmlsZXMsIHByZWZlcmFibHkgd2l0aCBvbmx5
IG9uZSB2YWx1ZQo+ID4gcGVyIGZpbGUuIEl0IGlzIG5vdGVkIHRoYXQgaXQgbWF5IG5vdCBiZSBl
ZmZpY2llbnQgdG8gY29udGFpbiBvbmx5IG9uZQo+ID4gdmFsdWUgcGVyIGZpbGUsIHNvIGl0IGlz
IHNvY2lhbGx5IGFjY2VwdGFibGUgdG8gZXhwcmVzcyBhbiBhcnJheSBvZgo+ID4gdmFsdWVzIG9m
IHRoZSBzYW1lIHR5cGUuCj4gPiBNaXhpbmcgdHlwZXMsIGV4cHJlc3NpbmcgbXVsdGlwbGUgbGlu
ZXMgb2YgZGF0YSwgYW5kIGRvaW5nIGZhbmN5Cj4gPiBmb3JtYXR0aW5nIG9mIGRhdGEgaXMgaGVh
dmlseSBmcm93bmVkIHVwb24uIgo+ID4gCj4gPiBFdmVuIHRob3VnaCB0aGlzIGlzIGFuIG9sZGVy
IGZpbGUsIEkgdGhpbmsgdGhlc2UgcmVzdHJpY3Rpb25zIHN0aWxsCj4gPiBhcHBseS4KPiAKPiAK
PiArMSwgdGhhdCdzIGFub3RoZXIgcmVhc29uIHdoeSBkZXZsaW5rKG5ldGxpbmspIGlzIGJldHRl
ci4KPgpoaSBKYXNvbiwKZG8geW91IGhhdmUgYW55IG1hdGVyaWFscyBvciBzYW1wbGUgY29kZSBh
Ym91dCBkZXZsaW5rLCBzbyB3ZSBjYW4gaGF2ZSBhIGdvb2QKc3R1ZHkgb2YgaXQ/CkkgZm91bmQg
c29tZSBrZXJuZWwgZG9jcyBhYm91dCBpdCBidXQgbXkgcHJlbGltaW5hcnkgc3R1ZHkgZGlkbid0
IHNob3cgbWUgdGhlCmFkdmFudGFnZSBvZiBkZXZsaW5rLgoKVGhhbmtzCllhbgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxp
bmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXYK
