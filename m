Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C479C009D
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 27 Sep 2019 10:04:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E7E6EEAB;
	Fri, 27 Sep 2019 08:04:51 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B82B26EEAB;
 Fri, 27 Sep 2019 08:04:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AD2F24FCD6;
 Fri, 27 Sep 2019 08:04:48 +0000 (UTC)
Received: from [10.72.12.30] (ovpn-12-30.pek2.redhat.com [10.72.12.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 152AE60BE2;
 Fri, 27 Sep 2019 08:04:27 +0000 (UTC)
Subject: Re: [PATCH V2 5/8] mdev: introduce device specific ops
To: Rob Miller <rob.miller@broadcom.com>, "Tian, Kevin" <kevin.tian@intel.com>
References: <20190924135332.14160-1-jasowang@redhat.com>
 <20190924135332.14160-6-jasowang@redhat.com>
 <20190924170638.064d85f7@x1.home>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D58F754@SHSMSX104.ccr.corp.intel.com>
 <CAJPjb1+i7jb0aVfr=7CDuUBpeo_w3wAfTrnmuLVJ-h+qOV+1hw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <c532d7ce-90be-6456-a630-96f56cb6409d@redhat.com>
Date: Fri, 27 Sep 2019 16:04:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAJPjb1+i7jb0aVfr=7CDuUBpeo_w3wAfTrnmuLVJ-h+qOV+1hw@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Fri, 27 Sep 2019 08:04:49 +0000 (UTC)
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
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "mst@redhat.com" <mst@redhat.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "parav@mellanox.com" <parav@mellanox.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "sebott@linux.ibm.com" <sebott@linux.ibm.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "idos@mellanox.com" <idos@mellanox.com>,
 "gor@linux.ibm.com" <gor@linux.ibm.com>, "Liang,
 Cunming" <cunming.liang@intel.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 Alex Williamson <alex.williamson@redhat.com>, "Wang,
 Xiao W" <xiao.w.wang@intel.com>, "freude@linux.ibm.com" <freude@linux.ibm.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>, "Vivi,
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Ck9uIDIwMTkvOS8yNSDkuIvljYgxMDoxMSwgUm9iIE1pbGxlciB3cm90ZToKPgo+ID4gPsKgIMKg
IMKgbWRldl9zZXRfY2xhc3NfaWQobWRldiwgTURFVl9JRF9WRklPKTsKPiA+ID4gK8KgIMKgbWRl
dl9zZXRfZGV2X29wcyhtZGV2LCAmaW50ZWxfdmZpb192Z3B1X2Rldl9vcHMpOwo+ID4KPiA+IFRo
aXMgc2VlbXMgcmF0aGVyIHVucmVmaW5lZC7CoCBXZSdyZSByZWdpc3RlcmluZyBpbnRlcmRlcGVu
ZGVudCBkYXRhIGluCj4gPiBzZXBhcmF0ZSBjYWxscy7CoCBBbGwgZHJpdmVycyBuZWVkIHRvIG1h
a2UgYm90aCBvZiB0aGVzZSBjYWxscy7CoCBJJ20gbm90Cj4gPiBzdXJlIGlmIHRoaXMgaXMgYSBn
b29kIGlkZWEsIGJ1dCB3aGF0IGlmIHdlIGhhZDoKPiA+Cj4gPiBzdGF0aWMgY29uc3Qgc3RydWN0
IHZmaW9fbWRldl9kZXZpY2Vfb3BzIGludGVsX3ZmaW9fdmdwdV9kZXZfb3BzID0gewo+ID7CoCDC
oCDCoCDCoC5pZMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgPSBNREVWX0lEX1ZGSU8s
Cj4gPsKgIMKgIMKgIMKgLm9wZW7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoD0gaW50ZWxf
dmdwdV9vcGVuLAo+ID7CoCDCoCDCoCDCoC5yZWxlYXNlwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
PSBpbnRlbF92Z3B1X3JlbGVhc2UsCj4gPsKgIMKgIMKgIMKgIMKgLi4uCj4gPgo+ID4gQW5kIHRo
ZSBzZXQgZnVuY3Rpb24gcGFzc2VkICZpbnRlbF92ZmlvX3ZncHVfZGV2X29wcy5pZCAKPiA8aHR0
cDovL2ludGVsX3ZmaW9fdmdwdV9kZXZfb3BzLmlkPiBhbmQgdGhlIG1kZXYKPiA+IGJ1cyBkcml2
ZXJzIHVzZWQgY29udGFpbmVyX29mIHRvIGdldCB0byB0aGVpciBjYWxsYmFja3M/Cj4KPiBvciBq
dXN0IG1ha2UgaXQgZXhwbGljaXQ/IGUuZy4KPgo+IG1kZXZfc2V0X2NsYXNzKG1kZXYsIE1ERVZf
SURfVkZJTywgJmludGVsX3ZmaW9fdmdwdV9kZXZfb3BzKTsKCgpZZXMsIHRoaXMgc2VlbXMgZXZl
biBiZXR0ZXIuCgpXaWxsIGRvIHRoaXMgaW4gVjMuCgpUaGFua3MKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0
CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
