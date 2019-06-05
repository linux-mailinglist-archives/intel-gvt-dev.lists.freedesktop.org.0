Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E051335A37
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  5 Jun 2019 12:09:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AFE2897FF;
	Wed,  5 Jun 2019 10:09:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 723CE897FF
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  5 Jun 2019 10:09:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B95A53001463;
 Wed,  5 Jun 2019 10:09:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-131.ams2.redhat.com
 [10.36.117.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4E8BE1001DD2;
 Wed,  5 Jun 2019 10:09:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8B2FC17523; Wed,  5 Jun 2019 12:09:42 +0200 (CEST)
Date: Wed, 5 Jun 2019 12:09:42 +0200
From: "kraxel@redhat.com" <kraxel@redhat.com>
To: "Zhang, Tina" <tina.zhang@intel.com>
Subject: Re: [RFC PATCH v2 1/3] vfio: Use capability chains to handle device
 specific irq
Message-ID: <20190605100942.bceke6yqjynuwk3z@sirius.home.kraxel.org>
References: <20190604095534.10337-1-tina.zhang@intel.com>
 <20190604095534.10337-2-tina.zhang@intel.com>
 <20190605040446.GW9684@zhen-hp.sh.intel.com>
 <237F54289DF84E4997F34151298ABEBC87646B5C@SHSMSX101.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <237F54289DF84E4997F34151298ABEBC87646B5C@SHSMSX101.ccr.corp.intel.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Wed, 05 Jun 2019 10:09:45 +0000 (UTC)
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
 Zhenyu Wang <zhenyuw@linux.intel.com>, "Yuan, Hang" <hang.yuan@intel.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

ICBIaSwKCj4gPiBSZWFsbHkgbmVlZCB0byBzcGxpdCBmb3IgZGlmZmVyZW50IHBsYW5lcz8gSSdk
IGxpa2UgYQo+ID4gVkZJT19JUlFfU1VCVFlQRV9HRlhfRElTUExBWV9FVkVOVAo+ID4gc28gdXNl
ciBzcGFjZSBjYW4gcHJvYmUgY2hhbmdlIGZvciBhbGwuCgo+IFVzZXIgc3BhY2UgY2FuIGNob29z
ZSB0byB1c2VyIGRpZmZlcmVudCBoYW5kbGVycyBhY2NvcmRpbmcgdG8gdGhlCj4gc3BlY2lmaWMg
ZXZlbnQuIEZvciBleGFtcGxlLCB1c2VyIHNwYWNlIG1pZ2h0IG5vdCB3YW50IHRvIGhhbmRsZSBl
dmVyeQo+IGN1cnNvciBldmVudCBkdWUgdG8gcGVyZm9ybWFuY2UgY29uc2lkZXJhdGlvbi4gQmVz
aWRlcywgaXQgY2FuIHJlZHVjZQo+IHRoZSBwcm9iZSB0aW1lcywgYXMgd2UgZG9uJ3QgbmVlZCB0
byBwcm9iZSB0d2ljZSB0byBtYWtlIHN1cmUgaWYgYm90aAo+IGN1cnNvciBwbGFuZSBhbmQgcHJp
bWFyeSBwbGFuZSBoYXZlIGJlZW4gdXBkYXRlZC4KCkknZCBzdWdnZXN0IHRvIHVzZSB0aGUgdmFs
dWUgcGFzc2VkIHZpYSBldmVudGZkIGZvciB0aGF0LCBpLmUuIGluc3RlYWQKb2Ygc2VuZGluZyAi
MSIgdW5jb25kaXRpb25hbGx5IHNlbmQgYSBtYXNrIG9mIGNoYW5nZWQgcGxhbmVzLgoKY2hlZXJz
LAogIEdlcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50
ZWwtZ3Z0LWRldg==
