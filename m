Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7395EA554
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 30 Oct 2019 22:23:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 925136ED56;
	Wed, 30 Oct 2019 21:23:15 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 643A16EBA9;
 Wed, 30 Oct 2019 21:23:14 +0000 (UTC)
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iPvQu-00034L-4b; Wed, 30 Oct 2019 21:23:12 +0000
Date: Wed, 30 Oct 2019 14:23:12 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V6 6/6] docs: sample driver to demonstrate how to
 implement virtio-mdev framework
Message-ID: <20191030212312.GA4251@infradead.org>
References: <20191030064444.21166-1-jasowang@redhat.com>
 <20191030064444.21166-7-jasowang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191030064444.21166-7-jasowang@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=87X+oyehu7JN6cXbNSmkqxhLbbV13utM66QLaFqOq30=; b=C0K0acY3VsFEjNSc5aNiAJFe4
 d54AjrBqdl31EiwE3juEmhzyVlbqM+vV8tLM0pK41NKkIBPSSjSJhZxLTJf1ZR1dUzQPd3P7Bfepo
 N5/Js2feq2atD6kIsq2nEI0zR7hMtJPFvxme4ObJ++6o7y3Lv9Q2ez3hM7Ym6z9j6MFfCzNt1u3UN
 DH4xUDvfwjWGNhxU+bGtqYo33RhrKWLa7yiZ4XkUlrrgYqN77HzLVIF3OHkXVDSNjno7AvoAzFX22
 YURfaj2i3xyAz42tT3zZ7C5c1fxke8BVtS/Kq2nwouudZaM5RtFilstS8C0cp7b25PYnwqyWSHF/R
 PnCRVVR8Q==;
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
 daniel@ffwll.ch, lingshan.zhu@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMzAsIDIwMTkgYXQgMDI6NDQ6NDRQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiBUaGlzIHNhbXBsZSBkcml2ZXIgY3JlYXRlcyBtZGV2IGRldmljZSB0aGF0IHNpbXVsYXRl
IHZpcnRpbyBuZXQgZGV2aWNlCj4gb3ZlciB2aXJ0aW8gbWRldiB0cmFuc3BvcnQuIFRoZSBkZXZp
Y2UgaXMgaW1wbGVtZW50ZWQgdGhyb3VnaCB2cmluZ2gKPiBhbmQgd29ya3F1ZXVlLiBBIGRldmlj
ZSBzcGVjaWZpYyBkbWEgb3BzIGlzIHRvIG1ha2Ugc3VyZSBIVkEgaXMgdXNlZAo+IGRpcmVjdGx5
IGFzIHRoZSBJT1ZBLiBUaGlzIHNob3VsZCBiZSBzdWZmaWNpZW50IGZvciBrZXJuZWwgdmlydGlv
Cj4gZHJpdmVyIHRvIHdvcmsuCj4gCj4gT25seSAndmlydGlvJyB0eXBlIGlzIHN1cHBvcnRlZCBy
aWdodCBub3cuIEkgcGxhbiB0byBhZGQgJ3Zob3N0JyB0eXBlCj4gb24gdG9wIHdoaWNoIHJlcXVp
cmVzIHNvbWUgdmlydHVhbCBJT01NVSBpbXBsZW1lbnRlZCBpbiB0aGlzIHNhbXBsZQo+IGRyaXZl
ci4KCkNhbiB3ZSBwbGVhc2Ugc3VibWl0IGEgcmVhbCBkcml2ZXIgZm9yIGl0PyAgQSBtb3JlIG9y
IGxlc3MgdXNlbGVzcwpzYW1wbGUgZHJpdmVyIGRvZXNuJ3QgcmVhbGx5IHF1YWxpZnkgZm9yIG91
ciBub3JtYWwga2VybmVsIHJlcXVpcmVtZW50cwp0aGF0IGluZnJhc3RydWN0dXJlIHNob3VsZCBo
YXZlIGEgcmVhbCB1c2VyLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2ludGVsLWd2dC1kZXY=
