Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B46BDD7D
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 25 Sep 2019 13:57:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 817FF89780;
	Wed, 25 Sep 2019 11:57:35 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB948975F;
 Wed, 25 Sep 2019 11:57:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 116A256F9;
 Wed, 25 Sep 2019 11:57:33 +0000 (UTC)
Received: from [10.72.12.148] (ovpn-12-148.pek2.redhat.com [10.72.12.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC7305C21F;
 Wed, 25 Sep 2019 11:56:40 +0000 (UTC)
Subject: Re: [PATCH 5/6] vringh: fix copy direction of vringh_iov_push_kern()
To: Alex Williamson <alex.williamson@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20190923130331.29324-1-jasowang@redhat.com>
 <20190923130331.29324-6-jasowang@redhat.com>
 <20190923094559.765da494@x1.home>
 <20190923115930-mutt-send-email-mst@kernel.org>
 <20190924080413.0cc875c5@x1.home>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <2f145744-cbfb-5bc3-0e2c-e8c23c20b42d@redhat.com>
Date: Wed, 25 Sep 2019 19:56:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190924080413.0cc875c5@x1.home>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Wed, 25 Sep 2019 11:57:33 +0000 (UTC)
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
 jani.nikula@linux.intel.com, rodrigo.vivi@intel.com, xiao.w.wang@intel.com,
 freude@linux.ibm.com, zhenyuw@linux.intel.com, parav@mellanox.com,
 zhihong.wang@intel.com, intel-gvt-dev@lists.freedesktop.org,
 akrowiak@linux.ibm.com, oberpar@linux.ibm.com, tiwei.bie@intel.com,
 netdev@vger.kernel.org, cohuck@redhat.com, linux-kernel@vger.kernel.org,
 maxime.coquelin@redhat.com, daniel@ffwll.ch, lingshan.zhu@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Ck9uIDIwMTkvOS8yNCDkuIvljYgxMDowNCwgQWxleCBXaWxsaWFtc29uIHdyb3RlOgo+IE9uIE1v
biwgMjMgU2VwIDIwMTkgMTI6MDA6NDEgLTA0MDAKPiAiTWljaGFlbCBTLiBUc2lya2luIiA8bXN0
QHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4+IE9uIE1vbiwgU2VwIDIzLCAyMDE5IGF0IDA5OjQ1OjU5
QU0gLTA2MDAsIEFsZXggV2lsbGlhbXNvbiB3cm90ZToKPj4+IE9uIE1vbiwgMjMgU2VwIDIwMTkg
MjE6MDM6MzAgKzA4MDAKPj4+IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+IHdyb3Rl
Ogo+Pj4gICAKPj4+PiBXZSB3YW50IHRvIGNvcHkgZnJvbSBpb3YgdG8gYnVmLCBzbyB0aGUgZGly
ZWN0aW9uIHdhcyB3cm9uZy4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEphc29uIFdhbmcgPGph
c293YW5nQHJlZGhhdC5jb20+Cj4+Pj4gLS0tCj4+Pj4gIGRyaXZlcnMvdmhvc3QvdnJpbmdoLmMg
fCA4ICsrKysrKystCj4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkgIAo+Pj4gV2h5IGlzIHRoaXMgaW5jbHVkZWQgaW4gdGhlIHNlcmllcz8gIFNlZW1z
IGxpa2UgYW4gdW5yZWxhdGVkIGZpeCBiZWluZwo+Pj4gaGVsZCB1cCB3aXRoaW4gYSBwcm9wb3Nh
bCBmb3IgYSBuZXcgZmVhdHVyZS4gIFRoYW5rcywKPj4+Cj4+PiBBbGV4ICAKPj4gSXQncyBiZXR0
ZXIgdG8gaGF2ZSBpdCBhcyBwYXRjaCAxLzYsIGJ1dCBpdCdzIGEgZGVwZW5kZW5jeSBvZiB0aGUK
Pj4gZXhhbXBsZSBkcml2ZXIgaW4gdGhlIHNlcmllcy4gSSBjYW4gcmVvcmRlciB3aGVuIEkgYXBw
bHkuCj4gSXQncyBhIGZpeCwgcGxlYXNlIHN1Ym1pdCBpdCBzZXBhcmF0ZWx5IHRocm91Z2ggdmly
dGlvL3Zob3N0IGNoYW5uZWxzLAo+IHRoZW4gaXQgd2lsbCBhbHJlYWR5IGJlIGluIHRoZSBiYXNl
IGtlcm5lbCB3ZSB1c2UgZm9yIHRoZSByZXN0IG9mIHRoZQo+IHNlcmllcy4gIFRoZSByZW1haW5k
ZXIgb2YgdGhlIHNlcmllcyBjZXJ0YWlubHkgc3VnZ2VzdHMgYSB3b3JrZmxvdwo+IHRocm91Z2gg
dGhlIHZmaW8gdHJlZSByYXRoZXIgdGhhbiB2aXJ0aW8vdmhvc3QuICBUaGFua3MsCj4KPiBBbGV4
CgoKT2suCgpUaGFua3MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaW50ZWwtZ3Z0LWRldg==
