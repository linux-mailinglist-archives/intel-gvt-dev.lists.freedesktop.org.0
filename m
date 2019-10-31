Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64926EA8EF
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 31 Oct 2019 02:46:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1847F6EBCE;
	Thu, 31 Oct 2019 01:46:40 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D74736EBCE
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 31 Oct 2019 01:46:38 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-Lo1Jpa2NM_aZjD_2oVi__A-1; Wed, 30 Oct 2019 21:46:33 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93F2C800D49;
 Thu, 31 Oct 2019 01:46:28 +0000 (UTC)
Received: from [10.72.12.100] (ovpn-12-100.pek2.redhat.com [10.72.12.100])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 07CE960870;
 Thu, 31 Oct 2019 01:46:03 +0000 (UTC)
Subject: Re: [PATCH V6 6/6] docs: sample driver to demonstrate how to
 implement virtio-mdev framework
To: Christoph Hellwig <hch@infradead.org>
References: <20191030064444.21166-1-jasowang@redhat.com>
 <20191030064444.21166-7-jasowang@redhat.com>
 <20191030212312.GA4251@infradead.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <d8266abb-391a-27d0-59ab-3e1412fe73da@redhat.com>
Date: Thu, 31 Oct 2019 09:46:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191030212312.GA4251@infradead.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: Lo1Jpa2NM_aZjD_2oVi__A-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1572486397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OIhA3h+F3B7b1YDj7xFASdzKWfp17j0nfrAmTNbsOig=;
 b=aP5orx4zJ4rE44+Tr1pslHxkuSgMR2He6h2ZyVD2cmNK9FcasktZgILo9Jomw+Gol6vQ86
 Gk8K45SD4uuWC6VFFOXXnM8kZSuAVT/GFmuMkc/vqYMDGT4Mq4Lx70Agu3e7UsjuVG3344
 kfLrrKZ3SKIvqClUfN444doVLNxy1oc=
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Ck9uIDIwMTkvMTAvMzEg5LiK5Y2INToyMywgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gT24g
V2VkLCBPY3QgMzAsIDIwMTkgYXQgMDI6NDQ6NDRQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gVGhpcyBzYW1wbGUgZHJpdmVyIGNyZWF0ZXMgbWRldiBkZXZpY2UgdGhhdCBzaW11bGF0ZSB2
aXJ0aW8gbmV0IGRldmljZQo+PiBvdmVyIHZpcnRpbyBtZGV2IHRyYW5zcG9ydC4gVGhlIGRldmlj
ZSBpcyBpbXBsZW1lbnRlZCB0aHJvdWdoIHZyaW5naAo+PiBhbmQgd29ya3F1ZXVlLiBBIGRldmlj
ZSBzcGVjaWZpYyBkbWEgb3BzIGlzIHRvIG1ha2Ugc3VyZSBIVkEgaXMgdXNlZAo+PiBkaXJlY3Rs
eSBhcyB0aGUgSU9WQS4gVGhpcyBzaG91bGQgYmUgc3VmZmljaWVudCBmb3Iga2VybmVsIHZpcnRp
bwo+PiBkcml2ZXIgdG8gd29yay4KPj4KPj4gT25seSAndmlydGlvJyB0eXBlIGlzIHN1cHBvcnRl
ZCByaWdodCBub3cuIEkgcGxhbiB0byBhZGQgJ3Zob3N0JyB0eXBlCj4+IG9uIHRvcCB3aGljaCBy
ZXF1aXJlcyBzb21lIHZpcnR1YWwgSU9NTVUgaW1wbGVtZW50ZWQgaW4gdGhpcyBzYW1wbGUKPj4g
ZHJpdmVyLgo+IENhbiB3ZSBwbGVhc2Ugc3VibWl0IGEgcmVhbCBkcml2ZXIgZm9yIGl0PyAgQSBt
b3JlIG9yIGxlc3MgdXNlbGVzcwo+IHNhbXBsZSBkcml2ZXIgZG9lc24ndCByZWFsbHkgcXVhbGlm
eSBmb3Igb3VyIG5vcm1hbCBrZXJuZWwgcmVxdWlyZW1lbnRzCj4gdGhhdCBpbmZyYXN0cnVjdHVy
ZSBzaG91bGQgaGF2ZSBhIHJlYWwgdXNlci4KCgpJbnRlbCBwb3N0ZWQgYSByZWFsIGRyaXZlciBo
ZXJlOiBodHRwczovL2xrbWwub3JnL2xrbWwvMjAxOS8xMC8xNS8xMjI2LgoKSSBwbGFuIHRvIHBv
c3QgYW5vdGhlciBkcml2ZXIgdGhhdCB3aXJlIHZpcml0by1wY2kgYmFjayB0byBtZGV2IGJ1cyBv
biAKdG9wIG9mIHRoaXMgc2VyaWVzIGFzIHdlbGwuCgpUaGFua3MKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlz
dAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
