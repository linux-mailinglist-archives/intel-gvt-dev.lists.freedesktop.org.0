Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EB759396
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 28 Jun 2019 07:44:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A65E6E851;
	Fri, 28 Jun 2019 05:44:00 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF16D6E851
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 28 Jun 2019 05:43:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 605775AFE9;
 Fri, 28 Jun 2019 05:43:58 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 93C796012E;
 Fri, 28 Jun 2019 05:43:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C0C3D16E05; Fri, 28 Jun 2019 07:43:46 +0200 (CEST)
Date: Fri, 28 Jun 2019 07:43:46 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [RFC PATCH v3 0/4] Deliver vGPU display vblank event to userspace
Message-ID: <20190628054346.3uc3k4c4cffrqcy3@sirius.home.kraxel.org>
References: <20190627033802.1663-1-tina.zhang@intel.com>
 <20190627062231.57tywityo6uyhmyd@sirius.home.kraxel.org>
 <237F54289DF84E4997F34151298ABEBC876835E5@SHSMSX101.ccr.corp.intel.com>
 <20190627103133.6ekdwazggi5j5lcl@sirius.home.kraxel.org>
 <20190628032149.GD9684@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190628032149.GD9684@zhen-hp.sh.intel.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Fri, 28 Jun 2019 05:43:58 +0000 (UTC)
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Zhang,
 Tina" <tina.zhang@intel.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>, "Yuan, Hang" <hang.yuan@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgMTE6MjE6NDlBTSArMDgwMCwgWmhlbnl1IFdhbmcgd3Jv
dGU6Cj4gT24gMjAxOS4wNi4yNyAxMjozMTozMyArMDIwMCwgR2VyZCBIb2ZmbWFubiB3cm90ZToK
PiA+ID4gPiAgIEhpLAo+ID4gPiA+IAo+ID4gPiA+ID4gSW5zdGVhZCBvZiBkZWxpdmVyaW5nIHBh
Z2UgZmxpcCBldmVudHMsIHdlIGNob29zZSB0byBwb3N0IGRpc3BsYXkKPiA+ID4gPiA+IHZibGFu
ayBldmVudC4gSGFuZGxpbmcgcGFnZSBmbGlwIGV2ZW50cyBmb3IgYm90aCBwcmltYXJ5IHBsYW5l
IGFuZAo+ID4gPiA+ID4gY3Vyc29yIHBsYW5lIG1heSBtYWtlIHVzZXIgc3BhY2UgcXVpdGUgYnVz
eSwgYWx0aG91Z2ggd2UgaGF2ZSB0aGUKPiA+ID4gPiA+IG1hc2svdW5tYXNrIG1lY2hhbnNpbSBm
b3IgbWl0aWdhdGlvbi4gQmVzaWRlcywgdGhlcmUgYXJlIHNvbWUgY2FzZXMKPiA+ID4gPiA+IHRo
YXQgZ3Vlc3QgYXBwIG9ubHkgdXNlcyBvbmUgZnJhbWVidWZmZXIgZm9yIGJvdGggZHJhd2luZyBh
bmQgZGlzcGxheS4KPiA+ID4gPiA+IEluIHN1Y2ggY2FzZSwgZ3Vlc3QgT1Mgd29uJ3QgZG8gdGhl
IHBsYW5lIHBhZ2UgZmxpcCB3aGVuIHRoZQo+ID4gPiA+ID4gZnJhbWVidWZmZXIgaXMgdXBkYXRl
ZCwgdGh1cyB0aGUgdXNlciBsYW5kIHdvbid0IGJlIG5vdGlmaWVkIGFib3V0IHRoZQo+ID4gPiA+
IHVwZGF0ZWQgZnJhbWVidWZmZXIuCj4gPiA+ID4gCj4gPiA+ID4gV2hhdCBoYXBwZW5zIHdoZW4g
dGhlIGd1ZXN0IGlzIGlkbGUgYW5kIGRvZXNuJ3QgZHJhdyBhbnl0aGluZyB0byB0aGUKPiA+ID4g
PiBmcmFtZWJ1ZmZlcj8KPiA+ID4gVGhlIHZibGFuayBldmVudCB3aWxsIGJlIGRlbGl2ZXJlZCB0
byB1c2Vyc3BhY2UgYXMgd2VsbCwgdW5sZXNzIGd1ZXN0IE9TIGRpc2FibGUgdGhlIHBpcGUuCj4g
PiA+IERvZXMgaXQgbWFrZSBzZW5zZSB0byB2ZmlvL2Rpc3BsYXk/Cj4gPiAKPiA+IEdldHRpbmcg
bm90aWZpZWQgb25seSBpbiBjYXNlIHRoZXJlIGFyZSBhY3R1YWwgZGlzcGxheSB1cGRhdGVzIHdv
dWxkIGJlCj4gPiBhIG5pY2Ugb3B0aW1pemF0aW9uLCBhc3N1bWluZyB0aGUgaGFyZHdhcmUgaXMg
YWJsZSB0byBkbyB0aGF0LiAgSWYgdGhlCj4gPiBndWVzdCBwYWdlZmxpcHMgdGhpcyBpcyBvYnZp
b3VzbHkgdHJpdmlhbC4gIE5vdCBzdXJlIHRoaXMgaXMgcG9zc2libGUgaW4KPiA+IGNhc2UgdGhl
IGd1ZXN0IHJlbmRlcnMgZGlyZWN0bHkgdG8gdGhlIGZyb250YnVmZmVyLgo+ID4gCj4gPiBXaGF0
IGV4YWN0bHkgaGFwcGVucyB3aGVuIHRoZSBndWVzdCBPUyBkaXNhYmxlcyB0aGUgcGlwZT8gIElz
IGEgdmJsYW5rCj4gPiBldmVudCBkZWxpdmVyZWQgYXQgbGVhc3Qgb25jZT8gIFRoYXQgd291bGQg
YmUgdmVyeSB1c2VmdWwgYmVjYXVzZSBpdAo+ID4gd2lsbCBiZSBwb3NzaWJsZSBmb3IgdXNlcnNw
YWNlIHRvIHN0b3AgcG9sbGluZyBhbHRvZ2V0aGVyIHdpdGhvdXQKPiA+IG1pc3NpbmcgdGhlICJn
dWVzdCBkaXNhYmxlZCBwaXBlIiBldmVudC4KPiA+IAo+IAo+IEl0IGxvb2tzIGxpa2UgcHVycG9z
ZSB0byB1c2UgdmJsYW5rIGhlcmUgaXMgdG8gcmVwbGFjZSB1c2VyIHNwYWNlCj4gcG9sbGluZyB0
b3RhbGx5IGJ5IGtlcm5lbCBldmVudD8gV2hpY2gganVzdCBhY3QgYXMgZGlzcGxheSB1cGRhdGUK
PiBldmVudCB0byByZXBsYWNlIHVzZXIgc3BhY2UgdGltZXIgdG8gbWFrZSBpdCBxdWVyeSBhbmQg
dXBkYXRlCj4gcGxhbmVzPwoKSSB0aGluayBpdCBtYWtlcyBzZW5zZSB0byBkZXNpZ24gaXQgdGhh
dCB3YXksIHNvIHVzZXJzcGFjZSB3aWxsIGVpdGhlcgp1c2UgdGhlIGV2ZW50cyAod2hlbiBzdXBw
b3J0ZWQgYnkgdGhlIGRyaXZlcikgb3IgYSB0aW1lciAoZmFsbGJhY2sgaWYKbm90KSBidXQgbm90
IGJvdGguCgo+IEFsdGhvdWdoIGluIHRoZW9yeSB2YmxhbmsgaXMgbm90IGFwcHJvcHJpYXRlIGZv
ciB0aGlzIHdoaWNoCj4gZG9lc24ndCBhbGlnbiB3aXRoIHBsYW5lIHVwZGF0ZSBvciBwb3NzaWJs
ZSBmcm9udCBidWZmZXIgcmVuZGVyaW5nIGF0Cj4gYWxsLCBidXQgbG9va3MgaXQncyBqdXN0IGEg
Y29tcHJvbWlzZSBlLmcgbm90IHNlbmRpbmcgZXZlbnQgZm9yIGV2ZXJ5Cj4gY3Vyc29yIHBvc2l0
aW9uIGNoYW5nZSwgZXRjLgo+IAo+IEkgdGhpbmsgd2UgbmVlZCB0byBkZWZpbmUgc2VtYW50aWNz
IGZvciB0aGlzIGV2ZW50IHByb3Blcmx5LCBlLmcgdXNlcgo+IHNwYWNlIHB1cmVseSBkZXBlbmRz
IG9uIHRoaXMgZXZlbnQgZm9yIGRpc3BsYXkgdXBkYXRlLCB0aGUgb3Bwb3J0dW5pdHkKPiBmb3Ig
aXNzdWluZyB0aGlzIGV2ZW50IGlzIGNvbnRyb2xsZWQgYnkgZHJpdmVyIHdoZW4gaXQncyBuZWNl
c3NhcnkgZm9yCj4gdXBkYXRlLCBldGMuIERlZmluaXRlbHkgbm90IG5hbWVkIGFzIHZibGFuayBl
dmVudCBvciBvbmx5IGlzc3VlIGF0IHZibGFuaywKPiB0aGF0IG5lZWQgdG8gaGFwcGVuIGZvciBv
dGhlciBwbGFuZSBjaGFuZ2UgdG9vLgoKSSB0aGluayBpdCBzaG91bGQgYmUgImRpc3BsYXkgdXBk
YXRlIG5vdGlmaWNhdGlvbiIsIGkuZS4gdXNlcnNwYWNlCnNob3VsZCBjaGVjayBmb3IgcGxhbmUg
Y2hhbmdlcyBhbmQgdXBkYXRlIHRoZSBkaXNwbGF5LgoKTW9zdCBldmVudHMgd2lsbCBwcm9iYWJs
eSBjb21lIGZyb20gdmJsYW5rICh0eXBpY2FsbHkgcGxhbmUgdXBkYXRlIGFyZQphY3R1YWxseSBj
b21taXR0ZWQgYXQgdmJsYW5rIHRpbWUgdG8gYXZvaWQgdGVhcmluZywgcmlnaHQ/KS4gIFRoYXQg
aXMgYW4KaW1wbGVtZW50YXRpb24gZGV0YWlsIHRob3VnaC4KCmNoZWVycywKICBHZXJkCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2
IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
