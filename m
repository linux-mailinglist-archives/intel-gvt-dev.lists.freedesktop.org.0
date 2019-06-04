Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7272F343AB
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  4 Jun 2019 12:04:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3189489598;
	Tue,  4 Jun 2019 10:04:32 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 211D189598
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  4 Jun 2019 10:04:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jun 2019 03:04:30 -0700
X-ExtLoop1: 1
Received: from gvt.bj.intel.com ([10.238.158.187])
 by orsmga007.jf.intel.com with ESMTP; 04 Jun 2019 03:04:28 -0700
From: Tina Zhang <tina.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	qemu-devel@nongnu.org
Subject: [RFC PATCH 2/3] ui/console: Introduce two new APIs
Date: Tue,  4 Jun 2019 17:58:46 +0800
Message-Id: <20190604095847.10532-3-tina.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190604095847.10532-1-tina.zhang@intel.com>
References: <20190604095847.10532-1-tina.zhang@intel.com>
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
Cc: kevin.tian@intel.com, zhenyuw@linux.intel.com,
 Tina Zhang <tina.zhang@intel.com>, alex.williamson@redhat.com,
 zhiyuan.lv@intel.com, hang.yuan@intel.com, zhi.a.wang@intel.com,
 kraxel@redhat.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Z3JhcGhpY19od19yZWZyZXNoIGlzIHVzZWQgYnkgZGlzcGxheSB0byBpbnZva2UgY29uc29sZSBy
ZWZyZXNoLgpkcHlfdXBkYXRlX2ludGVydmFsIGlzIHVzZWQgYnkgZGlzcGxheSB0byB1cGRhdGUg
Z3VpIHRpbWVyIGludGVydmFsLgoKU2lnbmVkLW9mZi1ieTogVGluYSBaaGFuZyA8dGluYS56aGFu
Z0BpbnRlbC5jb20+Ci0tLQogaW5jbHVkZS91aS9jb25zb2xlLmggfCAgMiArKwogdWkvY29uc29s
ZS5jICAgICAgICAgfCAzNSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMiBm
aWxlcyBjaGFuZ2VkLCAzNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS91aS9j
b25zb2xlLmggYi9pbmNsdWRlL3VpL2NvbnNvbGUuaAppbmRleCBmZWY5MDBkYjc2Li4zYjQ2MjY0
ZWZiIDEwMDY0NAotLS0gYS9pbmNsdWRlL3VpL2NvbnNvbGUuaAorKysgYi9pbmNsdWRlL3VpL2Nv
bnNvbGUuaApAQCAtMjc1LDYgKzI3NSw3IEBAIHZvaWQgcmVnaXN0ZXJfZGlzcGxheWNoYW5nZWxp
c3RlbmVyKERpc3BsYXlDaGFuZ2VMaXN0ZW5lciAqZGNsKTsKIHZvaWQgdXBkYXRlX2Rpc3BsYXlj
aGFuZ2VsaXN0ZW5lcihEaXNwbGF5Q2hhbmdlTGlzdGVuZXIgKmRjbCwKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB1aW50NjRfdCBpbnRlcnZhbCk7CiB2b2lkIHVucmVnaXN0ZXJf
ZGlzcGxheWNoYW5nZWxpc3RlbmVyKERpc3BsYXlDaGFuZ2VMaXN0ZW5lciAqZGNsKTsKK3ZvaWQg
ZHB5X3VwZGF0ZV9pbnRlcnZhbChRZW11Q29uc29sZSAqY29uLCB1aW50NjRfdCBpbnRlcnZhbCk7
CiAKIGJvb2wgZHB5X3VpX2luZm9fc3VwcG9ydGVkKFFlbXVDb25zb2xlICpjb24pOwogaW50IGRw
eV9zZXRfdWlfaW5mbyhRZW11Q29uc29sZSAqY29uLCBRZW11VUlJbmZvICppbmZvKTsKQEAgLTM3
OSw2ICszODAsNyBAQCB2b2lkIGdyYXBoaWNfY29uc29sZV9zZXRfaHdvcHMoUWVtdUNvbnNvbGUg
KmNvbiwKIHZvaWQgZ3JhcGhpY19jb25zb2xlX2Nsb3NlKFFlbXVDb25zb2xlICpjb24pOwogCiB2
b2lkIGdyYXBoaWNfaHdfdXBkYXRlKFFlbXVDb25zb2xlICpjb24pOwordm9pZCBncmFwaGljX2h3
X3JlZnJlc2goUWVtdUNvbnNvbGUgKmNvbik7CiB2b2lkIGdyYXBoaWNfaHdfaW52YWxpZGF0ZShR
ZW11Q29uc29sZSAqY29uKTsKIHZvaWQgZ3JhcGhpY19od190ZXh0X3VwZGF0ZShRZW11Q29uc29s
ZSAqY29uLCBjb25zb2xlX2NoX3QgKmNoYXJkYXRhKTsKIHZvaWQgZ3JhcGhpY19od19nbF9ibG9j
ayhRZW11Q29uc29sZSAqY29uLCBib29sIGJsb2NrKTsKZGlmZiAtLWdpdCBhL3VpL2NvbnNvbGUu
YyBiL3VpL2NvbnNvbGUuYwppbmRleCA2ZDIyODJkM2U5Li4zYTAyY2VhMzdkIDEwMDY0NAotLS0g
YS91aS9jb25zb2xlLmMKKysrIGIvdWkvY29uc29sZS5jCkBAIC0yNjgsNiArMjY4LDI0IEBAIHZv
aWQgZ3JhcGhpY19od191cGRhdGUoUWVtdUNvbnNvbGUgKmNvbikKICAgICB9CiB9CiAKK3ZvaWQg
Z3JhcGhpY19od19yZWZyZXNoKFFlbXVDb25zb2xlICpjb24pCit7CisgICAgRGlzcGxheVN0YXRl
ICpkczsKKyAgICBEaXNwbGF5Q2hhbmdlTGlzdGVuZXIgKmRjbDsKKworICAgIGlmICghY29uKSB7
CisgICAgICAgIGNvbiA9IGFjdGl2ZV9jb25zb2xlOworICAgIH0KKworICAgIGRzID0gY29uLT5k
czsKKworICAgIFFMSVNUX0ZPUkVBQ0goZGNsLCAmZHMtPmxpc3RlbmVycywgbmV4dCkgeworICAg
ICAgICBpZiAoZGNsLT5vcHMtPmRweV9yZWZyZXNoKSB7CisgICAgICAgICAgICBkY2wtPm9wcy0+
ZHB5X3JlZnJlc2goZGNsKTsKKyAgICAgICAgfQorICAgIH0KK30KKwogdm9pZCBncmFwaGljX2h3
X2dsX2Jsb2NrKFFlbXVDb25zb2xlICpjb24sIGJvb2wgYmxvY2spCiB7CiAgICAgYXNzZXJ0KGNv
biAhPSBOVUxMKTsKQEAgLTE0ODAsNiArMTQ5OCwyMyBAQCB2b2lkIHVwZGF0ZV9kaXNwbGF5Y2hh
bmdlbGlzdGVuZXIoRGlzcGxheUNoYW5nZUxpc3RlbmVyICpkY2wsCiAgICAgfQogfQogCit2b2lk
IGRweV91cGRhdGVfaW50ZXJ2YWwoUWVtdUNvbnNvbGUgKmNvbiwgdWludDY0X3QgaW50ZXJ2YWwp
Cit7CisgICAgRGlzcGxheUNoYW5nZUxpc3RlbmVyICpkY2w7CisgICAgRGlzcGxheVN0YXRlICpk
czsKKworICAgIGlmICghY29uKSB7CisgICAgICAgIHJldHVybjsKKyAgICB9CisKKyAgICBkcyA9
IGNvbi0+ZHM7CisKKyAgICBRTElTVF9GT1JFQUNIKGRjbCwgJmRzLT5saXN0ZW5lcnMsIG5leHQp
IHsKKyAgICAgICAgdXBkYXRlX2Rpc3BsYXljaGFuZ2VsaXN0ZW5lcihkY2wsIGludGVydmFsKTsK
KyAgICB9Cit9CisKKwogdm9pZCB1bnJlZ2lzdGVyX2Rpc3BsYXljaGFuZ2VsaXN0ZW5lcihEaXNw
bGF5Q2hhbmdlTGlzdGVuZXIgKmRjbCkKIHsKICAgICBEaXNwbGF5U3RhdGUgKmRzID0gZGNsLT5k
czsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pbnRlbC1ndnQtZGV2
