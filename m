Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0310F8604E
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  8 Aug 2019 12:44:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD3C06E821;
	Thu,  8 Aug 2019 10:44:35 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C4E89213;
 Thu,  8 Aug 2019 10:44:34 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17928851-1500050 for multiple; Thu, 08 Aug 2019 11:44:23 +0100
MIME-Version: 1.0
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Xiong Zhang <xiong.y.zhang@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190808103236.GB30506@mwanda>
References: <20190808103236.GB30506@mwanda>
Message-ID: <156526106102.20411.17520131390381233492@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH] drm/i915: Use after free in error path in
 intel_vgpu_create_workload()
Date: Thu, 08 Aug 2019 11:44:21 +0100
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

UXVvdGluZyBEYW4gQ2FycGVudGVyICgyMDE5LTA4LTA4IDExOjMyOjM2KQo+IFdlIGNhbid0IGZy
ZWUgIndvcmtsb2FkIiB1bnRpbCBhZnRlciB0aGUgcHJpbnRrIG9yIGl0J3MgYSB1c2UgYWZ0ZXIK
PiBmcmVlLgo+IAo+IEZpeGVzOiAyMDg5YTc2YWRlOTAgKCJkcm0vaTkxNS9ndnQ6IENoZWNraW5n
IHdvcmtsb2FkJ3MgZ21hIGVhcmxpZXIiKQo+IFNpZ25lZC1vZmYtYnk6IERhbiBDYXJwZW50ZXIg
PGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KClRoYXQncyB0aGUgc2ltcGxlciBwYXRjaCwKUmV2
aWV3ZWQtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgotQ2hyaXMK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
