Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5385BF022C
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  5 Nov 2019 17:04:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0968E6EADA;
	Tue,  5 Nov 2019 16:04:09 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D31ED6EAD6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  5 Nov 2019 16:04:06 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-egJn3EFrO8Wf6MWJEVzIeg-1; Tue, 05 Nov 2019 11:03:55 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B132C1800D4A;
 Tue,  5 Nov 2019 16:03:50 +0000 (UTC)
Received: from gondolin (unknown [10.36.118.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D823B608AC;
 Tue,  5 Nov 2019 16:03:23 +0000 (UTC)
Date: Tue, 5 Nov 2019 17:03:19 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V8 1/6] mdev: class id support
Message-ID: <20191105170319.41fe7d2c.cohuck@redhat.com>
In-Reply-To: <20191105093240.5135-2-jasowang@redhat.com>
References: <20191105093240.5135-1-jasowang@redhat.com>
 <20191105093240.5135-2-jasowang@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: egJn3EFrO8Wf6MWJEVzIeg-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1572969845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5jHzTufVqj3xcUhXgZf6+U7zit20vAMAvRvtB9TGvhg=;
 b=flZ9g8sRx7r9jCCYjHRVptn3KX9QzYzusELxEXN0hGDmmI9eIR7X+CcL6v2dgiLro5xUBj
 Zur/GZ1Ij89OtY5Kpnlm3SOoCaJAxJj5cD2gilPFOz9e/5dCeL3o9Q6H92vaxaSRHtX3lK
 R430jkzfZK7lMqeZYVXiC0CQg2wKA0k=
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
 linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com, daniel@ffwll.ch,
 lingshan.zhu@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVHVlLCAgNSBOb3YgMjAxOSAxNzozMjozNSArMDgwMApKYXNvbiBXYW5nIDxqYXNvd2FuZ0By
ZWRoYXQuY29tPiB3cm90ZToKCj4gTWRldiBidXMgb25seSBzdXBwb3J0cyB2ZmlvIGRyaXZlciBy
aWdodCBub3csIHNvIGl0IGRvZXNuJ3QgaW1wbGVtZW50Cj4gbWF0Y2ggbWV0aG9kLiBCdXQgaW4g
dGhlIGZ1dHVyZSwgd2UgbWF5IGFkZCBkcml2ZXJzIG90aGVyIHRoYW4gdmZpbywKPiB0aGUgZmly
c3QgZHJpdmVyIGNvdWxkIGJlIHZpcnRpby1tZGV2LiBUaGlzIG1lYW5zIHdlIG5lZWQgdG8gYWRk
Cj4gZGV2aWNlIGNsYXNzIGlkIHN1cHBvcnQgaW4gYnVzIG1hdGNoIG1ldGhvZCB0byBwYWlyIHRo
ZSBtZGV2IGRldmljZQo+IGFuZCBtZGV2IGRyaXZlciBjb3JyZWN0bHkuCj4gCj4gU28gdGhpcyBw
YXRjaCBhZGRzIGlkX3RhYmxlIHRvIG1kZXZfZHJpdmVyIGFuZCBjbGFzc19pZCBmb3IgbWRldgo+
IGRldmljZSB3aXRoIHRoZSBtYXRjaCBtZXRob2QgZm9yIG1kZXYgYnVzLgo+IAo+IFJldmlld2Vk
LWJ5OiBQYXJhdiBQYW5kaXQgPHBhcmF2QG1lbGxhbm94LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBK
YXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+IC0tLQo+ICAuLi4vZHJpdmVyLWFwaS92
ZmlvLW1lZGlhdGVkLWRldmljZS5yc3QgICAgICAgfCAgNSArKysrCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d2dC9rdm1ndC5jICAgICAgICAgICAgICB8ICAxICsKPiAgZHJpdmVycy9zMzkwL2Np
by92ZmlvX2Njd19vcHMuYyAgICAgICAgICAgICAgIHwgIDEgKwo+ICBkcml2ZXJzL3MzOTAvY3J5
cHRvL3ZmaW9fYXBfb3BzLmMgICAgICAgICAgICAgfCAgMSArCj4gIGRyaXZlcnMvdmZpby9tZGV2
L21kZXZfY29yZS5jICAgICAgICAgICAgICAgICB8IDE3ICsrKysrKysrKysrKysKPiAgZHJpdmVy
cy92ZmlvL21kZXYvbWRldl9kcml2ZXIuYyAgICAgICAgICAgICAgIHwgMjUgKysrKysrKysrKysr
KysrKysrKwo+ICBkcml2ZXJzL3ZmaW8vbWRldi9tZGV2X3ByaXZhdGUuaCAgICAgICAgICAgICAg
fCAgMSArCj4gIGRyaXZlcnMvdmZpby9tZGV2L3ZmaW9fbWRldi5jICAgICAgICAgICAgICAgICB8
ICA2ICsrKysrCj4gIGluY2x1ZGUvbGludXgvbWRldi5oICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICA4ICsrKysrKwo+ICBpbmNsdWRlL2xpbnV4L21vZF9kZXZpY2V0YWJsZS5oICAgICAgICAg
ICAgICAgfCAgOCArKysrKysKPiAgc2FtcGxlcy92ZmlvLW1kZXYvbWJvY2hzLmMgICAgICAgICAg
ICAgICAgICAgIHwgIDEgKwo+ICBzYW1wbGVzL3ZmaW8tbWRldi9tZHB5LmMgICAgICAgICAgICAg
ICAgICAgICAgfCAgMSArCj4gIHNhbXBsZXMvdmZpby1tZGV2L210dHkuYyAgICAgICAgICAgICAg
ICAgICAgICB8ICAxICsKPiAgMTMgZmlsZXMgY2hhbmdlZCwgNzYgaW5zZXJ0aW9ucygrKQoKUmV2
aWV3ZWQtYnk6IENvcm5lbGlhIEh1Y2sgPGNvaHVja0ByZWRoYXQuY29tPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5n
IGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
