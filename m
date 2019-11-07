Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA9BF2D58
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  7 Nov 2019 12:21:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F286F657;
	Thu,  7 Nov 2019 11:21:45 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E86906F653
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  7 Nov 2019 11:21:40 +0000 (UTC)
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F2F057C0B9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  7 Nov 2019 11:21:39 +0000 (UTC)
Received: by mail-qt1-f200.google.com with SMTP id x21so2205355qtp.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 07 Nov 2019 03:21:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=wnfHxd+h5ByIy6pNIpYUPsi2zmTYpBRj65XvOkNtL/w=;
 b=tpxnQIp+98s88YgQGSYXxsCRBYDAjVxevE5u/lohvbyeSnToo2F7At4tBeCy8+rTiY
 MqT9MJqCpLZm0Drs4SCbFNMiHTF7KaiuKk3BiUR5cMF64lTkoX7nKTqN4MLgnO3z9P+e
 zLUWwsn8Xuk+GUh7ps6qDXyfCKItaqP0rg+UPjouvY2yr/djZKUecqqEiFevTgJ7Fvga
 L1b258eNFJeWkgyEKTjCJS4T1PSyqklFeMznqO3ONgaz/EmCFNrx3MCDGsnl7lpwGNei
 ml10o/dOjnLS1OP71lgbscrhiKh0eRxYoUdcAULL3mKChFRMxgdrSp+c5nCkqK/neuXe
 rrsw==
X-Gm-Message-State: APjAAAXJ51nmDAOU/YQ9aNlDZTGdBpWi6VC/4ZpVGuYRL5/s/3bQsZiD
 VlkRTD8kqEWjcVsDixORBikzDEYFxZl1ebke+cr626OZ7SkclOb6KXCUoi3k20s16e0lh2ZgeDz
 hvYuwXXAM1EZbbWJ2Chi0C8HFXoI4HIFhBg==
X-Received: by 2002:ac8:289d:: with SMTP id i29mr3319322qti.24.1573125698928; 
 Thu, 07 Nov 2019 03:21:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqwLKHqje2IEEYthZFjXYN+ipb1SMK7JO7Dpv9RPMHrWqUxiMCMx6JeRQige0AiW+TwcjzGM5w==
X-Received: by 2002:ac8:289d:: with SMTP id i29mr3319270qti.24.1573125698659; 
 Thu, 07 Nov 2019 03:21:38 -0800 (PST)
Received: from redhat.com (bzq-79-178-12-128.red.bezeqint.net. [79.178.12.128])
 by smtp.gmail.com with ESMTPSA id u27sm1182961qtj.5.2019.11.07.03.21.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2019 03:21:37 -0800 (PST)
Date: Thu, 7 Nov 2019 06:21:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V10 6/6] docs: sample driver to demonstrate how to
 implement virtio-mdev framework
Message-ID: <20191107061942-mutt-send-email-mst@kernel.org>
References: <20191106133531.693-1-jasowang@redhat.com>
 <20191106133531.693-7-jasowang@redhat.com>
 <20191107040700-mutt-send-email-mst@kernel.org>
 <bd2f7796-8d88-0eb3-b55b-3ec062b186b7@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bd2f7796-8d88-0eb3-b55b-3ec062b186b7@redhat.com>
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
 airlied@linux.ie, joonas.lahtinen@linux.intel.com, heiko.carstens@de.ibm.com,
 kevin.tian@intel.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, kwankhede@nvidia.com,
 rob.miller@broadcom.com, linux-s390@vger.kernel.org, sebott@linux.ibm.com,
 lulu@redhat.com, eperezma@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, haotian.wang@sifive.com, cunming.liang@intel.com,
 zhi.a.wang@intel.com, farman@linux.ibm.com, idos@mellanox.com,
 gor@linux.ibm.com, intel-gfx@lists.freedesktop.org,
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

T24gVGh1LCBOb3YgMDcsIDIwMTkgYXQgMDY6MTg6NDVQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDE5LzExLzcg5LiL5Y2INTowOCwgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+ID4gT24gV2VkLCBOb3YgMDYsIDIwMTkgYXQgMDk6MzU6MzFQTSArMDgwMCwgSmFzb24gV2Fu
ZyB3cm90ZToKPiA+ID4gVGhpcyBzYW1wbGUgZHJpdmVyIGNyZWF0ZXMgbWRldiBkZXZpY2UgdGhh
dCBzaW11bGF0ZSB2aXJ0aW8gbmV0IGRldmljZQo+ID4gPiBvdmVyIHZpcnRpbyBtZGV2IHRyYW5z
cG9ydC4gVGhlIGRldmljZSBpcyBpbXBsZW1lbnRlZCB0aHJvdWdoIHZyaW5naAo+ID4gPiBhbmQg
d29ya3F1ZXVlLiBBIGRldmljZSBzcGVjaWZpYyBkbWEgb3BzIGlzIHRvIG1ha2Ugc3VyZSBIVkEg
aXMgdXNlZAo+ID4gPiBkaXJlY3RseSBhcyB0aGUgSU9WQS4gVGhpcyBzaG91bGQgYmUgc3VmZmlj
aWVudCBmb3Iga2VybmVsIHZpcnRpbwo+ID4gPiBkcml2ZXIgdG8gd29yay4KPiA+ID4gCj4gPiA+
IE9ubHkgJ3ZpcnRpbycgdHlwZSBpcyBzdXBwb3J0ZWQgcmlnaHQgbm93LiBJIHBsYW4gdG8gYWRk
ICd2aG9zdCcgdHlwZQo+ID4gPiBvbiB0b3Agd2hpY2ggcmVxdWlyZXMgc29tZSB2aXJ0dWFsIElP
TU1VIGltcGxlbWVudGVkIGluIHRoaXMgc2FtcGxlCj4gPiA+IGRyaXZlci4KPiA+ID4gCj4gPiA+
IEFja2VkLWJ5OiBDb3JuZWxpYSBIdWNrPGNvaHVja0ByZWRoYXQuY29tPgo+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBKYXNvbiBXYW5nPGphc293YW5nQHJlZGhhdC5jb20+Cj4gPiBJJ2QgcHJlZmVyIGl0
IHRoYXQgd2UgY2FsbCB0aGlzIHNvbWV0aGluZyBlbHNlLCBlLmcuCj4gPiBtdm5ldC1sb29wYmFj
ay4gSnVzdCBzbyBwZW9wbGUgZG9uJ3QgZXhwZWN0IGEgZnVsbHkKPiA+IGZ1bmN0aW9uYWwgZGV2
aWNlIHNvbWVob3cuIENhbiBiZSByZW5hbWVkIHdoZW4gYXBwbHlpbmc/Cj4gCj4gCj4gQWN0dWFs
bHksIEkgcGxhbiB0byBleHRlbmQgaXQgYXMgYW5vdGhlciBzdGFuZGFyZCBuZXR3b3JrIGludGVy
ZmFjZSBmb3IKPiBrZXJuZWwuIEl0IGNvdWxkIGJlIGVpdGhlciBhIHN0YW5kYWxvbmUgcHNldWRv
IGRldmljZSBvciBhIHN0YWNrIGRldmljZS4KPiBEb2VzIHRoaXMgc291bmRzIGdvb2QgdG8geW91
Pwo+IAo+IFRoYW5rcwoKVGhhdCdzIGEgYmlnIGNoYW5nZSBpbiBhbiBpbnRlcmZhY2Ugc28gaXQn
cyBhIGdvb2QgcmVhc29uCnRvIHJlbmFtZSB0aGUgZHJpdmVyIGF0IHRoYXQgcG9pbnQgcmlnaHQ/
Ck9oZXJ3aXNlIHVzZXJzIG9mIGFuIG9sZCBrZXJuZWwgd291bGQgZXhwZWN0IGEgc3RhY2tlZCBk
cml2ZXIKYW5kIGdldCBhIGxvb3BiYWNrIGluc3RlYWQuCgpPciBkaWQgSSBtaXNzIHNvbWV0aGlu
Zz8KCj4gCj4gPiAKPiA+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2ludGVsLWd2dC1kZXY=
