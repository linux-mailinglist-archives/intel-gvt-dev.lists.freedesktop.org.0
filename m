Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0F31011B0
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 19 Nov 2019 04:13:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 051036E159;
	Tue, 19 Nov 2019 03:13:13 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C47A86E112;
 Tue, 19 Nov 2019 03:13:11 +0000 (UTC)
Received: from [2601:1c0:6280:3f0::5a22]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWtwt-0000dD-JO; Tue, 19 Nov 2019 03:13:03 +0000
Subject: Re: [PATCH V13 4/6] mdev: introduce mediated virtio bus
To: Jason Wang <jasowang@redhat.com>, kvm@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, kwankhede@nvidia.com,
 alex.williamson@redhat.com, mst@redhat.com, tiwei.bie@intel.com,
 gregkh@linuxfoundation.org, jgg@mellanox.com
References: <20191118105923.7991-1-jasowang@redhat.com>
 <20191118105923.7991-5-jasowang@redhat.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <6c5f6e9e-0a4a-f514-2c26-08476b9a09f8@infradead.org>
Date: Mon, 18 Nov 2019 19:13:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191118105923.7991-5-jasowang@redhat.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w1ly8URM0uOTflt/kZy0TJgrnspB9XQu8w6aCtnLvW8=; b=KtVyMulpSnDq9tntYDC+RCTtm
 3c6gDhbbLXKTBKKG74KEtprK1lDyXcTafqs2dcpktR3n0+xokaPZNR9T5WyQjEbwEdEds3DhdXZ4d
 0Ro+8OLmVNDYLs9rZ1FpweXI1r26UTL/od3f2b/k1dap9wL/AKYGlAU9fmVHeSYf8OgCg6OS9baB+
 Us/Iy6vf8X/rVjc52xbJxiW7osJxNcjlB9jznCRfyQadI2nKpiDMU1fQWMwvqMOxKn5n6uOTzoE0i
 neVNEEJz7xBHo/L5sPOuSyVX1gF3xDEMd74hnHPXbJjX5qIccAbE088ZoeCm3qSzLSOhtcykJek+c
 YsXsmBv6A==;
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
Cc: jakub.kicinski@netronome.com, christophe.de.dinechin@gmail.com,
 sebott@linux.ibm.com, airlied@linux.ie, joonas.lahtinen@linux.intel.com,
 heiko.carstens@de.ibm.com, kevin.tian@intel.com, rob.miller@broadcom.com,
 hch@infradead.org, lulu@redhat.com, eperezma@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, haotian.wang@sifive.com, jeffrey.t.kirsher@intel.com,
 zhi.a.wang@intel.com, farman@linux.ibm.com, parav@mellanox.com,
 gor@linux.ibm.com, cunming.liang@intel.com, zhenyuw@linux.intel.com,
 rodrigo.vivi@intel.com, xiao.w.wang@intel.com, freude@linux.ibm.com,
 jani.nikula@linux.intel.com, stefanha@redhat.com, zhihong.wang@intel.com,
 akrowiak@linux.ibm.com, jiri@mellanox.com, netdev@vger.kernel.org,
 cohuck@redhat.com, oberpar@linux.ibm.com, maxime.coquelin@redhat.com,
 daniel@ffwll.ch, aadam@redhat.com, lingshan.zhu@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

SGksCgpPbiAxMS8xOC8xOSAyOjU5IEFNLCBKYXNvbiBXYW5nIHdyb3RlOgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL21kZXYvS2NvbmZpZyBiL2RyaXZlcnMvbWRldi9LY29uZmlnCj4gaW5kZXggNDU2
MWYyZDQxNzhmLi5jZDg0ZDQ2NzA1NTIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tZGV2L0tjb25m
aWcKPiArKysgYi9kcml2ZXJzL21kZXYvS2NvbmZpZwo+IEBAIC0xNywzICsxNywxMyBAQCBjb25m
aWcgVkZJT19NREVWCj4gIAkgIG1vcmUgZGV0YWlscy4KPiAgCj4gIAkgIElmIHlvdSBkb24ndCBr
bm93IHdoYXQgZG8gaGVyZSwgc2F5IE4uCj4gKwo+ICtjb25maWcgTURFVl9WSVJUSU8KPiArICAg
ICAgIHRyaXN0YXRlICJNZWRpYXRlZCBWSVJUSU8gYnVzIgo+ICsgICAgICAgZGVwZW5kcyBvbiBW
SVJUSU8gJiYgTURFVgo+ICsgICAgICAgZGVmYXVsdCBuCj4gKyAgICAgICBoZWxwCj4gKwkgIFBy
b2l2ZGVzIGEgbWVkaWF0ZWQgQlVTIGZvciB2aXJ0aW8uIEl0IGNvdWxkIGJlIHVzZWQgYnkKCgkg
IFByb3ZpZGVzCgo+ICsgICAgICAgICAgZWl0aGVyIGtlbnJlbCBkcml2ZXIgb3IgdXNlcnNwYWNl
IGRyaXZlci4KCgkgICAgICAgICAgICBrZXJuZWwKCj4gKwo+ICsJICBJZiB5b3UgZG9uJ3Qga25v
dyB3aGF0IGRvIGhlcmUsIHNheSBOLgoKQWxsIG9mIHRoZXNlIGxpbmVzIHNob3VsZCBiZSBpbmRl
bnRlZCB3aXRoIG9uZSB0YWIsIG5vdCBzcGFjZXMuCgotLSAKflJhbmR5ClJlcG9ydGVkLWJ5OiBS
YW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50
ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
