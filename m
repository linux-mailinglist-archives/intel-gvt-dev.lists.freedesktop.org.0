Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAE3A9C2B
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  5 Sep 2019 09:49:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 515A189CF9;
	Thu,  5 Sep 2019 07:49:03 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C8E89CF9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  5 Sep 2019 07:49:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8233630044CE;
 Thu,  5 Sep 2019 07:49:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-72.ams2.redhat.com
 [10.36.117.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C87695C219;
 Thu,  5 Sep 2019 07:48:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 066DE937E; Thu,  5 Sep 2019 09:48:58 +0200 (CEST)
Date: Thu, 5 Sep 2019 09:48:57 +0200
From: "kraxel@redhat.com" <kraxel@redhat.com>
To: "Zhang, Tina" <tina.zhang@intel.com>
Subject: Re: [PATCH v5 0/6] Deliver vGPU display refresh event to userspace
Message-ID: <20190905074857.n3akutnoarnfvg4y@sirius.home.kraxel.org>
References: <20190816023528.30210-1-tina.zhang@intel.com>
 <237F54289DF84E4997F34151298ABEBC8771E7AE@SHSMSX101.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <237F54289DF84E4997F34151298ABEBC8771E7AE@SHSMSX101.ccr.corp.intel.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Thu, 05 Sep 2019 07:49:01 +0000 (UTC)
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
 Hang" <hang.yuan@intel.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

ICBIaSwKCj4gT3B0aW9uIDI6IFFFTVUgcHJvdmlkZXMgdGhlIGVtdWxhdGVkIGRpc3BsYXkgcmVm
cmVzaCBldmVudCB0byB0aGUKPiB2Z3B1cyBwcm92aWRlZCBieSB2ZW5kb3IgZHJpdmVyLiBGb3Ig
dmdwdXMsIHRoZSBkaXNwbGF5IHJlZnJlc2ggZXZlbnQKPiBjYW4gYmUgY29uc2lkZXJlZCBhcyB0
aGUgdmJsYW5rIGV2ZW50IHdoaWNoIGlzIGxldmVyYWdlZCBieSBndWVzdAo+IHdpbmRvdyBtYW5h
Z2VyIHRvIGRvIHRoZSBwbGFuZSB1cGRhdGUgb3IgbW9kZS1zZXR0aW5nLgoKPiBQZW9wbGUgYXJl
IGFza2luZyBpZiBvcHRpb24gMiBjb3VsZCBiZSBhIGJldHRlciBjaG9pY2UuCgpDZXJ0YWlubHkg
d29ydGggdHJ5aW5nLCBtYXliZSBpdCBldmVuIG1ha2VzIHNlbnNlIHRvIGltcGxlbWVudCBib3Ro
IGFuZApsZXQgcWVtdSBwaWNrIG9uZSwgcG9zc2libHkgZXZlbiBzd2l0Y2ggdGhlbSBhdCBydW50
aW1lLgoKcWVtdSBjYW4gY2hhbmdlIHRoZSByZWZyZXNoIHJhdGUuICB2bmMgYW5kIHNkbCB1c2Ug
dGhhdCB0byByZWR1Y2UgdGhlCnJlZnJlc2ggcmF0ZSBpbiBjYXNlIG5vYm9keSBpcyBsb29raW5n
IChubyB2bmMgY2xpZW50IGNvbm5lY3RlZCwgc2RsCndpbmRvdyBtaW5pbWl6ZWQpLiAgSXQgc3Vy
ZWx5IG1ha2VzIHNlbnNlIHRvIG1ha2UgdGhhdCB2aXNpYmxlIHRvIHRoZQpndWVzdCBzbyBpdCBj
YW4gdGhyb3R0bGUgZGlzcGxheSB1cGRhdGVzIHRvby4gIEknbSBub3Qgc3VyZSB2YmxhbmsgaXMK
dGhlIHdheSB0byBnbyB0aG91Z2gsIGd1ZXN0cyBtaWdodCBydW4gaW50byB2YmxhbmsgaXJxIHRp
bWVvdXRzIGluIGNhc2UKdGhlIHJlZnJlc2ggcmF0ZSBpcyB2ZXJ5IGxvdyAuLi4KCmNoZWVycywK
ICBHZXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
bnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVs
LWd2dC1kZXY=
