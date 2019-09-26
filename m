Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FA7BF628
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 26 Sep 2019 17:47:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D8056ED9F;
	Thu, 26 Sep 2019 15:47:11 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D9706EDA0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 26 Sep 2019 15:47:10 +0000 (UTC)
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AC0C8C05AA64
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 26 Sep 2019 15:47:09 +0000 (UTC)
Received: by mail-qk1-f198.google.com with SMTP id 10so2839590qka.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 26 Sep 2019 08:47:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1yylcDQZ8r+5S5Gz7KG/29d/sKE5Q6ALcFR6qx+xQGA=;
 b=CGdI1meaVoLCChENvllwpVQ6MvfTM7PcoJb1v/NKnEsbz+bt1mmBQFr2OX3A3szQkW
 OxuP7kmKWc1SUuKSaCs6sQMwT4B2JmVbnUNXA73rPP/76GFj8AIzXf+mG3xdnCctcyxA
 waOsGFeTx31YakJjBLmpLYtJGQaPITWn2D1dTUmTidIUtw0xoUV6wx+Iz3he2AxJQoO7
 hfUFiJcw1obaInY7fYWWPoLH2mOSAdL84OworKJYGcK9+zIE0HhL9ufqTOCC7zD1m4jC
 yDPRFHy4KbeDBdFXCydouZlEcYRkA12RA0w0ysa0hI41tbif38Wvip/gwnp0RdD7QDFF
 lr4Q==
X-Gm-Message-State: APjAAAW/YA/U8iIlNgk2YZYMJAdrD39alxRBmY/3YYiLDfFQG4i5h9V0
 CdX7YFOF89IgooRRbhy/Cdbp9kWb4nZeyY2QMTIRBBH2KYYnRCbcNDVDPPbkvz+HVrgxIOb9NRf
 aA4xyIq9uTsJDjTFEdc5q6MspyRWo/WmiwQ==
X-Received: by 2002:aed:2ce7:: with SMTP id g94mr4560930qtd.255.1569512828836; 
 Thu, 26 Sep 2019 08:47:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxXMLxPwOJSKW86VAhg+FA92BB2rFSPpVANRc+kAYWWIKkKpR3hJkzdDy+E5U7AhQ5WZnHHfA==
X-Received: by 2002:aed:2ce7:: with SMTP id g94mr4560904qtd.255.1569512828546; 
 Thu, 26 Sep 2019 08:47:08 -0700 (PDT)
Received: from redhat.com (bzq-79-176-40-226.red.bezeqint.net. [79.176.40.226])
 by smtp.gmail.com with ESMTPSA id a4sm1354995qkf.91.2019.09.26.08.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 08:47:07 -0700 (PDT)
Date: Thu, 26 Sep 2019 11:46:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH V2 5/8] mdev: introduce device specific ops
Message-ID: <20190926113958-mutt-send-email-mst@kernel.org>
References: <20190924135332.14160-1-jasowang@redhat.com>
 <20190924135332.14160-6-jasowang@redhat.com>
 <20190924170638.064d85f7@x1.home>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D58F754@SHSMSX104.ccr.corp.intel.com>
 <CAJPjb1+i7jb0aVfr=7CDuUBpeo_w3wAfTrnmuLVJ-h+qOV+1hw@mail.gmail.com>
 <20190925103028.1f2edf03@x1.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190925103028.1f2edf03@x1.home>
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
Cc: "christophe.de.dinechin@gmail.com" <christophe.de.dinechin@gmail.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>, Jason Wang <jasowang@redhat.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 Rob Miller <rob.miller@broadcom.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "sebott@linux.ibm.com" <sebott@linux.ibm.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, "Tian, Kevin" <kevin.tian@intel.com>,
 "idos@mellanox.com" <idos@mellanox.com>,
 "gor@linux.ibm.com" <gor@linux.ibm.com>, "Liang,
 Cunming" <cunming.liang@intel.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>, "Wang,
 Xiao W" <xiao.w.wang@intel.com>, "freude@linux.ibm.com" <freude@linux.ibm.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "parav@mellanox.com" <parav@mellanox.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Zhu, Lingshan" <lingshan.zhu@intel.com>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>, "Bie,
 Tiwei" <tiwei.bie@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "oberpar@linux.ibm.com" <oberpar@linux.ibm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "Wang, Zhihong" <zhihong.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgMTA6MzA6MjhBTSAtMDYwMCwgQWxleCBXaWxsaWFtc29u
IHdyb3RlOgo+IE9uIFdlZCwgMjUgU2VwIDIwMTkgMTA6MTE6MDAgLTA0MDAKPiBSb2IgTWlsbGVy
IDxyb2IubWlsbGVyQGJyb2FkY29tLmNvbT4gd3JvdGU6Cj4gPiA+ID4gT24gVHVlLCAyNCBTZXAg
MjAxOSAyMTo1MzoyOSArMDgwMAo+ID4gPiA+IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5j
b20+IHdyb3RlOgo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmZpby9tZGV2L3ZmaW9f
bWRldi5jICAKPiA+ID4gPiBiL2RyaXZlcnMvdmZpby9tZGV2L3ZmaW9fbWRldi5jICAKPiA+ID4g
PiA+IGluZGV4IDg5MWNmODNhMmQ5YS4uOTVlZmEwNTQ0NDJmIDEwMDY0NAo+ID4gPiA+ID4gLS0t
IGEvZHJpdmVycy92ZmlvL21kZXYvdmZpb19tZGV2LmMKPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMv
dmZpby9tZGV2L3ZmaW9fbWRldi5jCj4gPiA+ID4gPiBAQCAtMTQsNiArMTQsNyBAQAo+ID4gPiA+
ID4gICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+Cj4gPiA+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L3Zm
aW8uaD4KPiA+ID4gPiA+ICAjaW5jbHVkZSA8bGludXgvbWRldi5oPgo+ID4gPiA+ID4gKyNpbmNs
dWRlIDxsaW51eC92ZmlvX21kZXYuaD4KPiA+ID4gPiA+Cj4gPiA+ID4gPiAgI2luY2x1ZGUgIm1k
ZXZfcHJpdmF0ZS5oIgo+ID4gPiA+ID4KPiA+ID4gPiA+IEBAIC0yNCwxNiArMjUsMTYgQEAKPiA+
ID4gPiA+ICBzdGF0aWMgaW50IHZmaW9fbWRldl9vcGVuKHZvaWQgKmRldmljZV9kYXRhKQo+ID4g
PiA+ID4gIHsKPiA+ID4gPiA+ICAgICBzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYgPSBkZXZpY2Vf
ZGF0YTsKPiA+ID4gPiA+IC0gICBzdHJ1Y3QgbWRldl9wYXJlbnQgKnBhcmVudCA9IG1kZXYtPnBh
cmVudDsKPiA+ID4gPiA+ICsgICBjb25zdCBzdHJ1Y3QgdmZpb19tZGV2X2RldmljZV9vcHMgKm9w
cyA9ICAKPiA+ID4gPiBtZGV2X2dldF9kZXZfb3BzKG1kZXYpOyAgCj4gPiA+ID4gPiAgICAgaW50
IHJldDsKPiA+ID4gPiA+Cj4gPiA+ID4gPiAtICAgaWYgKHVubGlrZWx5KCFwYXJlbnQtPm9wcy0+
b3BlbikpCj4gPiA+ID4gPiArICAgaWYgKHVubGlrZWx5KCFvcHMtPm9wZW4pKQo+ID4gPiA+ID4g
ICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPiA+ID4gPgo+ID4gPiA+ID4gICAgIGlmICgh
dHJ5X21vZHVsZV9nZXQoVEhJU19NT0RVTEUpKQo+ID4gPiA+ID4gICAgICAgICAgICAgcmV0dXJu
IC1FTk9ERVY7ICAKPiA+ID4gIAo+ID4gCj4gPiBSSk0+XSBNeSB1bmRlcnN0YW5kaW5nIGxhdGVs
eSBpcyB0aGF0IHRoaXMgY2FsbCB0byAgCj4gPiB0cnlfbW9kdWxlX2dldChUSElTX01PRFVMRSkg
aXMgbm8gbG9uZ2VyIG5lZWRlZCBhcyBpcyBjb25zaWRlcmVkIGFzIGEKPiA+IGxhdGVudCBidWcu
Cj4gPiBRdW90ZSBmcm9tCj4gPiBodHRwczovL3N0YWNrb3ZlcmZsb3cuY29tL3F1ZXN0aW9ucy8x
NzQxNDE1L2xpbnV4LWtlcm5lbC1tb2R1bGVzLXdoZW4tdG8tdXNlLXRyeS1tb2R1bGUtZ2V0LW1v
ZHVsZS1wdXQKPiA+ICA6Cj4gPiBUaGVyZSBhcmUgYSBudW1iZXIgb2YgdXNlcyBvZiB0cnlfbW9k
dWxlX2dldChUSElTX01PRFVMRSkgaW4gdGhlIGtlcm5lbAo+ID4gc291cmNlIGJ1dCBtb3N0IGlm
IG5vdCBhbGwgb2YgdGhlbSBhcmUgbGF0ZW50IGJ1Z3MgdGhhdCBzaG91bGQgYmUgY2xlYW5lZAo+
ID4gdXAuCj4gCj4gVGhpcyB1c2Ugc2VlbXMgdG8gZmFsbCBleGFjdGx5IGludG8gdGhlIGNhc2Ug
d2hlcmUgaXQgaXMgbmVjZXNzYXJ5LCB0aGUKPiBvcGVuIGhlcmUgaXMgbm90IGEgZGlyZWN0IFZG
UyBjYWxsLCBpdCdzIGFuIGludGVybmFsIGludGVyZmFjZSBiZXR3ZWVuCj4gbW9kdWxlcy4gIFRo
ZSB1c2VyIGlzIGludGVyYWN0aW5nIHdpdGggZmlsZXN5c3RlbSBvYmplY3RzIGZyb20gdGhlIHZm
aW8KPiBtb2R1bGUgYW5kIHRoZSBtb2R1bGUgcmVmZXJlbmNlIHdlJ3JlIHRyeWluZyB0byBhY3F1
aXJlIGhlcmUgaXMgdG8gdGhlCj4gdmZpby1tZGV2IG1vZHVsZS4gIFRoYW5rcywKPiAKPiBBbGV4
CgoKSSB0aGluayB0aGUgbGF0ZW50IGJ1ZyByZWZlcnMgbm90IHRvIG1vZHVsZSBnZXQgcGVyIHNl
LApidXQgdG8gdGhlIG1vZHVsZV9wdXQgdGllZCB0byBpdC4gRS5nLjoKCiBzdGF0aWMgdm9pZCB2
ZmlvX21kZXZfcmVsZWFzZSh2b2lkICpkZXZpY2VfZGF0YSkKIHsKICAgICAgICBzdHJ1Y3QgbWRl
dl9kZXZpY2UgKm1kZXYgPSBkZXZpY2VfZGF0YTsKICAgICAgICBzdHJ1Y3QgbWRldl9wYXJlbnQg
KnBhcmVudCA9IG1kZXYtPnBhcmVudDsKCiAgICAgICAgaWYgKGxpa2VseShwYXJlbnQtPm9wcy0+
cmVsZWFzZSkpCiAgICAgICAgICAgICAgICBwYXJlbnQtPm9wcy0+cmVsZWFzZShtZGV2KTsKCiAg
ICAgICAgbW9kdWxlX3B1dChUSElTX01PRFVMRSk7CgpEb2VzIGFueXRoaW5nIHByZXZlbnQgdGhl
IG1vZHVsZSBmcm9tIHVubG9hZGluZyBhdCB0aGlzIHBvaW50PwppZiBub3QgdGhlbiAuLi4KCgog
fQoKaXQgbG9va3MgbGlrZSB0aGUgaW1wbGljaXQgcmV0dXJuICh3aXRoIGluc3RydWN0aW9ucyBm
b3IgYXJndW1lbnQgcG9wCmFuZCBmdW5jdHVvbiByZXR1cm4pIGhlcmUgY2FuIGdldCBvdmVyd3Jp
dHRlbiBvbiBtb2R1bGUKdW5sb2FkLCBjYXVzaW5nIGEgY3Jhc2ggd2hlbiBleGVjdXRlZC4KCklP
VyB0aGVyZSdzIGdlbmVyYWxseSBubyB3YXkgZm9yIG1vZHVsZSB0byBrZWVwIGEgcmVmZXJlbmNl
CnRvIGl0c2VsZjogaXQgY2FuIHRha2UgYSByZWZlcmVuY2UgYnV0IGl0IG5lZWRzIHNvbWVvbmUg
ZWxzZQp0byBrZWVwIGl0IGFuZCBwdXQuCgoKLS0gCk1TVApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRl
bC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
