Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2F65806F
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 27 Jun 2019 12:31:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D30DA6E126;
	Thu, 27 Jun 2019 10:31:38 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A9AF6E126
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 27 Jun 2019 10:31:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BFEE43082E06;
 Thu, 27 Jun 2019 10:31:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2BB685C1B4;
 Thu, 27 Jun 2019 10:31:34 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5DDE011AAF; Thu, 27 Jun 2019 12:31:33 +0200 (CEST)
Date: Thu, 27 Jun 2019 12:31:33 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Zhang, Tina" <tina.zhang@intel.com>
Subject: Re: [RFC PATCH v3 0/4] Deliver vGPU display vblank event to userspace
Message-ID: <20190627103133.6ekdwazggi5j5lcl@sirius.home.kraxel.org>
References: <20190627033802.1663-1-tina.zhang@intel.com>
 <20190627062231.57tywityo6uyhmyd@sirius.home.kraxel.org>
 <237F54289DF84E4997F34151298ABEBC876835E5@SHSMSX101.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <237F54289DF84E4997F34151298ABEBC876835E5@SHSMSX101.ccr.corp.intel.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Thu, 27 Jun 2019 10:31:36 +0000 (UTC)
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

PiA+ICAgSGksCj4gPiAKPiA+ID4gSW5zdGVhZCBvZiBkZWxpdmVyaW5nIHBhZ2UgZmxpcCBldmVu
dHMsIHdlIGNob29zZSB0byBwb3N0IGRpc3BsYXkKPiA+ID4gdmJsYW5rIGV2ZW50LiBIYW5kbGlu
ZyBwYWdlIGZsaXAgZXZlbnRzIGZvciBib3RoIHByaW1hcnkgcGxhbmUgYW5kCj4gPiA+IGN1cnNv
ciBwbGFuZSBtYXkgbWFrZSB1c2VyIHNwYWNlIHF1aXRlIGJ1c3ksIGFsdGhvdWdoIHdlIGhhdmUg
dGhlCj4gPiA+IG1hc2svdW5tYXNrIG1lY2hhbnNpbSBmb3IgbWl0aWdhdGlvbi4gQmVzaWRlcywg
dGhlcmUgYXJlIHNvbWUgY2FzZXMKPiA+ID4gdGhhdCBndWVzdCBhcHAgb25seSB1c2VzIG9uZSBm
cmFtZWJ1ZmZlciBmb3IgYm90aCBkcmF3aW5nIGFuZCBkaXNwbGF5Lgo+ID4gPiBJbiBzdWNoIGNh
c2UsIGd1ZXN0IE9TIHdvbid0IGRvIHRoZSBwbGFuZSBwYWdlIGZsaXAgd2hlbiB0aGUKPiA+ID4g
ZnJhbWVidWZmZXIgaXMgdXBkYXRlZCwgdGh1cyB0aGUgdXNlciBsYW5kIHdvbid0IGJlIG5vdGlm
aWVkIGFib3V0IHRoZQo+ID4gdXBkYXRlZCBmcmFtZWJ1ZmZlci4KPiA+IAo+ID4gV2hhdCBoYXBw
ZW5zIHdoZW4gdGhlIGd1ZXN0IGlzIGlkbGUgYW5kIGRvZXNuJ3QgZHJhdyBhbnl0aGluZyB0byB0
aGUKPiA+IGZyYW1lYnVmZmVyPwo+IFRoZSB2YmxhbmsgZXZlbnQgd2lsbCBiZSBkZWxpdmVyZWQg
dG8gdXNlcnNwYWNlIGFzIHdlbGwsIHVubGVzcyBndWVzdCBPUyBkaXNhYmxlIHRoZSBwaXBlLgo+
IERvZXMgaXQgbWFrZSBzZW5zZSB0byB2ZmlvL2Rpc3BsYXk/CgpHZXR0aW5nIG5vdGlmaWVkIG9u
bHkgaW4gY2FzZSB0aGVyZSBhcmUgYWN0dWFsIGRpc3BsYXkgdXBkYXRlcyB3b3VsZCBiZQphIG5p
Y2Ugb3B0aW1pemF0aW9uLCBhc3N1bWluZyB0aGUgaGFyZHdhcmUgaXMgYWJsZSB0byBkbyB0aGF0
LiAgSWYgdGhlCmd1ZXN0IHBhZ2VmbGlwcyB0aGlzIGlzIG9idmlvdXNseSB0cml2aWFsLiAgTm90
IHN1cmUgdGhpcyBpcyBwb3NzaWJsZSBpbgpjYXNlIHRoZSBndWVzdCByZW5kZXJzIGRpcmVjdGx5
IHRvIHRoZSBmcm9udGJ1ZmZlci4KCldoYXQgZXhhY3RseSBoYXBwZW5zIHdoZW4gdGhlIGd1ZXN0
IE9TIGRpc2FibGVzIHRoZSBwaXBlPyAgSXMgYSB2YmxhbmsKZXZlbnQgZGVsaXZlcmVkIGF0IGxl
YXN0IG9uY2U/ICBUaGF0IHdvdWxkIGJlIHZlcnkgdXNlZnVsIGJlY2F1c2UgaXQKd2lsbCBiZSBw
b3NzaWJsZSBmb3IgdXNlcnNwYWNlIHRvIHN0b3AgcG9sbGluZyBhbHRvZ2V0aGVyIHdpdGhvdXQK
bWlzc2luZyB0aGUgImd1ZXN0IGRpc2FibGVkIHBpcGUiIGV2ZW50LgoKY2hlZXJzLAogIEdlcmQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2
dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRl
dg==
