Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D97AE2AF9C
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 27 May 2019 09:56:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6294898ED;
	Mon, 27 May 2019 07:56:14 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2850E898FA
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 27 May 2019 07:56:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A54A5F74AB;
 Mon, 27 May 2019 07:56:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-59.ams2.redhat.com
 [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4EF7F1001DCB;
 Mon, 27 May 2019 07:56:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8E87A16E08; Mon, 27 May 2019 09:56:10 +0200 (CEST)
Date: Mon, 27 May 2019 09:56:10 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Zhang, Tina" <tina.zhang@intel.com>
Subject: Re: [RFC PATCH v2 0/3] drm/i915/gvt: Enable vGPU local display
 direct flip
Message-ID: <20190527075610.rkfmhpacfjde2obj@sirius.home.kraxel.org>
References: <1557461728-2831-1-git-send-email-tina.zhang@intel.com>
 <20190521111143.jdlh6ujnayetmlqw@sirius.home.kraxel.org>
 <237F54289DF84E4997F34151298ABEBC8761B311@SHSMSX101.ccr.corp.intel.com>
 <20190521193944.45cgchkcqqsv5jml@sirius.home.kraxel.org>
 <237F54289DF84E4997F34151298ABEBC8761BFC3@SHSMSX101.ccr.corp.intel.com>
 <20190522084933.nwbyyb6bbbg5pgk5@sirius.home.kraxel.org>
 <237F54289DF84E4997F34151298ABEBC8761D5E9@SHSMSX101.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <237F54289DF84E4997F34151298ABEBC8761D5E9@SHSMSX101.ccr.corp.intel.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Mon, 27 May 2019 07:56:12 +0000 (UTC)
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "Kondapally,
 Kalyan" <kalyan.kondapally@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

ICBIaSwKCj4gPiBDYW4geW91IGp1c3QgcHVzaCB5b3VyIGRybSBsZWFzZSBicmFuY2ggc29tZXdo
ZXJlPwoKPiBJIGFwcGxpZWQgb3VyIHdvcmsgYWdhaW5zdCB5b3VyIGRybSB1aSB0aXAuIFlvdSBj
YW4gcnVuIGl0IHdpdGggeG9yZwo+IG5vdy4gV2UgdHJpZWQgdHdvIFZNcyB3aXRoIHR3byBkaXNw
bGF5IG1vbml0b3JzIGFuZCBpdCBjYW4gd29yayBqdXN0Cj4gYXMgZXhwZWN0ZWQuICBCVFcsIHlv
dSBtaWdodCBuZWVkIHRvIHVwZGF0ZSBzb21lIHBhY2thZ2VzIHRvIHRoZQo+IGxhdGVzdCB2ZXJz
aW9uLCBlLmcuIHhvcmcsIGluIG9yZGVyIHRvIHVzZSB0aGUgZHJtIGxlYXNlLiBJZiB5b3UgaGF2
ZQo+IGFueSBwcm9ibGVtLCBwbGVhc2UgbGV0IG1lIGtub3cuCgpDcmVhdGluZyBhIGxlYXNlIGRv
ZXNuJ3Qgd29yayBoZXJlLgoKa2VybmVsIGlzIDUuMS41LiAgeG9yZyBzZXJ2ZXIgaXMgaXMgMS4y
MC40LCByZXBvcnRpbmcgeHJhbmRyIHZlcnNpb24KMS42LiAgV2hpY2ggc2hvdWxkIGJlIG5ldyBl
bm91Z2guCgpEbyBJIGhhdmUgdG8gc3BlY2lmaWNhbGx5IGVuYWJsZSB0aGlzIHNvbWV3aGVyZT8K
CnRoYW5rcywKICBHZXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2ludGVsLWd2dC1kZXY=
