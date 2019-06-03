Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACEE33917
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  3 Jun 2019 21:29:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43B15892EF;
	Mon,  3 Jun 2019 19:29:55 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF8C892EF
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  3 Jun 2019 19:29:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 13F7581E07;
 Mon,  3 Jun 2019 19:29:42 +0000 (UTC)
Received: from x1.home (ovpn-116-22.phx2.redhat.com [10.3.116.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E968A17ADA;
 Mon,  3 Jun 2019 19:29:32 +0000 (UTC)
Date: Mon, 3 Jun 2019 13:29:32 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH v4 0/2] introduction of migration_version attribute for
 VFIO live migration
Message-ID: <20190603132932.1b5dc7fe@x1.home>
In-Reply-To: <20190531004438.24528-1-yan.y.zhao@intel.com>
References: <20190531004438.24528-1-yan.y.zhao@intel.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Mon, 03 Jun 2019 19:29:53 +0000 (UTC)
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
Cc: cjia@nvidia.com, kvm@vger.kernel.org, aik@ozlabs.ru,
 Zhengxiao.zx@alibaba-inc.com, shuangtai.tst@alibaba-inc.com,
 qemu-devel@nongnu.org, kwankhede@nvidia.com, eauger@redhat.com,
 yi.l.liu@intel.com, eskultet@redhat.com, ziye.yang@intel.com,
 mlevitsk@redhat.com, pasic@linux.ibm.com, libvir-list@redhat.com,
 felipe@nutanix.com, Ken.Xue@amd.com, kevin.tian@intel.com, dgilbert@redhat.com,
 zhenyuw@linux.intel.com, dinechin@redhat.com,
 intel-gvt-dev@lists.freedesktop.org, changpeng.liu@intel.com,
 berrange@redhat.com, cohuck@redhat.com, linux-kernel@vger.kernel.org,
 zhi.a.wang@intel.com, jonathan.davies@nutanix.com, shaopeng.he@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVGh1LCAzMCBNYXkgMjAxOSAyMDo0NDozOCAtMDQwMApZYW4gWmhhbyA8eWFuLnkuemhhb0Bp
bnRlbC5jb20+IHdyb3RlOgoKPiBUaGlzIHBhdGNoc2V0IGludHJvZHVjZXMgYSBtaWdyYXRpb25f
dmVyc2lvbiBhdHRyaWJ1dGUgdW5kZXIgc3lzZnMgb2YgVkZJTwo+IE1lZGlhdGVkIGRldmljZXMu
Cj4gCj4gVGhpcyBtaWdyYXRpb25fdmVyc2lvbiBhdHRyaWJ1dGUgaXMgdXNlZCB0byBjaGVjayBt
aWdyYXRpb24gY29tcGF0aWJpbGl0eQo+IGJldHdlZW4gdHdvIG1kZXYgZGV2aWNlcyBvZiB0aGUg
c2FtZSBtZGV2IHR5cGUuCj4gCj4gUGF0Y2ggMSBkZWZpbmVzIG1pZ3JhdGlvbl92ZXJzaW9uIGF0
dHJpYnV0ZSBpbgo+IERvY3VtZW50YXRpb24vdmZpby1tZWRpYXRlZC1kZXZpY2UudHh0Cj4gCj4g
UGF0Y2ggMiB1c2VzIEdWVCBhcyBhbiBleGFtcGxlIHRvIHNob3cgaG93IHRvIGV4cG9zZSBtaWdy
YXRpb25fdmVyc2lvbgo+IGF0dHJpYnV0ZSBhbmQgY2hlY2sgbWlncmF0aW9uIGNvbXBhdGliaWxp
dHkgaW4gdmVuZG9yIGRyaXZlci4KClRoYW5rcyBmb3IgaXRlcmF0aW5nIHRocm91Z2ggdGhpcywg
aXQgbG9va3MgbGlrZSB3ZSd2ZSBzZXR0bGVkIG9uCnNvbWV0aGluZyByZWFzb25hYmxlLCBidXQg
bm93IHdoYXQ/ICBUaGlzIGlzIG9uZSBwaWVjZSBvZiB0aGUgcHV6emxlIHRvCnN1cHBvcnRpbmcg
bWRldiBtaWdyYXRpb24sIGJ1dCBJIGRvbid0IHRoaW5rIGl0IG1ha2VzIHNlbnNlIHRvIGNvbW1p
dAp0aGlzIHVwc3RyZWFtIG9uIGl0cyBvd24gd2l0aG91dCBhbHNvIGRlZmluaW5nIHRoZSByZW1h
aW5kZXIgb2YgaG93IHdlCmFjdHVhbGx5IGRvIG1pZ3JhdGlvbiwgcHJlZmVyYWJseSB3aXRoIG1v
cmUgdGhhbiBvbmUgd29ya2luZwppbXBsZW1lbnRhdGlvbiBhbmQgYXQgbGVhc3QgcHJvdG90eXBl
ZCwgaWYgbm90IGZpbmFsLCBRRU1VIHN1cHBvcnQuICBJCmhvcGUgdGhhdCB3YXMgdGhlIGludGVu
dCwgYW5kIG1heWJlIGl0J3Mgbm93IHRpbWUgdG8gbG9vayBhdCB0aGUgbmV4dApwaWVjZSBvZiB0
aGUgcHV6emxlLiAgVGhhbmtzLAoKQWxleApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
