Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7B62477C
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 21 May 2019 07:16:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FE9189227;
	Tue, 21 May 2019 05:16:21 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC81089227
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 21 May 2019 05:16:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 May 2019 22:16:19 -0700
X-ExtLoop1: 1
Received: from coxu-arch-shz.sh.intel.com (HELO [10.239.160.22])
 ([10.239.160.22])
 by fmsmga006.fm.intel.com with ESMTP; 20 May 2019 22:16:18 -0700
Subject: Re: [PATCH v4 2/2] drm/i915/gvt: Assign NULL to the pointer after
 memory free.
To: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>,
 intel-gvt-dev@lists.freedesktop.org
References: <20190502095922.31917-1-aleksei.gimbitskii@intel.com>
 <20190502095922.31917-3-aleksei.gimbitskii@intel.com>
From: Colin Xu <Colin.Xu@intel.com>
Message-ID: <6f4caad9-2d0a-0353-f2a9-59c4ef69c7d8@intel.com>
Date: Tue, 21 May 2019 13:16:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190502095922.31917-3-aleksei.gimbitskii@intel.com>
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
Reply-To: Colin.Xu@intel.com
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

QWNrZWQtYnk6IENvbGluIFh1PGNvbGluLnh1QGludGVsLmNvbT4KCkknbSBPSyB3aXRoIHRoZSBj
aGFuZ2UuIFpoZW55dSBoYXMgc29tZSBjb21tZW50cyBpbiB2MyBzZWUgaWYgaGUgaGFzCm1vcmUg
Y29tbWVudHMgaW4gdjQuIFRoYW5rcy4KCk9uIDIwMTktMDUtMDIgMTc6NTksIEFsZWtzZWkgR2lt
Yml0c2tpaSB3cm90ZToKPiBUaGUga2xvY3dvcmsgc3RhdGljIGNvZGUgYW5hbHl6ZXIgY29tcGxh
aW5zIGFib3V0IHVzaW5nIHBvaW50ZXIgYWZ0ZXIKPiBiZWluZyBmcmVlZCwgYmVjYXVzZSBmdXJ0
aGVyIHdlIHBhc3MgaXQgdG8gdGhlIGd2dF92Z3B1X2VycigpIGZ1bmN0aW9uLgo+IEFzc2lnbiBw
b2ludGVyIHRvIGJlIE5VTEwgaW50ZW50aW9uYWx5LCB0byBtZWV0IHJlcXVpcmVtZW50cyBvZiB0
aGUgY29kZQo+IGFuYWx5emVyLgo+Cj4gVGhpcyBwYXRjaCBmaXhlZCB0aGUgaXNzdWUgIzY0OCBy
ZXBvcnRlZCBhcyBlcnJvciBieSBrbG9jd29yay4KPgo+IFNpZ25lZC1vZmYtYnk6IEFsZWtzZWkg
R2ltYml0c2tpaSA8YWxla3NlaS5naW1iaXRza2lpQGludGVsLmNvbT4KPiBDYzogWmhlbnl1IFdh
bmcgPHpoZW55dXdAbGludXguaW50ZWwuY29tPgo+IENjOiBaaGkgV2FuZyA8emhpLmEud2FuZ0Bp
bnRlbC5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMgfCAxICsK
PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQu
Ywo+IGluZGV4IDdlNjEzOTZhNjVjNi4uMmM3MjM1MDlhYjY4IDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2
dC9ndHQuYwo+IEBAIC0xMTA5LDYgKzExMDksNyBAQCBzdGF0aWMgc3RydWN0IGludGVsX3ZncHVf
cHBndHRfc3B0ICpwcGd0dF9wb3B1bGF0ZV9zcHRfYnlfZ3Vlc3RfZW50cnkoCj4gICAKPiAgIGVy
cl9mcmVlX3NwdDoKPiAgIAlwcGd0dF9mcmVlX3NwdChzcHQpOwo+ICsJc3B0ID0gTlVMTDsKPiAg
IGVycjoKPiAgIAlndnRfdmdwdV9lcnIoImZhaWw6IHNoYWRvdyBwYWdlICVwIGd1ZXN0IGVudHJ5
IDB4JWxseCB0eXBlICVkXG4iLAo+ICAgCQkgICAgIHNwdCwgd2UtPnZhbDY0LCB3ZS0+dHlwZSk7
CgotLSAKQmVzdCBSZWdhcmRzLApDb2xpbiBYdQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
