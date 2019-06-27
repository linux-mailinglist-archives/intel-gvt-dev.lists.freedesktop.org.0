Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A794F58017
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 27 Jun 2019 12:20:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FCD76E136;
	Thu, 27 Jun 2019 10:20:52 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC2B6E136
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 27 Jun 2019 10:20:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A83AC30832D3;
 Thu, 27 Jun 2019 10:20:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C1FC19C68;
 Thu, 27 Jun 2019 10:20:48 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 50B5711AAF; Thu, 27 Jun 2019 12:20:47 +0200 (CEST)
Date: Thu, 27 Jun 2019 12:20:47 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Zhang, Tina" <tina.zhang@intel.com>
Subject: Re: [RFC PATCH v3 1/4] vfio: Define device specific irq type
 capability
Message-ID: <20190627102047.elwxbzqcyw4ixy7x@sirius.home.kraxel.org>
References: <20190627033802.1663-1-tina.zhang@intel.com>
 <20190627033802.1663-2-tina.zhang@intel.com>
 <20190627061942.k5onxbm27dju3iv5@sirius.home.kraxel.org>
 <237F54289DF84E4997F34151298ABEBC87683644@SHSMSX101.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <237F54289DF84E4997F34151298ABEBC87683644@SHSMSX101.ccr.corp.intel.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Thu, 27 Jun 2019 10:20:50 +0000 (UTC)
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

T24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgMDg6NTU6MjFBTSArMDAwMCwgWmhhbmcsIFRpbmEgd3Jv
dGU6Cj4gCj4gCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4gRnJvbTogaW50ZWwt
Z3Z0LWRldiBbbWFpbHRvOmludGVsLWd2dC1kZXYtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5v
cmddIE9uCj4gPiBCZWhhbGYgT2YgR2VyZCBIb2ZmbWFubgo+ID4gU2VudDogVGh1cnNkYXksIEp1
bmUgMjcsIDIwMTkgMjoyMCBQTQo+ID4gVG86IFpoYW5nLCBUaW5hIDx0aW5hLnpoYW5nQGludGVs
LmNvbT4KPiA+IENjOiBUaWFuLCBLZXZpbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+OyBrdm1Admdl
ci5rZXJuZWwub3JnOyBsaW51eC0KPiA+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IHpoZW55dXdA
bGludXguaW50ZWwuY29tOyBZdWFuLCBIYW5nCj4gPiA8aGFuZy55dWFuQGludGVsLmNvbT47IGFs
ZXgud2lsbGlhbXNvbkByZWRoYXQuY29tOyBMdiwgWmhpeXVhbgo+ID4gPHpoaXl1YW4ubHZAaW50
ZWwuY29tPjsgaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFdhbmcsIFpoaSBB
Cj4gPiA8emhpLmEud2FuZ0BpbnRlbC5jb20+Cj4gPiBTdWJqZWN0OiBSZTogW1JGQyBQQVRDSCB2
MyAxLzRdIHZmaW86IERlZmluZSBkZXZpY2Ugc3BlY2lmaWMgaXJxIHR5cGUKPiA+IGNhcGFiaWxp
dHkKPiA+IAo+ID4gICBIaSwKPiA+IAo+ID4gPiArc3RydWN0IHZmaW9faXJxX2luZm9fY2FwX3R5
cGUgewo+ID4gPiArCXN0cnVjdCB2ZmlvX2luZm9fY2FwX2hlYWRlciBoZWFkZXI7Cj4gPiA+ICsJ
X191MzIgdHlwZTsgICAgIC8qIGdsb2JhbCBwZXIgYnVzIGRyaXZlciAqLwo+ID4gPiArCV9fdTMy
IHN1YnR5cGU7ICAvKiB0eXBlIHNwZWNpZmljICovCj4gPiAKPiA+IERvIHdlIHJlYWxseSBuZWVk
IGJvdGggdHlwZSBhbmQgc3VidHlwZT8KPiBUaGVuLCBpZiBvbmUgZGV2aWNlIGhhcyBzZXZlcmFs
IGlycXMsIGhvdyBjYW4gd2UgaWRlbnRpZnkgdGhlbT8KPiBUaGFua3MuCgpKdXN0IGFzc2lnbiBt
dWx0aXBsZSB0eXBlcz8KCmNoZWVycywKICBHZXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1n
dnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
