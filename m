Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C057B57C11
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 27 Jun 2019 08:22:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 116DC6E5AD;
	Thu, 27 Jun 2019 06:22:37 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 093F06E5AD
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 27 Jun 2019 06:22:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6CEF1356CD;
 Thu, 27 Jun 2019 06:22:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC06B5D719;
 Thu, 27 Jun 2019 06:22:32 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EB94016E08; Thu, 27 Jun 2019 08:22:31 +0200 (CEST)
Date: Thu, 27 Jun 2019 08:22:31 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Tina Zhang <tina.zhang@intel.com>
Subject: Re: [RFC PATCH v3 0/4] Deliver vGPU display vblank event to userspace
Message-ID: <20190627062231.57tywityo6uyhmyd@sirius.home.kraxel.org>
References: <20190627033802.1663-1-tina.zhang@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190627033802.1663-1-tina.zhang@intel.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Thu, 27 Jun 2019 06:22:35 +0000 (UTC)
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
Cc: kevin.tian@intel.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 zhenyuw@linux.intel.com, hang.yuan@intel.com, alex.williamson@redhat.com,
 zhiyuan.lv@intel.com, intel-gvt-dev@lists.freedesktop.org,
 zhi.a.wang@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

ICBIaSwKCj4gSW5zdGVhZCBvZiBkZWxpdmVyaW5nIHBhZ2UgZmxpcCBldmVudHMsIHdlIGNob29z
ZSB0byBwb3N0IGRpc3BsYXkgdmJsYW5rCj4gZXZlbnQuIEhhbmRsaW5nIHBhZ2UgZmxpcCBldmVu
dHMgZm9yIGJvdGggcHJpbWFyeSBwbGFuZSBhbmQgY3Vyc29yIHBsYW5lCj4gbWF5IG1ha2UgdXNl
ciBzcGFjZSBxdWl0ZSBidXN5LCBhbHRob3VnaCB3ZSBoYXZlIHRoZSBtYXNrL3VubWFzayBtZWNo
YW5zaW0KPiBmb3IgbWl0aWdhdGlvbi4gQmVzaWRlcywgdGhlcmUgYXJlIHNvbWUgY2FzZXMgdGhh
dCBndWVzdCBhcHAgb25seSB1c2VzCj4gb25lIGZyYW1lYnVmZmVyIGZvciBib3RoIGRyYXdpbmcg
YW5kIGRpc3BsYXkuIEluIHN1Y2ggY2FzZSwgZ3Vlc3QgT1Mgd29uJ3QKPiBkbyB0aGUgcGxhbmUg
cGFnZSBmbGlwIHdoZW4gdGhlIGZyYW1lYnVmZmVyIGlzIHVwZGF0ZWQsIHRodXMgdGhlIHVzZXIK
PiBsYW5kIHdvbid0IGJlIG5vdGlmaWVkIGFib3V0IHRoZSB1cGRhdGVkIGZyYW1lYnVmZmVyLgoK
V2hhdCBoYXBwZW5zIHdoZW4gdGhlIGd1ZXN0IGlzIGlkbGUgYW5kIGRvZXNuJ3QgZHJhdyBhbnl0
aGluZyB0byB0aGUKZnJhbWVidWZmZXI/CgpjaGVlcnMsCiAgR2VyZAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxp
c3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
