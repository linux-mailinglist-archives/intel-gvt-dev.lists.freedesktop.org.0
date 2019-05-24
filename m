Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C2629836
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 24 May 2019 14:43:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 525406E102;
	Fri, 24 May 2019 12:43:25 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D226E102
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 24 May 2019 12:43:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 69C173004419;
 Fri, 24 May 2019 12:43:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-101.ams2.redhat.com
 [10.36.116.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 263D061354;
 Fri, 24 May 2019 12:43:15 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2B8A817470; Fri, 24 May 2019 14:43:15 +0200 (CEST)
Date: Fri, 24 May 2019 14:43:15 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Zhang, Tina" <tina.zhang@intel.com>
Subject: Re: [RFC PATCH v2 0/3] drm/i915/gvt: Enable vGPU local display
 direct flip
Message-ID: <20190524124315.2zatmgbryk3dvfda@sirius.home.kraxel.org>
References: <1557461728-2831-1-git-send-email-tina.zhang@intel.com>
 <20190521111143.jdlh6ujnayetmlqw@sirius.home.kraxel.org>
 <237F54289DF84E4997F34151298ABEBC8761B311@SHSMSX101.ccr.corp.intel.com>
 <20190521193944.45cgchkcqqsv5jml@sirius.home.kraxel.org>
 <237F54289DF84E4997F34151298ABEBC8761BFC3@SHSMSX101.ccr.corp.intel.com>
 <20190522084933.nwbyyb6bbbg5pgk5@sirius.home.kraxel.org>
 <237F54289DF84E4997F34151298ABEBC8761D5E9@SHSMSX101.ccr.corp.intel.com>
 <20190523104948.i6kzvmpiziopsng2@sirius.home.kraxel.org>
 <237F54289DF84E4997F34151298ABEBC8761EC48@SHSMSX101.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <237F54289DF84E4997F34151298ABEBC8761EC48@SHSMSX101.ccr.corp.intel.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Fri, 24 May 2019 12:43:23 +0000 (UTC)
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
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "Kondapally, Kalyan" <kalyan.kondapally@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

ICBIaSwKCj4gPiBXaGVuIHJ1bm5pbmcgb24gYSBkcm0tbGVhc2UgdGhhdCB3b3VsZCBiZSBhIGJp
dCBydWRlLiAgQWxzbyBJIGRvbid0IHRoaW5rCj4gPiBsb2dpbmQgd2lsbCBoYW5kIG91dCBpbnB1
dCBmaWxlIGhhbmRsZXMgaW4gdGhhdCBjYXNlLiAgSW4gY2FzZSB0aGVyZSBhcmUKPiA+IGRlZGlj
YXRlZCBpbnB1dCBkZXZpY2VzIGZvciB0aGUgZ3Vlc3QgeW91IGNhbiB1c2UgaW5wdXQtbGludXgg
b3IgdXNiIHBhc3MtCj4gPiB0aHJvdWdoLiAgSWYgbm90LCB0aGVuLCBobW0sIG5vIGlkZWEuCgo+
IFdlIHNlZSBtb3JlIGFuZCBtb3JlIHBlb3BsZSB3b3VsZCBsaWtlIHRvIHVzZSBndnQtZyB0byBi
dWlsZCB0aGUKPiBpbnRlbGxpZ2VudCBkZXNrdG9wIHZpcnR1YWxpemF0aW9uIChJRFYpIHByb2R1
Y3RzLCB3aGVyZSAzIFZNcyBhcmUKPiBydW5uaW5nIHdpdGggZWFjaCBvbmUgaGF2aW5nIGEgZGVk
aWNhdGVkIG1vbml0b3IsIGEgc2V0IG9mIFVTQgo+IGtleWJvYXJkL21vdXNlIGFuZCBvbmUgYXVk
aW8gY2FyZC4gU2luY2UgdGhlIGlucHV0cyBwcm9ibGVtIGNhbiBiZQo+IHNvbHZlZCBieSBwYXNz
aW5nIHRocm91Z2ggdGhlIGlucHV0IGRldmljZXMsIHRoZSBtb3N0IGNoYWxsZW5nZSB3b3JrCj4g
aXMgaG93IHRvIGFzc2lnbiB0aGUgbW9uaXRvcnMuCgpXZWxsLCB5ZXMsIHRoYXQnbGwgd29yayBm
aW5lLiAgV2l0aCBkZWRpY2F0ZWQgaW5wdXQgZGV2aWNlcwp1c2ItcGFzc3Rocm91Z2ggd2lsbCBk
byB0aGUgdHJpY2suCgpGb3IgdGhhdCB1c2UgY2FzZSBoYXZpbmcgZHJtLWxlYXNlIHN1cHBvcnQg
aW4gc3lzdGVtZC1sb2dpbmQgd291bGQKbWFrZSBhbG90IG9mIHNlbnNlLiAgbG9naW5kIGFscmVh
ZHkgaGFzIG11bHRpc2VhdCBzdXBwb3J0LCBidXQgb25seSB3aXRoCmRpZmZlcmVudCBkaXNwbGF5
IGRldmljZXMuICBXaXRoIGRybSBsZWFzZXMgaXQgc2hvdWxkIGJlIHBvc3NpYmxlIHRvCmV4dGVu
ZCB0aGF0IHRvIGFsc28gY292ZXIgZGlmZmVyZW50IG1vbml0b3JzIG9uIGEgc2luZ2xlIGRpc3Bs
YXkgZGV2aWNlLgoKPiBBbmQgYW5vdGhlciB3b3JrLCBhcyB3ZSBkaXNjdXNzZWQsIGNhbiBpbXBy
b3ZlIHRoZSB1c2VyIGV4cGVyaWVuY2UgaXMKPiB0byBkZWxpdmVyIHRoZSBwYWdlIGZsaXAgdG8g
dXNlciBzcGFjZSB3aGVyZSBxZW11IHVpIGNvdWxkIGxldmVyYWdlIHRvCj4gY2FsbCB0aGUgdWkg
cmVmcmVzaC4gCgo+IEhlcmUgaXMgdGhlIFJGQyB2ZXJzaW9uOiBodHRwczovL2dpdGh1Yi5jb20v
aW50ZWwvZ3Z0LWxpbnV4L2NvbW1pdC85ZWI1MGYwMzJkM2ViZWE4ZDhiZmE2MmUwNTQ2ZGJiOGFm
M2I4NGQ5Cj4gQ2FuIHlvdSBzaGFyZSB5b3VyIGNvbW1lbnRzIGFib3V0IGl0PwoKSSB3b3VsZCBu
YW1lIHRoZSBpb2N0bCBWRklPX0RFVklDRV9TRVRfR0ZYX0ZMSVBfRVZFTlRGRC4gIEFsc28gSSB0
aGluawp3ZSBkb24ndCBuZWVkIGEgc2VwYXJhdGUgcHJvYmUgY2FsbC4gIFVzZXJzcGFjZSBjYW4g
anVzdCB0cnkgdG8gc2V0dXAKdGhlIGV2ZW50ZmQgYW5kIGZhbGxiYWNrIHRvIHRpbWVyIHBvbGxp
bmcgaW4gY2FzZSBpdCBmYWlscy4KRG9jdW1lbnRhdGlvbiBzaG91bGQgYmUgbW9yZSB2ZXJib3Nl
IHRvby4gIE90aHdlcndpc2UgaXQgbG9va3MgZmluZSB0bwptZSwgSSdkIHN1Z2dlc3QgdG8gc2Vu
ZCB0aGUgdmZpbyBoZWFkZXIgcGF0Y2ggdG8gdGhlIHZmaW8gbGlzdCBmb3IKcmV2aWV3LgoKY2hl
ZXJzLAogIEdlcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aW50ZWwtZ3Z0LWRldg==
