Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CC79647B
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 20 Aug 2019 17:32:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB8A36E82E;
	Tue, 20 Aug 2019 15:32:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 509F96E82E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 20 Aug 2019 15:32:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 93FC330603AA;
 Tue, 20 Aug 2019 15:32:45 +0000 (UTC)
Received: from x1.home (ovpn-116-99.phx2.redhat.com [10.3.116.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6248218F01;
 Tue, 20 Aug 2019 15:32:41 +0000 (UTC)
Date: Tue, 20 Aug 2019 09:32:40 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Zhang, Tina" <tina.zhang@intel.com>
Subject: Re: [PATCH v5 2/6] vfio: Introduce vGPU display irq type
Message-ID: <20190820093240.2bc1c9ba@x1.home>
In-Reply-To: <237F54289DF84E4997F34151298ABEBC876F9AD3@SHSMSX101.ccr.corp.intel.com>
References: <20190816023528.30210-1-tina.zhang@intel.com>
 <20190816023528.30210-3-tina.zhang@intel.com>
 <20190816145148.307408dc@x1.home>
 <237F54289DF84E4997F34151298ABEBC876F9AD3@SHSMSX101.ccr.corp.intel.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Tue, 20 Aug 2019 15:32:45 +0000 (UTC)
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Yuan,
 Hang" <hang.yuan@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "kraxel@redhat.com" <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVHVlLCAyMCBBdWcgMjAxOSAwMjoxMjoxMCArMDAwMAoiWmhhbmcsIFRpbmEiIDx0aW5hLnpo
YW5nQGludGVsLmNvbT4gd3JvdGU6Cgo+IEJUVywgSUlSQywgd2UgbWlnaHQgYWxzbyBoYXZlIG9u
ZSBxdWVzdGlvbiB3YWl0aW5nIHRvIGJlIHJlcGxpZWQ6Cj4gLSBDYW4gd2UganVzdCB1c2UgVkZJ
T19JUlFfVFlQRV9HRlggdy9vIHByb3Bvc2luZyBhIG5ldyBzdWIgdHlwZQo+IChpLmUuIFZGSU9f
SVJRX1NVQlRZUEVfR0ZYX0RJU1BMQVlfSVJRKT8gV2VsbCwgb25seSBpZiB3ZSBjYW4gYWdyZWUK
PiBvbiB0aGF0IHdlIGRvbid0IGhhdmUgYW55IG90aGVyIEdGWCBJUlEgcmVxdWlyZW1lbnRzIGlu
IGZ1dHVyZS4KPiBPdGhlcndpc2UsIHdlIG1pZ2h0IG5lZWQgYSBzdWIgdHlwZSB0byBkaWZmZXJl
bnRpYXRlIHRoZW0uCgpJIHRoaW5rIHlvdSd2ZSBhbnN3ZXJlZCB5b3VyIG93biBxdWVzdGlvbiA7
KSAgV2UgYWxyZWFkeSBoYXZlIHRoZQppbmZyYXN0cnVjdHVyZSBmb3IgZGVmaW5pbmcgdHlwZS9z
dWItdHlwZSBhbmQgaXQgYWxsb3dzIHVzIHRvCmNhdGVnb3JpemUgYW5kIGdyb3VwIGludGVycnVw
dCB0eXBlcyB0b2dldGhlciBjb25zaXN0ZW50IHdpdGggaG93IHdlIGRvCmZvciByZWdpb25zLCBz
byB3aGF0J3MgdGhlIG92ZXJoZWFkIGluIHRoaXMgYXBwcm9hY2g/ICBPdGhlcndpc2Ugd2UKdGVu
ZCB0byBoYXZlIGFuIGFkLWhvYyBsaXN0LiAgV2UgY2FuJ3Qgc2F5IHdpdGggYWJzb2x1dGUgY2Vy
dGFpbnR5IHRoYXQKd2Ugd29uJ3QgaGF2ZSBhZGRpdGlvbmFsIEdGWCByZWxhdGVkIElSUXMuICBU
aGFua3MsCgpBbGV4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aW50ZWwtZ3Z0LWRldg==
