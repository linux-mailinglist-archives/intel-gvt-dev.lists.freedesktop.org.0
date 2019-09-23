Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5218BB8D6
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 23 Sep 2019 18:00:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 698156E966;
	Mon, 23 Sep 2019 16:00:56 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4180D6E967
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 23 Sep 2019 16:00:55 +0000 (UTC)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 74A822A09B5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 23 Sep 2019 16:00:54 +0000 (UTC)
Received: by mail-qt1-f199.google.com with SMTP id x26so17786593qtr.17
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 23 Sep 2019 09:00:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FnrZlG9onHbzoUOas395WBpQBkqdPWiXJrz3kgJAMNs=;
 b=OWU2aZoAe9jV+tZvp+4xL0CzbV8c2mWgSumCwNgGY/2nqG27h4kfjEtxnzO/TKyC13
 AUbZrfNqwkPxyqNVQUpmiXP0cdgc61kHoY2bI9za/0mLU9xyEoP2vVLrsSXfsA7ZyLPU
 pqpsVmZGceCqOmLy0gJk2Ny1eF9o0mAcJR44LyhcXvqqDn7NR6poEpkLgM6S7pHgsPHs
 iS1jHFgis2fljdX/sfA6NlwrlX2DyzTV2xWAroOZ4PtKhjc22Ap1Gy198LMbd5+q3DWb
 QvOmJgOHYoAkUw4+1YjoI8YrTfoS9bPUvweocmHW0hRBTneKBvjH2xcQmsAt1TTBHsV3
 wqCw==
X-Gm-Message-State: APjAAAUq77p1Ng0dU9w6RC7Hvy+rhhAEndrMEsfiQbAhCXE7BOt6HIPG
 Y+cl1TOT8n2py5BpSlkhXwkD+hxg+zsz3lWACjFGwB8OSb3P4OUyk+gK0h3yGCLlkNkAnONLvCB
 rw3LQA4th/JX+jpPFC4MufFQ4hMb9pl7ZmQ==
X-Received: by 2002:a0c:e48b:: with SMTP id n11mr25662862qvl.38.1569254453739; 
 Mon, 23 Sep 2019 09:00:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzeS0qH7VWztyzQkjfFK33LHuBL/0r9aVYJeACu8zWG4i5I+VaFWBP3hOAewtn9oF8WJysLNw==
X-Received: by 2002:a0c:e48b:: with SMTP id n11mr25662820qvl.38.1569254453463; 
 Mon, 23 Sep 2019 09:00:53 -0700 (PDT)
Received: from redhat.com (bzq-79-176-40-226.red.bezeqint.net. [79.176.40.226])
 by smtp.gmail.com with ESMTPSA id m125sm5840827qkd.3.2019.09.23.09.00.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2019 09:00:52 -0700 (PDT)
Date: Mon, 23 Sep 2019 12:00:41 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH 5/6] vringh: fix copy direction of vringh_iov_push_kern()
Message-ID: <20190923115930-mutt-send-email-mst@kernel.org>
References: <20190923130331.29324-1-jasowang@redhat.com>
 <20190923130331.29324-6-jasowang@redhat.com>
 <20190923094559.765da494@x1.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190923094559.765da494@x1.home>
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
Cc: kvm@vger.kernel.org, airlied@linux.ie, Jason Wang <jasowang@redhat.com>,
 joonas.lahtinen@linux.intel.com, heiko.carstens@de.ibm.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 kwankhede@nvidia.com, rob.miller@broadcom.com, linux-s390@vger.kernel.org,
 sebott@linux.ibm.com, lulu@redhat.com, eperezma@redhat.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, haotian.wang@sifive.com,
 intel-gfx@lists.freedesktop.org, zhi.a.wang@intel.com, farman@linux.ibm.com,
 idos@mellanox.com, gor@linux.ibm.com, cunming.liang@intel.com,
 jani.nikula@linux.intel.com, rodrigo.vivi@intel.com, xiao.w.wang@intel.com,
 freude@linux.ibm.com, zhenyuw@linux.intel.com, parav@mellanox.com,
 zhihong.wang@intel.com, intel-gvt-dev@lists.freedesktop.org,
 akrowiak@linux.ibm.com, oberpar@linux.ibm.com, tiwei.bie@intel.com,
 netdev@vger.kernel.org, cohuck@redhat.com, linux-kernel@vger.kernel.org,
 maxime.coquelin@redhat.com, daniel@ffwll.ch, lingshan.zhu@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgMDk6NDU6NTlBTSAtMDYwMCwgQWxleCBXaWxsaWFtc29u
IHdyb3RlOgo+IE9uIE1vbiwgMjMgU2VwIDIwMTkgMjE6MDM6MzAgKzA4MDAKPiBKYXNvbiBXYW5n
IDxqYXNvd2FuZ0ByZWRoYXQuY29tPiB3cm90ZToKPiAKPiA+IFdlIHdhbnQgdG8gY29weSBmcm9t
IGlvdiB0byBidWYsIHNvIHRoZSBkaXJlY3Rpb24gd2FzIHdyb25nLgo+ID4gCj4gPiBTaWduZWQt
b2ZmLWJ5OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+ID4gLS0tCj4gPiAgZHJp
dmVycy92aG9zdC92cmluZ2guYyB8IDggKysrKysrKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNyBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gCj4gV2h5IGlzIHRoaXMgaW5jbHVkZWQg
aW4gdGhlIHNlcmllcz8gIFNlZW1zIGxpa2UgYW4gdW5yZWxhdGVkIGZpeCBiZWluZwo+IGhlbGQg
dXAgd2l0aGluIGEgcHJvcG9zYWwgZm9yIGEgbmV3IGZlYXR1cmUuICBUaGFua3MsCj4gCj4gQWxl
eAoKSXQncyBiZXR0ZXIgdG8gaGF2ZSBpdCBhcyBwYXRjaCAxLzYsIGJ1dCBpdCdzIGEgZGVwZW5k
ZW5jeSBvZiB0aGUKZXhhbXBsZSBkcml2ZXIgaW4gdGhlIHNlcmllcy4gSSBjYW4gcmVvcmRlciB3
aGVuIEkgYXBwbHkuCgoKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zob3N0L3ZyaW5naC5jIGIv
ZHJpdmVycy92aG9zdC92cmluZ2guYwo+ID4gaW5kZXggMDhhZDBkMWYwNDc2Li5hMGEyZDc0OTY3
ZWYgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3Zob3N0L3ZyaW5naC5jCj4gPiArKysgYi9kcml2
ZXJzL3Zob3N0L3ZyaW5naC5jCj4gPiBAQCAtODUyLDYgKzg1MiwxMiBAQCBzdGF0aWMgaW5saW5l
IGludCB4ZmVyX2tlcm4odm9pZCAqc3JjLCB2b2lkICpkc3QsIHNpemVfdCBsZW4pCj4gPiAgCXJl
dHVybiAwOwo+ID4gIH0KPiA+ICAKPiA+ICtzdGF0aWMgaW5saW5lIGludCBrZXJuX3hmZXIodm9p
ZCAqZHN0LCB2b2lkICpzcmMsIHNpemVfdCBsZW4pCj4gPiArewo+ID4gKwltZW1jcHkoZHN0LCBz
cmMsIGxlbik7Cj4gPiArCXJldHVybiAwOwo+ID4gK30KPiA+ICsKPiA+ICAvKioKPiA+ICAgKiB2
cmluZ2hfaW5pdF9rZXJuIC0gaW5pdGlhbGl6ZSBhIHZyaW5naCBmb3IgYSBrZXJuZWxzcGFjZSB2
cmluZy4KPiA+ICAgKiBAdnJoOiB0aGUgdnJpbmdoIHRvIGluaXRpYWxpemUuCj4gPiBAQCAtOTU4
LDcgKzk2NCw3IEBAIEVYUE9SVF9TWU1CT0wodnJpbmdoX2lvdl9wdWxsX2tlcm4pOwo+ID4gIHNz
aXplX3QgdnJpbmdoX2lvdl9wdXNoX2tlcm4oc3RydWN0IHZyaW5naF9raW92ICp3aW92LAo+ID4g
IAkJCSAgICAgY29uc3Qgdm9pZCAqc3JjLCBzaXplX3QgbGVuKQo+ID4gIHsKPiA+IC0JcmV0dXJu
IHZyaW5naF9pb3ZfeGZlcih3aW92LCAodm9pZCAqKXNyYywgbGVuLCB4ZmVyX2tlcm4pOwo+ID4g
KwlyZXR1cm4gdnJpbmdoX2lvdl94ZmVyKHdpb3YsICh2b2lkICopc3JjLCBsZW4sIGtlcm5feGZl
cik7Cj4gPiAgfQo+ID4gIEVYUE9SVF9TWU1CT0wodnJpbmdoX2lvdl9wdXNoX2tlcm4pOwo+ID4g
IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1n
dnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1k
ZXY=
