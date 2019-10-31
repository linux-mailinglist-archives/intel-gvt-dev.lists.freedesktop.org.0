Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 728CCEAB2C
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 31 Oct 2019 08:57:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 209086EDA1;
	Thu, 31 Oct 2019 07:57:48 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27DA36EDA1;
 Thu, 31 Oct 2019 07:57:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Oct 2019 00:57:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,250,1569308400"; d="scan'208";a="206036015"
Received: from lingshan-mobl5.ccr.corp.intel.com (HELO [10.238.129.48])
 ([10.238.129.48])
 by FMSMGA003.fm.intel.com with ESMTP; 31 Oct 2019 00:57:39 -0700
Subject: Re: [PATCH V6 6/6] docs: sample driver to demonstrate how to
 implement virtio-mdev framework
To: Christoph Hellwig <hch@infradead.org>, Jason Wang <jasowang@redhat.com>
References: <20191030064444.21166-1-jasowang@redhat.com>
 <20191030064444.21166-7-jasowang@redhat.com>
 <20191030212312.GA4251@infradead.org>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Message-ID: <1592d723-a580-8614-3fb4-88560a06cdc1@intel.com>
Date: Thu, 31 Oct 2019 15:57:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191030212312.GA4251@infradead.org>
Content-Language: en-US
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
Cc: stefanha@redhat.com, christophe.de.dinechin@gmail.com, kvm@vger.kernel.org,
 mst@redhat.com, airlied@linux.ie, joonas.lahtinen@linux.intel.com,
 heiko.carstens@de.ibm.com, kevin.tian@intel.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 kwankhede@nvidia.com, rob.miller@broadcom.com, linux-s390@vger.kernel.org,
 sebott@linux.ibm.com, lulu@redhat.com, eperezma@redhat.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, haotian.wang@sifive.com,
 cunming.liang@intel.com, zhi.a.wang@intel.com, farman@linux.ibm.com,
 idos@mellanox.com, gor@linux.ibm.com, intel-gfx@lists.freedesktop.org,
 jani.nikula@linux.intel.com, alex.williamson@redhat.com, xiao.w.wang@intel.com,
 freude@linux.ibm.com, zhenyuw@linux.intel.com, parav@mellanox.com,
 zhihong.wang@intel.com, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
 oberpar@linux.ibm.com, tiwei.bie@intel.com, netdev@vger.kernel.org,
 cohuck@redhat.com, linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
 daniel@ffwll.ch
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Ck9uIDEwLzMxLzIwMTkgNToyMyBBTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gT24gV2Vk
LCBPY3QgMzAsIDIwMTkgYXQgMDI6NDQ6NDRQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4g
VGhpcyBzYW1wbGUgZHJpdmVyIGNyZWF0ZXMgbWRldiBkZXZpY2UgdGhhdCBzaW11bGF0ZSB2aXJ0
aW8gbmV0IGRldmljZQo+PiBvdmVyIHZpcnRpbyBtZGV2IHRyYW5zcG9ydC4gVGhlIGRldmljZSBp
cyBpbXBsZW1lbnRlZCB0aHJvdWdoIHZyaW5naAo+PiBhbmQgd29ya3F1ZXVlLiBBIGRldmljZSBz
cGVjaWZpYyBkbWEgb3BzIGlzIHRvIG1ha2Ugc3VyZSBIVkEgaXMgdXNlZAo+PiBkaXJlY3RseSBh
cyB0aGUgSU9WQS4gVGhpcyBzaG91bGQgYmUgc3VmZmljaWVudCBmb3Iga2VybmVsIHZpcnRpbwo+
PiBkcml2ZXIgdG8gd29yay4KPj4KPj4gT25seSAndmlydGlvJyB0eXBlIGlzIHN1cHBvcnRlZCBy
aWdodCBub3cuIEkgcGxhbiB0byBhZGQgJ3Zob3N0JyB0eXBlCj4+IG9uIHRvcCB3aGljaCByZXF1
aXJlcyBzb21lIHZpcnR1YWwgSU9NTVUgaW1wbGVtZW50ZWQgaW4gdGhpcyBzYW1wbGUKPj4gZHJp
dmVyLgo+IENhbiB3ZSBwbGVhc2Ugc3VibWl0IGEgcmVhbCBkcml2ZXIgZm9yIGl0PyAgQSBtb3Jl
IG9yIGxlc3MgdXNlbGVzcwo+IHNhbXBsZSBkcml2ZXIgZG9lc24ndCByZWFsbHkgcXVhbGlmeSBm
b3Igb3VyIG5vcm1hbCBrZXJuZWwgcmVxdWlyZW1lbnRzCj4gdGhhdCBpbmZyYXN0cnVjdHVyZSBz
aG91bGQgaGF2ZSBhIHJlYWwgdXNlci4KCkhlbGxvIENocmlzdG9waCwKCkkgYW0gd29ya2luZyBv
biBhIHJlYWwgaGFyZHdhcmUgZHJpdmVyIGZvciBpdCwgaXQncyBjYWxsZWQgSUZDLCBJIGhhdmUg
CnBvc3RlZCBSRkMgVjEgYW5kIHdpbGwgcG9zdCBSRkMgVjIgc29vbi4KClRoYW5rcywKQlIKWmh1
IExpbmdzaGFuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50
ZWwtZ3Z0LWRldg==
