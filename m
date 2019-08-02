Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D38D7FAC1
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  2 Aug 2019 15:35:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 381CB6EE57;
	Fri,  2 Aug 2019 13:35:38 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C9136EE57
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  2 Aug 2019 13:35:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7FA03882F2;
 Fri,  2 Aug 2019 13:35:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-81.ams2.redhat.com
 [10.36.116.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB2A860C47;
 Fri,  2 Aug 2019 13:35:32 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DCD6916E05; Fri,  2 Aug 2019 15:35:31 +0200 (CEST)
Date: Fri, 2 Aug 2019 15:35:31 +0200
From: "kraxel@redhat.com" <kraxel@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [RFC PATCH v4 2/6] vfio: Introduce vGPU display irq type
Message-ID: <20190802133531.4zwsjltvjisq4sfz@sirius.home.kraxel.org>
References: <20190718155640.25928-1-kechen.lu@intel.com>
 <20190718155640.25928-3-kechen.lu@intel.com>
 <20190719102516.60af527f@x1.home>
 <31185F57AF7C4B4F87C41E735C23A6FE64E06F@shsmsx102.ccr.corp.intel.com>
 <20190722134124.16c55c2f@x1.home>
 <237F54289DF84E4997F34151298ABEBC876BC9AD@SHSMSX101.ccr.corp.intel.com>
 <20190722191830.425d1593@x1.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190722191830.425d1593@x1.home>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Fri, 02 Aug 2019 13:35:36 +0000 (UTC)
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
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>, "Zhang,
 Tina" <tina.zhang@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>, "Lu,
 Kechen" <kechen.lu@intel.com>, "Yuan, Hang" <hang.yuan@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

ICBIaSwKCj4gPiA+IENvdWxkbid0IHlvdSBleHBvc2UgdGhpcyBhcyBhbm90aGVyIGNhcGFiaWxp
dHkgd2l0aGluIHRoZSBJUlFfSU5GTyByZXR1cm4KPiA+ID4gZGF0YT8gIElmIHlvdSB3ZXJlIHRv
IGRlZmluZSBpdCBhcyBhIG1hY3JvLCBJIGFzc3VtZSB0aGF0IG1lYW5zIGl0IHdvdWxkIGJlCj4g
PiA+IGhhcmQgY29kZWQsIGluIHdoaWNoIGNhc2UgdGhpcyBwcm9iYWJseSBiZWNvbWVzIGFuIElu
dGVsIHNwZWNpZmljIElSUSwgcmF0aGVyCj4gPiA+IHRoYW4gd2hhdCBhcHBlYXJzIHRvIGJlIGZy
YW1lZCBhcyBhIGdlbmVyaWMgZ3JhcGhpY3MgSVJRIGV4dGVuc2lvbi4gIEEgbmV3Cj4gPiA+IGNh
cGFiaWxpdHkgY291bGQgaW5zdGVhZCBhbGxvdyB0aGUgdmVuZG9yIHRvIHNwZWNpZnkgdGhlaXIg
b3duIHZhbHVlLCB3aGVyZQo+ID4gPiB3ZSBjb3VsZCBkZWZpbmUgaG93IHVzZXJzcGFjZSBzaG91
bGQgaW50ZXJwcmV0IGFuZCBtYWtlIHVzZSBvZiB0aGlzIHZhbHVlLgo+ID4gPiBUaGFua3MsICAK
PiA+IEdvb2Qgc3VnZ2VzdGlvbi4gQ3VycmVudGx5LCB2ZmlvX2lycV9pbmZvIGlzIHVzZWQgdG8g
c2F2ZSBvbmUgaXJxCj4gPiBpbmZvLiBXaGF0IHdlIG5lZWQgaGVyZSBpcyB0byB1c2UgaXQgdG8g
c2F2ZSBzZXZlcmFsIGV2ZW50cyBpbmZvLgo+ID4gTWF5YmUgd2UgY291bGQgZmlndXJlIG91dCBh
IGdlbmVyYWwgbGF5b3V0IG9mIHRoaXMgY2FwYWJpbGl0eSBzbyB0aGF0Cj4gPiBpdCBjYW4gYmUg
bGV2ZXJhZ2VkIGJ5IG90aGVycywgbm90IG9ubHkgZm9yIGRpc3BsYXkgaXJxL2V2ZW50cy4KPiAK
PiBZb3UgY291bGQgYWxzbyBleHBvc2UgYSBkZXZpY2Ugc3BlY2lmaWMgSVJRIHdpdGggY291bnQg
PiAxIChpZS4gc2ltaWxhcgo+IHRvIE1TSS9YKSBhbmQgYXZvaWQgbXVuZ2luZyB0aGUgZXZlbnRm
ZCB2YWx1ZSwgd2hpY2ggaXMgbm90IHNvbWV0aGluZwo+IHdlIGRvIGVsc2V3aGVyZSwgYXQgbGVh
c3QgaW4gdmZpby4gIFRoYW5rcywKCldlbGwsIHRoZSBiYXNpYyBpZGVhIGlzIHRvIHVzZSB0aGUg
ZXZlbnRmZCB2YWx1ZSB0byBzaWduYWwgdGhlIGtpbmQgb2YKY2hhbmdlcyB3aGljaCBkaWQgaGFw
cGVuLCBzaW1saWFyIHRvIElSUSBzdGF0dXMgcmVnaXN0ZXIgYml0cy4KClNvLCB3aGVuIHRoZSBn
dWVzdCBjaGFuZ2VzIHRoZSBwcmltYXJ5IHBsYW5lLCB0aGUgbWRldiBkcml2ZXIgbm90ZXMKdGhp
cy4gIFNhbWUgd2l0aCB0aGUgY3Vyc29yIHBsYW5lLiAgT24gdmJsYW5rICh3aGVuIHRoZSBndWVz
dHMgdXBkYXRlCmlzIGFjdHVhbGx5IGFwcGxpZWQpIHRoZSBtZGV2IGRyaXZlciB3YWtlcyB0aGUg
ZXZlbnRmZCBhbmQgdXNlcyBldmVudGZkCnZhbHVlIHRvIHNpZ25hbCB3aGVuZXZlciBwcmltYXJ5
IHBsYW5lIG9yIGN1cnNvciBwbGFuZSBvciBib3RoIGRpZApjaGFuZ2UuCgpUaGVuIHVzZXJzcGFj
ZSBrbm93cyB3aGljaCBwbGFuZXMgbmVlZCBhbiB1cGRhdGUgd2l0aG91dCBhbiBleHRyYQpWRklP
X0RFVklDRV9RVUVSWV9HRlhfUExBTkUgcm91bmR0cmlwIHRvIHRoZSBrZXJuZWwuCgpBbHRlcm5h
dGl2ZWx5IHdlIGNvdWxkIGhhdmUgb25lIGV2ZW50ZmQgZm9yIGVhY2ggY2hhbmdlIHR5cGUuICBC
dXQgZ2l2ZW4KdGhhdCB0aGVzZSBjaGFuZ2VzIGFyZSB0eXBpY2FsbHkgYXBwbGllZCBhdCB0aGUg
c2FtZSB0aW1lICh2YmxhbmspIHdlCndvdWxkIGhhdmUgbXVsdGlwbGUgZXZlbnRmZHMgYmVpbmcg
c2lnbmFsZWQgYXQgdGhlIHNhbWUgdGltZS4gIFdoaWNoCmRvZXNuJ3QgbG9vayBpZGVhbCB0byBt
ZSAuLi4KCmNoZWVycywKICBHZXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
