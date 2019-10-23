Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD840E16A0
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 23 Oct 2019 11:50:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EAAC6E093;
	Wed, 23 Oct 2019 09:50:51 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9632E6E093
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 23 Oct 2019 09:50:50 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 18934959-1500050 for multiple; Wed, 23 Oct 2019 10:50:48 +0100
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
User-Agent: alot/0.6
To: Zhenyu Wang <zhenyuw@linux.intel.com>, intel-gvt-dev@lists.freedesktop.org
References: <20191023094327.2176-1-zhenyuw@linux.intel.com>
 <157182419142.11484.1950518076166242203@skylake-alporthouse-com>
In-Reply-To: <157182419142.11484.1950518076166242203@skylake-alporthouse-com>
Message-ID: <157182424585.11484.5793920122038009056@skylake-alporthouse-com>
Subject: Re: [PATCH] drm/i915/gvt: fix dead locking in early workload shadow
Date: Wed, 23 Oct 2019 10:50:45 +0100
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

UXVvdGluZyBDaHJpcyBXaWxzb24gKDIwMTktMTAtMjMgMTA6NDk6NTEpCj4gUXVvdGluZyBaaGVu
eXUgV2FuZyAoMjAxOS0xMC0yMyAxMDo0MzoyNykKPiA+IEFzIGVhcmx5IHdvcmtsb2FkIHNjYW4g
YW5kIHNoYWRvdyBoYXBwZW5zIGluIGV4ZWNsaXN0IG1taW8gaGFuZGxlciwKPiA+IHdoaWNoIGhh
cyBhbHJlYWR5IHRha2VuIHZncHVfbG9jay4gU28gcmVtb3ZlIGV4dHJhIGxvY2sgdGFraW5nIGhl
cmUuCj4gPiAKPiA+IEZpeGVzOiA5NTJmODlmMDk4YzcgKCJkcm0vaTkxNS9ndnQ6IFdlYW4gb2Zm
IHN0cnVjdF9tdXRleCIpCj4gPiBDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24u
Y28udWs+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBaaGVueXUgV2FuZyA8emhlbnl1d0BsaW51eC5pbnRl
bC5jb20+Cj4gCj4gVGEuCj4gUmV2aWV3ZWQtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMt
d2lsc29uLmNvLnVrPgoKSSBzaG91bGQgaW5zZXJ0IHRoZSBzdGFuZGFyZCByZXF1ZXN0IGZvciBD
SSB2aXNpYmlsaXR5IG9mIGd2dCA6KQotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
