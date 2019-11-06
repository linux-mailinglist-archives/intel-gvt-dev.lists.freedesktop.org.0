Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E62F2238
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  6 Nov 2019 23:58:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3554A6EE42;
	Wed,  6 Nov 2019 22:58:22 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 687EA6E339
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  6 Nov 2019 22:58:20 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-YbiNC0ioPxK3IgeNVq5zwQ-1; Wed, 06 Nov 2019 17:58:14 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2C16107ACC3;
 Wed,  6 Nov 2019 22:58:10 +0000 (UTC)
Received: from x1.home (ovpn-116-138.phx2.redhat.com [10.3.116.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF7AB5C1BB;
 Wed,  6 Nov 2019 22:58:00 +0000 (UTC)
Date: Wed, 6 Nov 2019 15:58:00 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH V9 6/6] docs: sample driver to demonstrate how to
 implement virtio-mdev framework
Message-ID: <20191106155800.0b8418ec@x1.home>
In-Reply-To: <88efad07-70aa-3879-31e7-ace4d2ad63a1@infradead.org>
References: <20191106070548.18980-1-jasowang@redhat.com>
 <20191106070548.18980-7-jasowang@redhat.com>
 <88efad07-70aa-3879-31e7-ace4d2ad63a1@infradead.org>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: YbiNC0ioPxK3IgeNVq5zwQ-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573081098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Clhu2rt+kpo43UbuiVcjjHoWtjEgIjo2tHeRtPjlyQ=;
 b=bZQe086k/IHnAuMY7ONkhRZddgHCeTz99r92g31HRvHEpYqODSOG66hMNdJeyg5OwNZjIh
 AMzG76nktxoFwj2Wb4bJOEsht7+aMBYXCoWM70wrBfiOa+3BFdCgfulYMCtZzg1AEUvdaU
 IMB6uxhYJFoFZ1Hx/p3oDZ/uKrI6tyk=
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
 mst@redhat.com, airlied@linux.ie, Jason Wang <jasowang@redhat.com>,
 joonas.lahtinen@linux.intel.com, heiko.carstens@de.ibm.com,
 kevin.tian@intel.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, kwankhede@nvidia.com,
 rob.miller@broadcom.com, linux-s390@vger.kernel.org, sebott@linux.ibm.com,
 lulu@redhat.com, eperezma@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, haotian.wang@sifive.com,
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

T24gV2VkLCA2IE5vdiAyMDE5IDE0OjUwOjMwIC0wODAwClJhbmR5IER1bmxhcCA8cmR1bmxhcEBp
bmZyYWRlYWQub3JnPiB3cm90ZToKCj4gT24gMTEvNS8xOSAxMTowNSBQTSwgSmFzb24gV2FuZyB3
cm90ZToKPiA+IGRpZmYgLS1naXQgYS9zYW1wbGVzL0tjb25maWcgYi9zYW1wbGVzL0tjb25maWcK
PiA+IGluZGV4IGM4ZGFjYjRkZGE4MC4uMTNhMjQ0M2UxOGUwIDEwMDY0NAo+ID4gLS0tIGEvc2Ft
cGxlcy9LY29uZmlnCj4gPiArKysgYi9zYW1wbGVzL0tjb25maWcKPiA+IEBAIC0xMzEsNiArMTMx
LDE2IEBAIGNvbmZpZyBTQU1QTEVfVkZJT19NREVWX01EUFkKPiA+ICAJICBtZWRpYXRlZCBkZXZp
Y2UuICBJdCBpcyBhIHNpbXBsZSBmcmFtZWJ1ZmZlciBhbmQgc3VwcG9ydHMKPiA+ICAJICB0aGUg
cmVnaW9uIGRpc3BsYXkgaW50ZXJmYWNlIChWRklPX0dGWF9QTEFORV9UWVBFX1JFR0lPTikuCj4g
PiAgCj4gPiArY29uZmlnIFNBTVBMRV9WSVJUSU9fTURFVl9ORVQKPiA+ICsJdHJpc3RhdGUgIkJ1
aWxkIFZJUlRJTyBuZXQgZXhhbXBsZSBtZWRpYXRlZCBkZXZpY2Ugc2FtcGxlIGNvZGUgLS0gbG9h
ZGFibGUgbW9kdWxlcyBvbmx5Igo+ID4gKwlkZXBlbmRzIG9uIFZJUlRJT19NREVWICYmIFZIT1NU
X1JJTkcgJiYgbQo+ID4gKwloZWxwCj4gPiArCSAgQnVpbGQgYSBuZXR3b3JraW5nIHNhbXBsZSBk
ZXZpY2UgZm9yIHVzZSBhcyBhIHZpcnRpbwo+ID4gKwkgIG1lZGlhdGVkIGRldmljZS4gVGhlIGRl
dmljZSBjb29wcmVhdGVzIHdpdGggdmlydGlvLW1kZXYgYnVzICAKPiAKPiB0eXBvIGhlcmU6Cj4g
CSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvb3BlcmF0ZXMKPiAKCkkgY2FuIGZpeCB0
aGlzIG9uIGNvbW1pdCByZWxhdGl2ZSB0byBWMTAgaWYgdGhlcmUgYXJlIG5vIG90aGVyIGlzc3Vl
cwpyYWlzZWQ6CgpkaWZmIC0tZ2l0IGEvc2FtcGxlcy9LY29uZmlnIGIvc2FtcGxlcy9LY29uZmln
CmluZGV4IDEzYTI0NDNlMThlMC4uYjcxMTZkOTdjYmJlIDEwMDY0NAotLS0gYS9zYW1wbGVzL0tj
b25maWcKKysrIGIvc2FtcGxlcy9LY29uZmlnCkBAIC0xMzYsNyArMTM2LDcgQEAgY29uZmlnIFNB
TVBMRV9WSVJUSU9fTURFVl9ORVQKICAgICAgICBkZXBlbmRzIG9uIFZJUlRJT19NREVWICYmIFZI
T1NUX1JJTkcgJiYgbQogICAgICAgIGhlbHAKICAgICAgICAgIEJ1aWxkIGEgbmV0d29ya2luZyBz
YW1wbGUgZGV2aWNlIGZvciB1c2UgYXMgYSB2aXJ0aW8KLSAgICAgICAgIG1lZGlhdGVkIGRldmlj
ZS4gVGhlIGRldmljZSBjb29wcmVhdGVzIHdpdGggdmlydGlvLW1kZXYgYnVzCisgICAgICAgICBt
ZWRpYXRlZCBkZXZpY2UuIFRoZSBkZXZpY2UgY29vcGVyYXRlcyB3aXRoIHZpcnRpby1tZGV2IGJ1
cwogICAgICAgICAgZHJpdmVyIHRvIHByZXNlbnQgYW4gdmlydGlvIGV0aGVybmV0IGRyaXZlciBm
b3IKICAgICAgICAgIGtlcm5lbC4gSXQgc2ltcGx5IGxvb3BiYWNrcyBhbGwgcGFja2V0cyBmcm9t
IGl0cyBUWAogICAgICAgICAgdmlydHF1ZXVlIHRvIGl0cyBSWCB2aXJ0cXVldWUuCgpUaGFua3Ms
CkFsZXgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlu
dGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwt
Z3Z0LWRldg==
