Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AACC0BB603
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 23 Sep 2019 15:59:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CC0489B3B;
	Mon, 23 Sep 2019 13:59:54 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA9F5899D4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 23 Sep 2019 13:59:52 +0000 (UTC)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 29BD388306
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 23 Sep 2019 13:59:52 +0000 (UTC)
Received: by mail-qt1-f199.google.com with SMTP id s14so17437974qtn.4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 23 Sep 2019 06:59:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FtApu15nyFEPJdV270MkGcXi5No4IIGcISN59p+vUsI=;
 b=IXZKRwMp1QRoLzyaCYJPXXrCQOfh2jiME26F7eyTcoVg9buU4fVSy/KWCsXOwW+8ts
 YXi1nYn9NgIPe3O+AUp+v3yKD6QWIvsHa8yOX8mOx2/VboTBFtRze6cEWT36ydRBm/ow
 K7bCY48y4Imz0G0LbWo3TRfqGWfiNx0cBEhr1tj9JvWNFoiu3JRmehkXYKC2ina2M12w
 MjxyK8Tp3l1Vj0LYM2RsnzueFXEAOy782UUtgkAy/8M48d+knx0sm0YR6reChvn+1QUm
 PUenb6nr5q0Q7KQhWyiLI1QnB9xPIMQt+5Tffx6BplWmRSE1Ly64KqwWQW+BWxJr0uba
 XF6g==
X-Gm-Message-State: APjAAAWTYFUr7dlW81Ej/zxdjKJRCyvQgojiPJnIxPX5HgxMmQlpie0x
 gC2eAEJ6xOigRr4vWOQvqTn9bq7N/pmldlDhhawFzw64dKG5Be5rsxe7tZmGfyqY5hqv4peDut1
 ylciipgKaB240047An6J7jCuGvpfmdvltqA==
X-Received: by 2002:a37:a8ce:: with SMTP id
 r197mr17291120qke.374.1569247191442; 
 Mon, 23 Sep 2019 06:59:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyzyB1a60cl+6jXMDuajGY7ZKBy6qBhwd1rCHqj2guL5sYzzKUt4czPqrsZBqxQFgz2+CkCug==
X-Received: by 2002:a37:a8ce:: with SMTP id
 r197mr17291071qke.374.1569247191247; 
 Mon, 23 Sep 2019 06:59:51 -0700 (PDT)
Received: from redhat.com (bzq-79-176-40-226.red.bezeqint.net. [79.176.40.226])
 by smtp.gmail.com with ESMTPSA id j2sm4848892qki.15.2019.09.23.06.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2019 06:59:50 -0700 (PDT)
Date: Mon, 23 Sep 2019 09:59:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 0/6] mdev based hardware virtio offloading support
Message-ID: <20190923095820-mutt-send-email-mst@kernel.org>
References: <20190923130331.29324-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190923130331.29324-1-jasowang@redhat.com>
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
Cc: kvm@vger.kernel.org, airlied@linux.ie, joonas.lahtinen@linux.intel.com,
 heiko.carstens@de.ibm.com, dri-devel@lists.freedesktop.org,
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

T24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgMDk6MDM6MjVQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiBIaSBhbGw6Cj4gCj4gVGhlcmUgYXJlIGhhcmR3YXJlIHRoYXQgY2FuIGRvIHZpcnRpbyBk
YXRhcGF0aCBvZmZsb2FkaW5nIHdoaWxlIGhhdmluZwo+IGl0cyBvd24gY29udHJvbCBwYXRoLiBU
aGlzIHBhdGggdHJpZXMgdG8gaW1wbGVtZW50IGEgbWRldiBiYXNlZAo+IHVuaWZpZWQgQVBJIHRv
IHN1cHBvcnQgdXNpbmcga2VybmVsIHZpcnRpbyBkcml2ZXIgdG8gZHJpdmUgdGhvc2UKPiBkZXZp
Y2VzLiBUaGlzIGlzIGRvbmUgYnkgaW50cm9kdWNpbmcgYSBuZXcgbWRldiB0cmFuc3BvcnQgZm9y
IHZpcnRpbwo+ICh2aXJ0aW9fbWRldikgYW5kIHJlZ2lzdGVyIGl0c2VsZiBhcyBhIG5ldyBraW5k
IG9mIG1kZXYgZHJpdmVyLiBUaGVuCj4gaXQgcHJvdmlkZXMgYSB1bmlmaWVkIHdheSBmb3Iga2Vy
bmVsIHZpcnRpbyBkcml2ZXIgdG8gdGFsayB3aXRoIG1kZXYKPiBkZXZpY2UgaW1wbGVtZW50YXRp
b24uCj4gCj4gVGhvdWdoIHRoZSBzZXJpZXMgb25seSBjb250YWlucyBrZXJuZWwgZHJpdmVyIHN1
cHBvcnQsIHRoZSBnb2FsIGlzIHRvCj4gbWFrZSB0aGUgdHJhbnNwb3J0IGdlbmVyaWMgZW5vdWdo
IHRvIHN1cHBvcnQgdXNlcnNwYWNlIGRyaXZlcnMuIFRoaXMKPiBtZWFucyB2aG9zdC1tZGV2WzFd
IGNvdWxkIGJlIGJ1aWx0IG9uIHRvcCBhcyB3ZWxsIGJ5IHJlc3VpbmcgdGhlCj4gdHJhbnNwb3J0
Lgo+IAo+IEEgc2FtcGxlIGRyaXZlciBpcyBhbHNvIGltcGxlbWVudGVkIHdoaWNoIHNpbXVsYXRl
IGEgdmlyaXRvLW5ldAo+IGxvb3BiYWNrIGV0aGVybmV0IGRldmljZSBvbiB0b3Agb2YgdnJpbmdo
ICsgd29ya3F1ZXVlLiBUaGlzIGNvdWxkIGJlCj4gdXNlZCBhcyBhIHJlZmVyZW5jZSBpbXBsZW1l
bnRhdGlvbiBmb3IgcmVhbCBoYXJkd2FyZSBkcml2ZXIuCj4gCj4gQ29uc2lkZXIgbWRldiBmcmFt
ZXdvcmsgb25seSBzdXBwb3J0IFZGSU8gZGV2aWNlIGFuZCBkcml2ZXIgcmlnaHQgbm93LAo+IHRo
aXMgc2VyaWVzIGFsc28gZXh0ZW5kIGl0IHRvIHN1cHBvcnQgb3RoZXIgdHlwZXMuIFRoaXMgaXMg
ZG9uZQo+IHRocm91Z2ggaW50cm9kdWNpbmcgY2xhc3MgaWQgdG8gdGhlIGRldmljZSBhbmQgcGFp
cmluZyBpdCB3aXRoCj4gaWRfdGFsYmUgY2xhaW1lZCBieSB0aGUgZHJpdmVyLiBPbiB0b3AsIHRo
aXMgc2VyaXMgYWxzbyBkZWNvdXBsZQo+IGRldmljZSBzcGVjaWZpYyBwYXJlbnRzIG9wcyBvdXQg
b2YgdGhlIGNvbW1vbiBvbmVzLgo+IAo+IFBrdGdlbiB0ZXN0IHdhcyBkb25lIHdpdGggdmlyaXRv
LW5ldCArIG12bmV0IGxvb3AgYmFjayBkZXZpY2UuCj4gCj4gUGxlYXNlIHJldmlldy4KPiAKPiBb
MV0gaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTkvOS8xNi84NjkKPiAKPiBDaGFuZ2VzIGZyb20g
UkZDLVYyOgo+IC0gc2lsZW50IGNvbXBpbGUgd2FybmluZ3Mgb24gc29tZSBzcGVjaWZpYyBjb25m
aWd1cmF0aW9uCj4gLSB1c2UgdTE2IGluc3RlYWQgdTggZm9yIGNsYXNzIGlkCj4gLSByZXNldmUg
TURFVl9JRF9WSE9TVCBmb3IgZnV0dXJlIHZob3N0LW1kZXYgd29yawo+IC0gaW50cm9kdWNlICJ2
aXJ0aW8iIHR5cGUgZm9yIG12bmV0IGFuZCBtYWtlICJ2aG9zdCIgdHlwZSBmb3IgZnV0dXJlCj4g
ICB3b3JrCj4gLSBhZGQgZW50cmllcyBpbiBNQUlOVEFJTkVSCj4gLSB0d2VhayBhbmQgdHlwb3Mg
Zml4ZXMgaW4gY29tbWl0IGxvZwo+IAo+IENoYW5nZXMgZnJvbSBSRkMtVjE6Cj4gCj4gLSByZW5h
bWUgZGV2aWNlIGlkIHRvIGNsYXNzIGlkCj4gLSBhZGQgZG9jcyBmb3IgY2xhc3MgaWQgYW5kIGRl
dmljZSBzcGVjaWZpYyBvcHMgKGRldmljZV9vcHMpCj4gLSBzcGxpdCBkZXZpY2Vfb3BzIGludG8g
c2VwZXJhdGUgaGVhZGVycwo+IC0gZHJvcCB0aGUgbWRldl9zZXRfZG1hX29wcygpCj4gLSB1c2Ug
ZGV2aWNlX29wcyB0byBpbXBsZW1lbnQgdGhlIHRyYW5zcG9ydCBBUEksIHRoZW4gaXQncyBub3Qg
YSBwYXJ0Cj4gICBvZiBVQVBJIGFueSBtb3JlCj4gLSB1c2UgR0ZQX0FUT01JQyBpbiBtdm5ldCBz
YW1wbGUgZGV2aWNlIGFuZCBvdGhlciB0d2Vha3MKPiAtIHNldF92cmluZ19iYXNlL2dldF92cmlu
Z19iYXNlIHN1cHBvcnQgZm9yIG12bmV0IGRldmljZQo+IAo+IEphc29uIFdhbmcgKDYpOgo+ICAg
bWRldjogY2xhc3MgaWQgc3VwcG9ydAo+ICAgbWRldjogaW50cm9kdWNlIGRldmljZSBzcGVjaWZp
YyBvcHMKPiAgIG1kZXY6IGludHJvZHVjZSB2aXJ0aW8gZGV2aWNlIGFuZCBpdHMgZGV2aWNlIG9w
cwo+ICAgdmlydGlvOiBpbnRyb2R1Y2UgYSBtZGV2IGJhc2VkIHRyYW5zcG9ydAo+ICAgdnJpbmdo
OiBmaXggY29weSBkaXJlY3Rpb24gb2YgdnJpbmdoX2lvdl9wdXNoX2tlcm4oKQo+ICAgZG9jczog
c2FtcGxlIGRyaXZlciB0byBkZW1vbnN0cmF0ZSBob3cgdG8gaW1wbGVtZW50IHZpcnRpby1tZGV2
Cj4gICAgIGZyYW1ld29yawoKClRoYXQncyBwcmV0dHkgY2xlYW4sIHNvIGhvdyBhYm91dCB3ZSBz
dGFydCBieSBqdXN0IG1lcmdpbmcgdGhpcz8KQWxleCBhcmUgeW91IGdvaW5nIHRvIGhhbmRsZSB0
aGlzIHRocm91Z2ggeW91ciBuZXh0IHRyZWU/CklmIHllcywgcGxzIGluY2x1ZGU6CgpBY2tlZC1i
eTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4KCgoKPiAgLi4uL2RyaXZlci1h
cGkvdmZpby1tZWRpYXRlZC1kZXZpY2UucnN0ICAgICAgIHwgIDExICstCj4gIE1BSU5UQUlORVJT
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMyArCj4gIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2d2dC9rdm1ndC5jICAgICAgICAgICAgICB8ICAxNyArLQo+ICBkcml2ZXJzL3Mz
OTAvY2lvL3ZmaW9fY2N3X29wcy5jICAgICAgICAgICAgICAgfCAgMTcgKy0KPiAgZHJpdmVycy9z
MzkwL2NyeXB0by92ZmlvX2FwX29wcy5jICAgICAgICAgICAgIHwgIDE0ICstCj4gIGRyaXZlcnMv
dmZpby9tZGV2L0tjb25maWcgICAgICAgICAgICAgICAgICAgICB8ICAgNyArCj4gIGRyaXZlcnMv
dmZpby9tZGV2L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICB8ICAgMSArCj4gIGRyaXZlcnMv
dmZpby9tZGV2L21kZXZfY29yZS5jICAgICAgICAgICAgICAgICB8ICAyMSArLQo+ICBkcml2ZXJz
L3ZmaW8vbWRldi9tZGV2X2RyaXZlci5jICAgICAgICAgICAgICAgfCAgMTQgKwo+ICBkcml2ZXJz
L3ZmaW8vbWRldi9tZGV2X3ByaXZhdGUuaCAgICAgICAgICAgICAgfCAgIDEgKwo+ICBkcml2ZXJz
L3ZmaW8vbWRldi92ZmlvX21kZXYuYyAgICAgICAgICAgICAgICAgfCAgMzcgKy0KPiAgZHJpdmVy
cy92ZmlvL21kZXYvdmlydGlvX21kZXYuYyAgICAgICAgICAgICAgIHwgNDE2ICsrKysrKysrKysr
Cj4gIGRyaXZlcnMvdmhvc3QvdnJpbmdoLmMgICAgICAgICAgICAgICAgICAgICAgICB8ICAgOCAr
LQo+ICBpbmNsdWRlL2xpbnV4L21kZXYuaCAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNDcg
Ky0KPiAgaW5jbHVkZS9saW51eC9tb2RfZGV2aWNldGFibGUuaCAgICAgICAgICAgICAgIHwgICA4
ICsKPiAgaW5jbHVkZS9saW51eC92ZmlvX21kZXYuaCAgICAgICAgICAgICAgICAgICAgIHwgIDUz
ICsrCj4gIGluY2x1ZGUvbGludXgvdmlydGlvX21kZXYuaCAgICAgICAgICAgICAgICAgICB8IDE0
NCArKysrCj4gIHNhbXBsZXMvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAgNyArCj4gIHNhbXBsZXMvdmZpby1tZGV2L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICB8
ICAgMSArCj4gIHNhbXBsZXMvdmZpby1tZGV2L21ib2Nocy5jICAgICAgICAgICAgICAgICAgICB8
ICAxOSArLQo+ICBzYW1wbGVzL3ZmaW8tbWRldi9tZHB5LmMgICAgICAgICAgICAgICAgICAgICAg
fCAgMTkgKy0KPiAgc2FtcGxlcy92ZmlvLW1kZXYvbXR0eS5jICAgICAgICAgICAgICAgICAgICAg
IHwgIDE3ICstCj4gIHNhbXBsZXMvdmZpby1tZGV2L212bmV0LmMgICAgICAgICAgICAgICAgICAg
ICB8IDY4OCArKysrKysrKysrKysrKysrKysKPiAgMjMgZmlsZXMgY2hhbmdlZCwgMTQ4MSBpbnNl
cnRpb25zKCspLCA4OSBkZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMv
dmZpby9tZGV2L3ZpcnRpb19tZGV2LmMKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGlu
dXgvdmZpb19tZGV2LmgKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvdmlydGlv
X21kZXYuaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgc2FtcGxlcy92ZmlvLW1kZXYvbXZuZXQuYwo+
IAo+IC0tIAo+IDIuMTkuMQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2ludGVsLWd2dC1kZXY=
