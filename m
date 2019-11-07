Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7C8F2ED7
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  7 Nov 2019 14:08:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6842C6F68B;
	Thu,  7 Nov 2019 13:08:33 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78FB76F68B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  7 Nov 2019 13:08:32 +0000 (UTC)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EC9264627A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  7 Nov 2019 13:08:31 +0000 (UTC)
Received: by mail-qk1-f197.google.com with SMTP id s3so2197246qkd.6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 07 Nov 2019 05:08:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=tXcdjIfv7WULf2HezusDMoDHkz/54up9J9zs1V5mjUk=;
 b=akoDWcA2y9hzmHurXZ5bn0oHzXXMVfYKBlhE9nEm2pqS82AvnZ304xR3Gofv5yY1jJ
 Wz9umZoUlrsa1oQIrYGcXMrG2vOSMdWDEgsYm++CsKSSHIN1JNdbwstujAydRJtjGWLW
 W0eITVwATpIA6HfIh63bovRaVpOqiuppSIiY6o9G8nECvtnu1MWan6pIgSyACNbeIJbO
 9gqkTxwJm6D2te5dfWcGOFPGPhVWiARWfz53m/Mt3np7J3scBLmItEscm4zUyn/9uZXH
 Zd/OYzrG/XuINaQ4AUYaG4K2cMbynNYoi0ivz+NXsySe3RBWqd+fdCVs7lWowQgnSeUn
 JUUw==
X-Gm-Message-State: APjAAAUVTiVC2tcwhzKENXEonIaVz3wGG0BbCaDRTaj7/3YyKx8RqZa1
 D69/sZ7MpQ/B5hBasJt/viCANs73j3k5krR7axauKaFSr+XhkQ6xGs3Akv1dhyHqaCbFyfrylQa
 ysivwPK0KNZaTB5SBq4J8S6f3VqQPd5Ozww==
X-Received: by 2002:a0c:e947:: with SMTP id n7mr3315684qvo.103.1573132111122; 
 Thu, 07 Nov 2019 05:08:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqxzprSHQlujR1MF9UHe+PqRrS5UswVR63DxA+6BEPw7ceXTuOVmM5LOubh+MnCt3hahFb/kSQ==
X-Received: by 2002:a0c:e947:: with SMTP id n7mr3315638qvo.103.1573132110806; 
 Thu, 07 Nov 2019 05:08:30 -0800 (PST)
Received: from redhat.com (bzq-79-178-12-128.red.bezeqint.net. [79.178.12.128])
 by smtp.gmail.com with ESMTPSA id 11sm1387231qtx.45.2019.11.07.05.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2019 05:08:29 -0800 (PST)
Date: Thu, 7 Nov 2019 08:08:17 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V10 6/6] docs: sample driver to demonstrate how to
 implement virtio-mdev framework
Message-ID: <20191107080721-mutt-send-email-mst@kernel.org>
References: <20191106133531.693-1-jasowang@redhat.com>
 <20191106133531.693-7-jasowang@redhat.com>
 <20191107040700-mutt-send-email-mst@kernel.org>
 <bd2f7796-8d88-0eb3-b55b-3ec062b186b7@redhat.com>
 <20191107061942-mutt-send-email-mst@kernel.org>
 <d09229bc-c3e4-8d4b-c28f-565fe150ced2@redhat.com>
 <c588c724-04da-2991-9f88-f36c0d04364a@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c588c724-04da-2991-9f88-f36c0d04364a@redhat.com>
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
Cc: christophe.de.dinechin@gmail.com, kvm@vger.kernel.org, airlied@linux.ie,
 joonas.lahtinen@linux.intel.com, heiko.carstens@de.ibm.com,
 kevin.tian@intel.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, kwankhede@nvidia.com,
 rob.miller@broadcom.com, linux-s390@vger.kernel.org, sebott@linux.ibm.com,
 lulu@redhat.com, eperezma@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, haotian.wang@sifive.com, cunming.liang@intel.com,
 zhi.a.wang@intel.com, farman@linux.ibm.com, parav@mellanox.com,
 gor@linux.ibm.com, intel-gfx@lists.freedesktop.org,
 jani.nikula@linux.intel.com, alex.williamson@redhat.com, xiao.w.wang@intel.com,
 freude@linux.ibm.com, zhenyuw@linux.intel.com, stefanha@redhat.com,
 zhihong.wang@intel.com, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
 oberpar@linux.ibm.com, tiwei.bie@intel.com, netdev@vger.kernel.org,
 cohuck@redhat.com, linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
 daniel@ffwll.ch, lingshan.zhu@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMDcsIDIwMTkgYXQgMDg6NDc6MDZQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDE5LzExLzcg5LiL5Y2IODo0MywgSmFzb24gV2FuZyB3cm90ZToKPiA+IAo+
ID4gT24gMjAxOS8xMS83IOS4i+WNiDc6MjEsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiA+
ID4gT24gVGh1LCBOb3YgMDcsIDIwMTkgYXQgMDY6MTg6NDVQTSArMDgwMCwgSmFzb24gV2FuZyB3
cm90ZToKPiA+ID4gPiBPbiAyMDE5LzExLzcg5LiL5Y2INTowOCwgTWljaGFlbCBTLiBUc2lya2lu
IHdyb3RlOgo+ID4gPiA+ID4gT24gV2VkLCBOb3YgMDYsIDIwMTkgYXQgMDk6MzU6MzFQTSArMDgw
MCwgSmFzb24gV2FuZyB3cm90ZToKPiA+ID4gPiA+ID4gVGhpcyBzYW1wbGUgZHJpdmVyIGNyZWF0
ZXMgbWRldiBkZXZpY2UgdGhhdCBzaW11bGF0ZQo+ID4gPiA+ID4gPiB2aXJ0aW8gbmV0IGRldmlj
ZQo+ID4gPiA+ID4gPiBvdmVyIHZpcnRpbyBtZGV2IHRyYW5zcG9ydC4gVGhlIGRldmljZSBpcyBp
bXBsZW1lbnRlZCB0aHJvdWdoIHZyaW5naAo+ID4gPiA+ID4gPiBhbmQgd29ya3F1ZXVlLiBBIGRl
dmljZSBzcGVjaWZpYyBkbWEgb3BzIGlzIHRvIG1ha2Ugc3VyZSBIVkEgaXMgdXNlZAo+ID4gPiA+
ID4gPiBkaXJlY3RseSBhcyB0aGUgSU9WQS4gVGhpcyBzaG91bGQgYmUgc3VmZmljaWVudCBmb3Ig
a2VybmVsIHZpcnRpbwo+ID4gPiA+ID4gPiBkcml2ZXIgdG8gd29yay4KPiA+ID4gPiA+ID4gCj4g
PiA+ID4gPiA+IE9ubHkgJ3ZpcnRpbycgdHlwZSBpcyBzdXBwb3J0ZWQgcmlnaHQgbm93LiBJIHBs
YW4gdG8gYWRkICd2aG9zdCcgdHlwZQo+ID4gPiA+ID4gPiBvbiB0b3Agd2hpY2ggcmVxdWlyZXMg
c29tZSB2aXJ0dWFsIElPTU1VIGltcGxlbWVudGVkIGluIHRoaXMgc2FtcGxlCj4gPiA+ID4gPiA+
IGRyaXZlci4KPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IEFja2VkLWJ5OiBDb3JuZWxpYSBIdWNr
PGNvaHVja0ByZWRoYXQuY29tPgo+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBXYW5n
PGphc293YW5nQHJlZGhhdC5jb20+Cj4gPiA+ID4gPiBJJ2QgcHJlZmVyIGl0IHRoYXQgd2UgY2Fs
bCB0aGlzIHNvbWV0aGluZyBlbHNlLCBlLmcuCj4gPiA+ID4gPiBtdm5ldC1sb29wYmFjay4gSnVz
dCBzbyBwZW9wbGUgZG9uJ3QgZXhwZWN0IGEgZnVsbHkKPiA+ID4gPiA+IGZ1bmN0aW9uYWwgZGV2
aWNlIHNvbWVob3cuIENhbiBiZSByZW5hbWVkIHdoZW4gYXBwbHlpbmc/Cj4gPiA+ID4gQWN0dWFs
bHksIEkgcGxhbiB0byBleHRlbmQgaXQgYXMgYW5vdGhlciBzdGFuZGFyZCBuZXR3b3JrIGludGVy
ZmFjZSBmb3IKPiA+ID4gPiBrZXJuZWwuIEl0IGNvdWxkIGJlIGVpdGhlciBhIHN0YW5kYWxvbmUg
cHNldWRvIGRldmljZSBvciBhIHN0YWNrCj4gPiA+ID4gZGV2aWNlLgo+ID4gPiA+IERvZXMgdGhp
cyBzb3VuZHMgZ29vZCB0byB5b3U/Cj4gPiA+ID4gCj4gPiA+ID4gVGhhbmtzCj4gPiA+IFRoYXQn
cyBhIGJpZyBjaGFuZ2UgaW4gYW4gaW50ZXJmYWNlIHNvIGl0J3MgYSBnb29kIHJlYXNvbgo+ID4g
PiB0byByZW5hbWUgdGhlIGRyaXZlciBhdCB0aGF0IHBvaW50IHJpZ2h0Pwo+ID4gPiBPaGVyd2lz
ZSB1c2VycyBvZiBhbiBvbGQga2VybmVsIHdvdWxkIGV4cGVjdCBhIHN0YWNrZWQgZHJpdmVyCj4g
PiA+IGFuZCBnZXQgYSBsb29wYmFjayBpbnN0ZWFkLgo+ID4gPiAKPiA+ID4gT3IgZGlkIEkgbWlz
cyBzb21ldGhpbmc/Cj4gPiAKPiA+IAo+ID4gTXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IGl0IHdh
cyBhIHNhbXBsZSBkcml2ZXIgaW4gL2RvYy4gSXQgc2hvdWxkIG5vdAo+ID4gYmUgdXNlZCBpbiBw
cm9kdWN0aW9uIGVudmlyb25tZW50LiBPdGhlcndpc2Ugd2UgbmVlZCB0byBtb3ZlIGl0IHRvCj4g
PiBkcml2ZXIvdmlydGlvLgo+ID4gCj4gPiBCdXQgaWYgeW91IGluc2lzdCwgSSBjYW4gcG9zdCBh
IFYxMS4KPiA+IAo+ID4gVGhhbmtzCj4gCj4gCj4gT3IgbWF5YmUgaXQncyBiZXR0ZXIgdG8gcmVu
YW1lIHRoZSB0eXBlIG9mIGN1cnJlbnQgbWRldiBmcm9tICd2aXJ0aW8nIHRvCj4gJ3ZpcnRpby1s
b29wYmFjaycuIFRoZW4gd2UgY2FuIGFkZCBtb3JlIHR5cGVzIGluIHRoZSBmdXR1cmUuCj4gCj4g
VGhhbmtzCj4gCgpNYXliZSBidXQgaXMgdmlydGlvIGFjdHVhbGx5IGEgbG9vcGJhY2sgc29tZWhv
dz8gSSB0aG91Z2h0IHdlCmNhbiBiaW5kIGEgcmVndWxhciB2aXJ0aW8gZGV2aWNlIHRoZXJlLCBu
bz8KCi0tIApNU1QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
bnRlbC1ndnQtZGV2
