Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E62EF3FE
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  5 Nov 2019 04:19:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF3A46E8E5;
	Tue,  5 Nov 2019 03:19:27 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4AAC6E8E9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  5 Nov 2019 03:19:25 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-QYfxRTI1PLOj3fR3gSxtGg-1; Mon, 04 Nov 2019 22:19:18 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01604800C73;
 Tue,  5 Nov 2019 03:19:15 +0000 (UTC)
Received: from [10.72.12.252] (ovpn-12-252.pek2.redhat.com [10.72.12.252])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D2105D6D4;
 Tue,  5 Nov 2019 03:17:29 +0000 (UTC)
Subject: Re: [PATCH V7 3/6] mdev: introduce device specific ops
To: Alex Williamson <alex.williamson@redhat.com>
References: <20191104123952.17276-1-jasowang@redhat.com>
 <20191104123952.17276-4-jasowang@redhat.com>
 <20191104145008.4b6839f0@x1.home>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <47ecfe09-0954-9517-3ac5-68db8522826d@redhat.com>
Date: Tue, 5 Nov 2019 11:17:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191104145008.4b6839f0@x1.home>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: QYfxRTI1PLOj3fR3gSxtGg-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1572923964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j5OzLFkpAUjCP+yb4lupAMQyPwr8X3YeEPsxi0E3pqk=;
 b=gH/rhKXJvZVpoLwvxSv4A0oYvhDnOhGRLH0E8WNI7k8BxOG05JUK1PbJTlPOHoS+df8oQA
 9amT5CC497WYisVkvKlxQ9RP4+8dlZaaMLg20ebBc/NQLR4qmbnPB5ZiLqcY4IX7SBiMKd
 gBJ25EDPP1gV2rRS/+zIYma2IgA8k3k=
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
 jani.nikula@linux.intel.com, rodrigo.vivi@intel.com, xiao.w.wang@intel.com,
 freude@linux.ibm.com, zhenyuw@linux.intel.com, parav@mellanox.com,
 zhihong.wang@intel.com, intel-gvt-dev@lists.freedesktop.org,
 akrowiak@linux.ibm.com, oberpar@linux.ibm.com, tiwei.bie@intel.com,
 netdev@vger.kernel.org, cohuck@redhat.com, linux-kernel@vger.kernel.org,
 maxime.coquelin@redhat.com, daniel@ffwll.ch, lingshan.zhu@intel.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Ck9uIDIwMTkvMTEvNSDkuIrljYg1OjUwLCBBbGV4IFdpbGxpYW1zb24gd3JvdGU6Cj4+ICAgRVhQ
T1JUX1NZTUJPTChtZGV2X3NldF9kcnZkYXRhKTsKPj4gICAKPj4gKwo+IEV4dHJhIHdoaXRlc3Bh
Y2UKPgo+PiAgIC8qIFNwZWNpZnkgdGhlIGNsYXNzIGZvciB0aGUgbWRldiBkZXZpY2UsIHRoaXMg
bXVzdCBiZSBjYWxsZWQgZHVyaW5nCj4+IC0gKiBjcmVhdGUoKSBjYWxsYmFjay4KPj4gLSAqLwo+
PiArICogY3JlYXRlKCkgY2FsbGJhY2sgZXhwbGljaXRseSBvciBpbXBsaWNpdHkgdGhyb3VnaCB0
aGUgaGVscGVycwo+IHMvaW1wbGljaXR5L2ltcGxpY2l0bHkvCj4KPj4gKyAqIHByb3ZpZGVkIGJ5
IGVhY2ggY2xhc3MuICovCj4+ICAgdm9pZCBtZGV2X3NldF9jbGFzcyhzdHJ1Y3QgbWRldl9kZXZp
Y2UgKm1kZXYsIHUxNiBpZCkKPj4gICB7Cj4+ICAgCVdBUk5fT04obWRldi0+Y2xhc3NfaWQpOwo+
PiBAQCAtNTUsNiArNTYsMjYgQEAgdm9pZCBtZGV2X3NldF9jbGFzcyhzdHJ1Y3QgbWRldl9kZXZp
Y2UgKm1kZXYsIHUxNiBpZCkKPj4gICB9Cj4+ICAgRVhQT1JUX1NZTUJPTChtZGV2X3NldF9jbGFz
cyk7Cj4+ICAgCj4+ICsvKiBTcGVjaWZ5IHRoZSBtZGV2IGRldmljZSB0byBiZSBhIFZGSU8gbWRl
diBkZXZpY2UsIGFuZCBzZXQgVkZJTwo+PiArICogZGV2aWNlIG9wcyBmb3IgaXQuIFRoaXMgbXVz
dCBiZSBjYWxsZWQgZnJvbSB0aGUgY3JlYXRlKCkgY2FsbGJhY2sKPj4gKyAqIGZvciBWRklPIG1k
ZXYgZGV2aWNlLgo+PiArICovCj4gQ29tbWVudCBzdHlsZS4gIFRoYW5rcywKCgpXaWxsIGZpeCB0
aGVtIGFsbC4KClRoYW5rcwoKCj4KPiBBbGV4Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
