Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BA6BED46
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 26 Sep 2019 10:21:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF0E6EE60;
	Thu, 26 Sep 2019 08:21:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D6396EE60
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 26 Sep 2019 08:21:46 +0000 (UTC)
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CBEF72026F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 26 Sep 2019 08:21:45 +0000 (UTC)
Received: by mail-qk1-f199.google.com with SMTP id n135so1581199qke.23
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 26 Sep 2019 01:21:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hhU99cCB7XpvTN2fcxp8EjIrPOBFerG9ZEfadnPits4=;
 b=GiiybhEIAcjP61HpSN1fFQDrSS4q4VaBn0vUVaVb8d0Ym5ZcZAAperDLnvi+t0GuAP
 RuAqiUFFkb4oGvQHNWotMZRRzevkePcD50EMwVY4KIzeMFIFnpWnDirZcMpguBQlFGG/
 Wy/hPc04Ft15AirztF1LF02M0hgq/wi9ZvrmQKAwpIoJc8ZjYmskKR8PNbNYn+s8EOz7
 rSwxRbsnp/GraNeFuXdIOqGawEqzZi3CoEncnSgWeFCkO+17bh5mOl4QATPEwJcQ3oOT
 TdqktYnx8ZL4F+sT5UICOuUdH0V0aBnwUJPMqccnFCM7V11kz8cue/mdxMXsLMr3VY+U
 AIMQ==
X-Gm-Message-State: APjAAAXd5Nc5TMiG6/LiZNhbJQdk9w1FkPv0S32HLEnLESL6Yt2CWOnE
 mCLpPw7olpa+/ugT9gYmtogALvWgoGR9p+Q4pZ6eDSw52f9Sr7om1KX7RQFJ/76IFhxmJM+xVX3
 UyZa4rFu3zwj6X/mngUeazh3xVeSf5w3eiQ==
X-Received: by 2002:a37:d84:: with SMTP id 126mr1845508qkn.407.1569486105090; 
 Thu, 26 Sep 2019 01:21:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxQ1sVd1RtjNN4RR2UjNtY+bztkqyrSkS/Hzvn/M5fL9tuYPUVoOD4Dv1RZQ64O49sodkiqzw==
X-Received: by 2002:a37:d84:: with SMTP id 126mr1845463qkn.407.1569486104789; 
 Thu, 26 Sep 2019 01:21:44 -0700 (PDT)
Received: from redhat.com (bzq-79-176-40-226.red.bezeqint.net. [79.176.40.226])
 by smtp.gmail.com with ESMTPSA id 199sm632146qkk.112.2019.09.26.01.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 01:21:43 -0700 (PDT)
Date: Thu, 26 Sep 2019 04:21:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V2 6/8] mdev: introduce virtio device and its device ops
Message-ID: <20190926042102-mutt-send-email-mst@kernel.org>
References: <20190924135332.14160-1-jasowang@redhat.com>
 <20190924135332.14160-7-jasowang@redhat.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D58F7DA@SHSMSX104.ccr.corp.intel.com>
 <2210d23d-38e4-e654-e53d-7867348de86a@redhat.com>
 <20190925092044-mutt-send-email-mst@kernel.org>
 <eb7c76b5-2938-2e73-d847-b174a289c5c9@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eb7c76b5-2938-2e73-d847-b174a289c5c9@redhat.com>
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
 "airlied@linux.ie" <airlied@linux.ie>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "sebott@linux.ibm.com" <sebott@linux.ibm.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>, "Liang,
 Cunming" <cunming.liang@intel.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>,
 "Tian, Kevin" <kevin.tian@intel.com>, "idos@mellanox.com" <idos@mellanox.com>,
 "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>, "Wang,
 Xiao W" <xiao.w.wang@intel.com>, "freude@linux.ibm.com" <freude@linux.ibm.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "parav@mellanox.com" <parav@mellanox.com>, "Wang,
 Zhihong" <zhihong.wang@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "oberpar@linux.ibm.com" <oberpar@linux.ibm.com>, "Bie,
 Tiwei" <tiwei.bie@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "Zhu, Lingshan" <lingshan.zhu@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMTI6MDQ6NDZQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiA+ID4gPiBJJ20gbm90IHN1cmUgaG93IHN0YWJsZSBhYm92ZSBvcHMgYXJlLgo+ID4gPiBJ
dCdzIHRoZSBrZXJuZWwgaW50ZXJuYWwgQVBJLCBzbyB0aGVyZSdzIG5vIHN0cmljdCByZXF1aXJl
bWVudCBmb3IgdGhpcy4gV2UKPiA+ID4gd2lsbCBleHBvcnQgYSB2ZXJzaW9uIHZhbHVlIGZvciB1
c2Vyc3BhY2UgZm9yIGNvbXBhdGliaWxpdHkuCj4gPiBHaXZlbiBpdCdzIHRpZWQgdG8gdmlydGlv
IHdlIHByb2JhYmx5IHdhbnQga2VybmVsK3VzZXJzcGFjZQo+ID4gZmVhdHVyZSBiaXRzPwo+IAo+
IAo+IFllcywgdGhlbiBJIHRoaW5rIHdlIGNvdWxkIHByb2JhYmx5IGhhdmUgYSB2ZXJzaW9uIGZp
ZWxkIGluc2lkZSBlLmcKPiBkZXZpY2Vfb3BzIHN0cnVjdHVyZS4gVGhlbiBpdCBjb3VsZCBiZSBm
ZXRjaGVkIGZyb20gYm90aCBrZXJuZWwgYW5kCj4gdXNlcnNwYWNlIGRyaXZlci4KPiAKPiBUaGFu
a3MKPiAKCgpteSBwb2ludCB3YXMgZmVhdHVyZSBiaXRzIG5vdCBhIHZlcnNpb24gbnVtYmVyLgoK
PiA+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRl
bC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2
dC1kZXY=
