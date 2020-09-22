Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8C62741A1
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 22 Sep 2020 13:52:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FEC56E845;
	Tue, 22 Sep 2020 11:52:14 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49C0D6E137;
 Tue, 22 Sep 2020 11:52:07 +0000 (UTC)
IronPort-SDR: 9uCavif+KnR14WA8zW0AovBNHAsU9EXfZS4gzTdMTnRIzsu3Diu+AjjAtcVbYA5GVr0CVDuI4P
 Ygm3PXw84lRw==
X-IronPort-AV: E=McAfee;i="6000,8403,9751"; a="148335781"
X-IronPort-AV: E=Sophos;i="5.77,290,1596524400"; d="scan'208";a="148335781"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2020 04:52:06 -0700
IronPort-SDR: BXUn+8811XDPDoALAr7VLlQ3yeVJd6dvA0kF+63F5KK5ZgjWKrXW9Nv+CY3iIKrQQuC8oBuKpG
 SitCBk1dvGFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,290,1596524400"; d="scan'208";a="291271762"
Received: from irsmsx606.ger.corp.intel.com ([163.33.146.139])
 by fmsmga008.fm.intel.com with ESMTP; 22 Sep 2020 04:52:04 -0700
Received: from [10.251.84.40] (163.33.253.164) by IRSMSX606.ger.corp.intel.com
 (163.33.146.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 22 Sep
 2020 12:52:03 +0100
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>, intel-gfx <intel-gfx@lists.freedesktop.org>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, "Yuan, Hang"
 <hang.yuan@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>, intel-gvt-dev
 <intel-gvt-dev@lists.freedesktop.org>, "Wang, Zhi A" <zhi.a.wang@intel.com>
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
Subject: [PULL] topic/gvt-ww-lock
Message-ID: <4b78ef66-a74f-9156-62fb-bb733947b57e@intel.com>
Date: Tue, 22 Sep 2020 14:51:42 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
X-Originating-IP: [163.33.253.164]
X-ClientProxiedBy: irsmsx604.ger.corp.intel.com (163.33.146.137) To
 IRSMSX606.ger.corp.intel.com (163.33.146.139)
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

CkhpLAoKSGVyZSdzIHRoZSBwYXRjaCB3aGljaCBpbnRyb2R1Y2VzIEdWVC1nIHd3IGxvY2sgc3Vw
cG9ydCBhZ2FpbnN0IApkcm0taW50ZWwtZ3QtbmV4dCBicmFuY2guCgpUaGFua3MKCi0tCgpUaGUg
Zm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDQzMTZiMTlkZWUyN2NjNWNkMzRhOTVmZGJj
MGEzYTUyMzc1MDc3MDE6CgogwqAgZHJtL2k5MTU6IEZpeCB1bmluaXRpYWxpc2VkIHZhcmlhYmxl
IGluIGludGVsX2NvbnRleHRfY3JlYXRlX3JlcXVlc3QuIAooMjAyMC0wOS0yMSAxMTowOTo0NiAr
MDIwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIGdpdCByZXBvc2l0b3J5IGF0OgoKIMKgIGh0dHBz
Oi8vZ2l0aHViLmNvbS9pbnRlbC9ndnQtbGludXguZ2l0IHRhZ3MvZ3Z0LXd3LWxvY2stMDktMjIt
MjAyMAoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIGUxYjQ5YWUxNTU0NTFhYWEwMzll
ZWIyM2ZjZTgwOGM3MWEwMzgyODM6CgogwqAgZHJtL2k5MTUvZ3Z0OiBJbnRyb2R1Y2UgcGVyIG9i
amVjdCBsb2NraW5nIGluIEdWVCBzY2hlZHVsZXIuIAooMjAyMC0wOS0yMiAxMjowOTo1NiArMDMw
MCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KZ3Z0LXd3LWxvY2stMDktMjItMjAyMDoKCi0gSW50cm9kdWNlIHd3IGxvY2sg
c3VwcG9ydCBpbnRvIEdWVC1nLgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpaaGkgV2FuZyAoMSk6CiDCoMKgwqDCoMKgIGRy
bS9pOTE1L2d2dDogSW50cm9kdWNlIHBlciBvYmplY3QgbG9ja2luZyBpbiBHVlQgc2NoZWR1bGVy
LgoKIMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3NjaGVkdWxlci5jIHwgNjggCisrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKy0tLS0tLQogwqAxIGZpbGUgY2hhbmdlZCwgNTcgaW5zZXJ0
aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXYK
