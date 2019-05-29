Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E812DC6F
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 29 May 2019 14:07:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBB516E0EF;
	Wed, 29 May 2019 12:07:14 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5589D6E0D6;
 Wed, 29 May 2019 12:07:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 May 2019 05:07:12 -0700
X-ExtLoop1: 1
Received: from jlahtine-desk.ger.corp.intel.com (HELO localhost)
 ([10.252.3.30])
 by fmsmga001.fm.intel.com with ESMTP; 29 May 2019 05:07:10 -0700
MIME-Version: 1.0
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
In-Reply-To: <20190529090608.GB3211@zhen-hp.sh.intel.com>
References: <20190529090608.GB3211@zhen-hp.sh.intel.com>
Message-ID: <155913162906.17581.459441953247054618@jlahtine-desk.ger.corp.intel.com>
User-Agent: alot/0.7
Subject: Re: [PULL] gvt-fixes
Date: Wed, 29 May 2019 15:07:09 +0300
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>, "Lv, 
 Zhiyuan" <zhiyuan.lv@intel.com>, Zhi Wang <zhi.a.wang@intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

UXVvdGluZyBaaGVueXUgV2FuZyAoMjAxOS0wNS0yOSAxMjowNjowOCkKPiAKPiBIaSwKPiAKPiBI
ZXJlJ3MgbW9yZSBndnQgZml4ZXMgZm9yIDUuMi4gVGhpcyBpbmNsdWRlcyBmaXhlcyBmb3IgcmVj
ZW50bHkKPiBzZWVuIGFyYml0cmFyeSBETUEgbWFwIGZhdWx0IHdpdGggc2FuZSBndHQgZW50cnkg
aW5pdGlhbGl6YXRpb24sCj4gYW5kIHNldmVyYWwgZW5mb3JjZW1lbnQgZml4ZXMgZm9yIGUuZyBn
Z3R0IHJhbmdlIHZhbGlkYXRpb24sIHNvbWUKPiBtb2RlIHJlZ2lzdGVyIGhhbmRsZXIgYW5kIG9u
ZSBjbWQgbGVuZ3RoIGZpeCBmb3IgcGFyc2VyLgoKQXBwbHlpbmcgdGhlIHB1bGwgcmV2ZWFscyB0
aGF0IHRoZXJlIGlzIGEgcGF0Y2ggd2l0aCBzcGFjZSBtaXNzaW5nIGZyb20KdGhlIEZpeGVzOiBs
aW5lLiBDb3VsZCB5b3UgZml4IGl0IGFuZCByZS1nZW5lcmF0ZT8KCiIKRnJvbSBodHRwczovL2dp
dGh1Yi5jb20vaW50ZWwvZ3Z0LWxpbnV4CiAqIHRhZyAgICAgICAgICAgICAgICAgICAgICAgICBn
dnQtZml4ZXMtMjAxOS0wNS0yOSAtPiBGRVRDSF9IRUFECmRpbTogNWQ0M2JjNzZhZDk3ICgiZHJt
L2k5MTUvZ3Z0OiBJbml0aWFsaXplIGludGVsX2d2dF9ndHRfZW50cnkgaW4gc3RhY2siKTogU3Vi
amVjdCBpbiBmaXhlcyBsaW5lIGRvZXNuJ3QgbWF0Y2ggcmVmZXJlbmNlZCBjb21taXQ6CmRpbTog
ICAgIDc1OThlODcwMGU5YShkcm0vaTkxNS9ndnQ6IE1pc3NlZCB0byBjYW5jZWwgZG1hIG1hcCBm
b3IgZ2d0dCBlbnRyaWVzKQpkaW06IEVSUk9SOiBpc3N1ZXMgaW4gY29tbWl0cyBkZXRlY3RlZCwg
YWJvcnRpbmcKIgoKUmVnYXJkcywgSm9vbmFzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
